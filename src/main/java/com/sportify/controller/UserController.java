package com.sportify.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.service.UserService;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserService userService;

	// 註冊
	@PostMapping("/registeraaa")
	private String getRegister(Model model, UserRegisterDto userRegisterDto) {
		
		int result = userService.addUser(userRegisterDto); // 新增 User
		System.out.println("111111111111 " );
		model.addAttribute("resultMessage", result == 0 ? "註冊成功" : "註冊失敗");			
		return "index"; //會自動指向/WEB-INF/view/.jsp
		 
	}

	// 登入
	@PostMapping("/user/login")
	private String getLogin(Model model, UserLoginDto userLoginDto) {
	    //session.setAttribute("user", userLoginDto.getUsername());
		System.out.println(userLoginDto);
		return "myCenter"; //會自動指向/WEB-INF/view/.jsp
	}

	// 登出
	@PostMapping("/user/logout")
	private String getLogout() {
		//session.invalidate();
		return "index"; //會自動指向/WEB-INF/view/.jsp
	}
}
