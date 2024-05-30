package com.sportify.service;


import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.sportify.dao.UserDao;
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
	
	public Optional <User> findById(Integer id) {
		return userDao.findById(id);
	}

	public Optional <User> findByEmail(String email) {
		return userDao.findByEmail(email);
	}

	// 更新 User
	public int updateUser(Integer userId, User user) {
		return userDao.updateUser(userId, user);
	}
	

	// 刪除 User
	public int deleteUser(Integer id) {
		return userDao.deleteUser(id);
	}

	// 新增 User
	public int createUser(User user) {
		
		return userDao.createUser(user);
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
		user.setName(userRegisterDto.getSname());
		user.setPassword(userRegisterDto.getSpassword());
		user.setBirthday(userRegisterDto.getSbirthday());
		user.setEmail(userRegisterDto.getSemail());
		user.setPhone(userRegisterDto.getSphone());

		// 將 PO 傳入到 DAO
		int result = userDao.createUser(user);
		
		return result;
	}
	
	// 登入
	public UserRegisterDto logintUser(UserRegisterDto userRegisterDto) {
		User user = new User();
		user.setEmail(userRegisterDto.getSemail());
		user.setPassword(userRegisterDto.getSpassword());
		return null;
	}
	
	// 登出
	public int logoutUser(UserRegisterDto userRegisterDto) {
		
		return 0;
	}

	

	
}
