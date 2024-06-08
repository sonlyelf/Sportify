package com.sportify.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.sportify.dao.UserDao;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.User;


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
	public int addUser(UserRegisterDto userRegisterDto) {

		// 將 DTO 轉換成 PO
		User user = new User();
//		user.setName("kevin");
//		user.setBirthday(new Date());
//		user.setPassword("123456789");
//		user.setEmail("kevin@gmail.com");
//		user.setPhone("0987654321");
//	
//		// 檢查電子郵件是否已經存在
//	    Optional<User> existingUser = userDao.findByEmail(userRegisterDto.getEmail());
//	    if (existingUser.isPresent()) {
//	        // 如果電子郵件已經存在，可以根據你的需求返回錯誤或者執行其他處理
//	        return -1; // 或者 throw new RuntimeException("Email already exists!");
//	    }
		user.setName(userRegisterDto.getName());
		user.setPassword(userRegisterDto.getPassword());
		user.setBirthday(userRegisterDto.getBirthday());
		user.setEmail(userRegisterDto.getEmail());
		user.setPhone(userRegisterDto.getPhone());

		// 將 PO 傳入到 DAO
		int result = userDao.createUser(user);
		return result;
	}

	// 登入
	public UserLoginDto logintUser(UserLoginDto userLoginDto) {

		// 1.後端取資料庫user資料
		User user = userDao.findByEmail(userLoginDto.getEmail()).get();
		
		System.out.println(user);
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

}
