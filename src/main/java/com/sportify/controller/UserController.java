package com.sportify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	// 註冊
	@PostMapping("/register")
	private String getRegister() {
		// 將要傳給jsp渲染的資料放在model中
//		model.addAttribute("name", "Rose");
//		model.addAttribute("time", new Date());
		
		// 請實作
		
		return ""; // 會自動指向/WEB-INF/view/hello.jsp
	}

	// 登入
	@PostMapping("/login")
	private String getLogin() {
		// 將要傳給jsp渲染的資料放在model中
//		model.addAttribute("name", "Rose");
//		model.addAttribute("time", new Date());
		
		// 請實作
		
		return ""; // 會自動指向/WEB-INF/view/hello.jsp
	}

	// 登出
	@PostMapping("/logout")
	private String getLogout() {
		// 將要傳給jsp渲染的資料放在model中
//		model.addAttribute("name", "Rose");
//		model.addAttribute("time", new Date());
		
		// 請實作
		
		return ""; // 會自動指向/WEB-INF/view/hello.jsp
	}
}
