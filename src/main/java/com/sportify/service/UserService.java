package com.sportify.service;


import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.sportify.dao.UserDao;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.User;
import com.sportify.security.KeyUtil;


@Service
public class UserService {

	// 實作 UserDao
	@Autowired
	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	// 取得所有 User
	public List<User> findAllUsers() {
		return userDao.FindAllUsers();
	}

	public Optional<User> findById(Integer id) {
		return userDao.findById(id);
	}

	public Optional<User> findByEmail(String email) {
	
		return userDao.findByEmail(email);
	}

	// 更新 User
	public int updateUser( User user) {
		return userDao.updateUser(user);
	}

	// 刪除 User
	public int deleteUser(Integer id) {
		return userDao.deleteUser(id);
	}
	
	
	//前台會員更新
	public int replaceUser(User user) {
		return userDao.replaceUser(user);
	}

	// 註冊 User
	@PostMapping
	public int addUser(UserRegisterDto userRegisterDto) throws Exception {
		
		//String password = userRegisterDto.getPassword();
		String[] hashAndSalt = passwordToHash(userRegisterDto.getPassword());
		
//		String[] hashAndSalt = passwordToHash("passwordBase64");
//		String passwordBase64 = hashAndSalt[0];
//		String salt = hashAndSalt[1];
//		String inputHashedHexString = salt + passwordBase64;
//		System.out.println(inputHashedHexString);
//		
//		if(password.equals(passwordBase64)) {
//			System.out.println("驗證成功");
//		} else {
//			System.out.println("驗證失敗");
//		}

		// 將 DTO 轉換成 PO
		User user = new User();
		user.setName(userRegisterDto.getName());
		//user.setPassword(userRegisterDto.getPassword());
		user.setBirthday(userRegisterDto.getBirthday());
		user.setEmail(userRegisterDto.getEmail());
		user.setPhone(userRegisterDto.getPhone());
		user.setPassword(hashAndSalt[0]);
	    user.setSalt( hashAndSalt[1] );

		// 將 PO 傳入到 DAO
		int result = userDao.createUser(user);
		return result;
	}

	// 登入
	public UserLoginDto logintUser(UserLoginDto userLoginDto) throws Exception {
		
			User user = userDao.findByEmail(userLoginDto.getEmail()).get();
			
			
		
			// 保存的密碼
		        String [] storedSaltHex = passwordToHash(userLoginDto.getPassword());
		        userLoginDto.setPassword(storedSaltHex[0]);
//
//		// 1.後端取資料庫user資料
//		User user = userDao.findByEmail(userLoginDto.getEmail()).get();
		
		System.out.println(user);
		System.out.println(userLoginDto.getPassword());
		
		// 2.前端資訊跟user資料做比對
		if (user.getPassword().equals(userLoginDto.getPassword())) {
			UserLoginDto userLogin = new UserLoginDto();
			userLogin.setEmail(user.getEmail());
			userLogin.setPassword(user.getPassword());
			return userLogin; 
		}
		
			
		    return new UserLoginDto();
		
	}


	
	
	// 登出
	public int logoutUser(UserRegisterDto userRegisterDto) {

		return 0;
	}
	
	private String [] passwordToHash(String password) throws Exception {
				
		String[] result = new String[2];
		
				
		// 1.設定一個密碼
		//String password = "1234";
				
		// 2.隨機生成一個鹽(Salt)
		byte[] salt = new byte[16];
		SecureRandom secureRandom = new SecureRandom();
		secureRandom.nextBytes(salt); // 填充隨機值
		System.out.printf("鹽: %s%n", Arrays.toString(salt));
		System.out.printf("鹽(Hex): %s%n", KeyUtil.bytesToHex(salt));
				
		// 3.獲取 SHA-256 消息摘要物件來幫助我們生成密碼的哈希
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
				
		// 4.加鹽
		messageDigest.update(salt);
				
		// 5.將密碼轉換為 byte[] 然後生成哈希
		byte[] hashedBytes = messageDigest.digest(password.getBytes());
				
		// 6.將 byte[] 轉 Hex
		String hashedHexString = KeyUtil.bytesToHex(hashedBytes);
		System.out.printf("原始密碼: %s%n", password);
		System.out.printf("加鹽後的哈希密碼: %s%n", hashedHexString);
				
		messageDigest.reset(); // 重制
		messageDigest.update(salt); // 加鹽
		byte[] inputHashedBytes = messageDigest.digest(password.getBytes());

		// 返回原始密码和盐的哈希值
		    result[0] = hashedHexString; // 哈希后的密码
		    result[1] = KeyUtil.bytesToHex(salt); // 盐的十六进制字符串

		   return result;
	}
	
	

}
