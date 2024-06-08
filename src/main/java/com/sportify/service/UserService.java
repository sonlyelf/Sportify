package com.sportify.service;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Date;
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
        // 將 DTO 轉換成 PO
        User user = new User();
        user.setName(userRegisterDto.getName());
        user.setBirthday(userRegisterDto.getBirthday());
        user.setEmail(userRegisterDto.getEmail());
        user.setPhone(userRegisterDto.getPhone());

        // 檢查電子郵件是否已經存在
        Optional<User> existingUser = userDao.findByEmail(userRegisterDto.getEmail());
        if (existingUser.isPresent()) {
            // 如果電子郵件已經存在，可以根據你的需求返回錯誤或者執行其他處理
            return -1; // 或者 throw new RuntimeException("Email already exists!");
        }

        // 生成鹽值
        byte[] salt = new byte[16];
        SecureRandom secureRandom = new SecureRandom();
        secureRandom.nextBytes(salt);
        System.out.printf("鹽: %s%n", Arrays.toString(salt));
		System.out.printf("鹽(Hex): %s%n", KeyUtil.bytesToHex(salt));
        String saltHex = KeyUtil.bytesToHex(salt);
        user.setSalt(saltHex);

        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        messageDigest.update(salt);
        // 哈希密碼
    	byte[] hashedBytes = messageDigest.digest();
		String hashedPassword = KeyUtil.bytesToHex(hashedBytes);
		System.out.printf("密碼: %s%n", hashedPassword);
		// 6.將 byte[] 轉 Hex
		String hashedHexString = KeyUtil.bytesToHex(hashedBytes);
		System.out.printf("原始密碼: %s%n", user.getPassword());
		System.out.printf("加鹽後的哈希密碼: %s%n", hashedHexString);
		
		// 8.生成使用者輸入密碼的哈希值
		messageDigest.reset(); // 重制
		messageDigest.update(salt); // 加鹽
		byte[] inputHashedBytes = messageDigest.digest(user.getPassword().getBytes());
		String inputHashedHexString = KeyUtil.bytesToHex(inputHashedBytes);
				
		// 9.驗證密碼
		if(inputHashedHexString.equals(hashedHexString)) {
			System.out.println("驗證成功");
		} else {
			System.out.println("驗證失敗");
		}

        // 將 PO 傳入到 DAO
        int result = userDao.createUser(user);
        return result;
    }


	   public UserLoginDto logintUser(UserLoginDto userLoginDto) throws Exception {
	        // 後端取資料庫user資料
	        Optional<User> userOptional = userDao.findByEmail(userLoginDto.getEmail());
	        if (!userOptional.isPresent()) {
	            return new UserLoginDto(); // 或者返回特定的錯誤信息
	        }
	        User user = userOptional.get();

	        // 前端資訊跟user資料做比對
	        String hashedInputPassword = hashPassword(userLoginDto.getPassword(), KeyUtil.bytesToHex(user.getSalt().getBytes()));
	        if (user.getPassword().equals(hashedInputPassword)) {
	            UserLoginDto userLogin = new UserLoginDto();
	            userLogin.setEmail(user.getEmail());
	            userLogin.setPassword(user.getPassword());
	            return userLogin;
	        }
	        return new UserLoginDto();
	    }

	    public int logoutUser(UserRegisterDto userRegisterDto) {
	        return 0;
	    }

	    private String hashPassword(String password, String salt) throws Exception {
	        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
	        messageDigest.update(salt.getBytes());
	        byte[] hashedBytes = messageDigest.digest(password.getBytes());
	        return KeyUtil.bytesToHex(hashedBytes);
	    }
	}


