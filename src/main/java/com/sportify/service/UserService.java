package com.sportify.service;

import org.springframework.stereotype.Service;

import com.sportify.model.dto.UserRegisterDto;

@Service
public class UserService {
	
	// 實作 UserDao
	
	// 註冊 User
	public int registerUser(UserRegisterDto userRegisterDto) {
		
		return 0;
	}
	
	// 登入
	public UserRegisterDto logintUser(UserRegisterDto userRegisterDto) {
		
		return null;
	}
	
	// 登出
	public int logoutUser(UserRegisterDto userRegisterDto) {
		
		return 0;
	}
}
