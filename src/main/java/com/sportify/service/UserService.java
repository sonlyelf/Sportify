package com.sportify.service;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportify.dao.UserDao;
import com.sportify.model.dto.UserInfoUpdateDto;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserPwdUpdateDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.User;
import com.sportify.security.KeyUtil;

import jakarta.servlet.ServletOutputStream;

@Service
public class UserService {

	// 實作 UserDao
	@Autowired
	private UserDao userDao;

	/**
	 * 取得所有 User
	 * 
	 * @return
	 */
	public List<User> findAllUsers() {

		return userDao.FindAllUsers();
	}

	/**
	 * 根據 id 取得 User
	 * 
	 * @param id
	 * @return
	 */
	public Optional<User> findById(Integer id) {
		return userDao.findById(id);
	}

	// 根據 email 取得 User
	public Optional<User> findByEmail(String email) {

		return userDao.findByEmail(email);
	}
	 /**
     * 根據名字查詢 User
     * 
     * @param name
     * @return
     */
    public Optional<User> findByName(String name) {
        return userDao.findByName(name);
    }

    /**
     * 根據名字和Email查詢 User
     * 
     * @param name
     * @param email
     * @return
     */
    public Optional<User> findByNameAndEmail(String name, String email) {
        return userDao.findByNameAndEmail(name, email);
    }

	/**
	 * 更新 UserInfo
	 * 
	 * @param user
	 * @return
	 */
	public int updateUserInfo(UserInfoUpdateDto userInfoUpdateDto) {
		
		User user = new User();
		Optional<User> userData = userDao.findById(userInfoUpdateDto.getUserId());
		
		// DTO 轉 PO
		if(userData.isPresent()) {
			user = userData.get();
			user.setName(userInfoUpdateDto.getUsername());
			user.setPhone(userInfoUpdateDto.getPhone());
		}
		
		return userDao.updateUserInfo(user);
	}
	
	/**
	 * 更新 UserPassword
	 * 
	 * @param userPwdUpdateDto
	 * @return
	 * @throws Exception
	 */
	public int updateUserPassword(UserPwdUpdateDto userPwdUpdateDto) throws Exception {
		
		User user = new User();
		Optional<User> userData = userDao.findById(userPwdUpdateDto.getUserId());
		String[] hashAndSalt = passwordEncryption(userPwdUpdateDto.getPassword());
		
		// DTO 轉 PO
		if(userData.isPresent()) {
			user = userData.get();
			user.setPassword(hashAndSalt[0]);
			user.setSalt(hashAndSalt[1]);
		}
		
		return userDao.updateUserPassword(user);
	}

	/**
	 * 刪除 User
	 * 
	 * @param id
	 * @return
	 */
	public int deleteUser(Integer id) {

		return userDao.deleteUser(id);
	}

	/**
	 * 註冊 User
	 * 
	 * @param userRegisterDto
	 * @return
	 * @throws Exception
	 */
	public int addUser(UserRegisterDto userRegisterDto) throws Exception {

		// 1. 取得 加密的 密碼 與鹽巴
		String[] hashAndSalt = passwordEncryption(userRegisterDto.getPassword());

		// 2. 將 DTO 轉換成 PO
		User user = new User();
		user.setName(userRegisterDto.getName());
		// user.setPassword(userRegisterDto.getPassword());
		user.setPassword(hashAndSalt[0]);
		user.setBirthday(userRegisterDto.getBirthday());
		user.setEmail(userRegisterDto.getEmail());
		user.setPhone(userRegisterDto.getPhone());
		user.setSalt(hashAndSalt[1]);

		// 3. 將 PO 傳入到 DAO
		int result = userDao.createUser(user);
	
		return result;
	}

	// 登入 User
	public UserLoginDto logintUser(UserLoginDto userLoginDto) throws Exception {

		// 1. 後端取資料庫 user 資料
				User user = userDao.findByEmail(userLoginDto.getEmail()).get();

				// 2. 利用鹽巴取得加密過的密碼
				String hashedHexString = passwordDecryption(userLoginDto.getPassword(), KeyUtil.hexToBytes(user.getSalt()));

				// 3. 前端資訊跟user資料做比對
				if (user.getPassword().equals(hashedHexString)) {
					UserLoginDto userLogin = new UserLoginDto();
					userLogin.setEmail(user.getEmail());
					userLogin.setPassword(user.getPassword());
					return userLogin;
				}

				return new UserLoginDto();
			}

	/**
	 * [加密] 使用 salt 及 SHA-256
	 * 
	 * @param password
	 * @return
	 * @throws Exception
	 */
	private String[] passwordEncryption(String password) throws Exception {

		// 1. 隨機生成一個鹽(Salt)
		byte[] salt = new byte[16];
		SecureRandom secureRandom = new SecureRandom();
		secureRandom.nextBytes(salt); // 填充隨機值

		// 2. 獲取 SHA-256 消息摘要物件來幫助我們生成密碼的哈希
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
		messageDigest.update(salt); // 加鹽

		// 3. 將密碼轉換為 byte[] 然後生成哈希
		byte[] hashedBytes = messageDigest.digest(password.getBytes());

		// 4. 將 byte[] 轉 Hex
		String hashedHexString = KeyUtil.bytesToHex(hashedBytes);

		String[] result = new String[2]; // 返回原始密码和盐的哈希值
		result[0] = hashedHexString; // 哈希后的密码
		result[1] = KeyUtil.bytesToHex(salt); // 盐的十六进制字符串

		return result;
	}

	/**
	 * [加密] 利用鹽巴取得加密過的密碼
	 * 
	 * @param password
	 * @param salt
	 * @return
	 * @throws Exception
	 */
	private String passwordDecryption(String password, byte[] salt) throws Exception {

		// 1. 獲取 SHA-256 消息摘要物件來幫助我們生成密碼的哈希
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
		messageDigest.update(salt); // 加鹽 (資料庫的鹽巴)

		// 2. 將密碼轉換為 byte[] 然後生成哈希
		byte[] hashedBytes = messageDigest.digest(password.getBytes());

		// 3. 將 byte[] 轉 Hex
		String hashedHexString = KeyUtil.bytesToHex(hashedBytes);

		return hashedHexString;
	}

	
}
