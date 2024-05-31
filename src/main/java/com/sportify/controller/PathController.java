package com.sportify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.User;

@Controller
@RequestMapping
public class PathController {
	
	// 首頁
	@GetMapping("/index")
	public String getIndex() {
		
		
		return "index"; //會自動指向/WEB-INF/view/.jsp
	}
	
	// 課程介紹
	@GetMapping("/announcement")
	public String getAnnouncement() {
		
		
		return "announcement"; //會自動指向/WEB-INF/view/.jsp
	}
	
	// 課程報名
	@GetMapping("/course")
	public String getCourse() {
		
		
		return "course"; //會自動指向/WEB-INF/view/.jsp
	}
	
	// 我的中心 - 登入
	@GetMapping("/member")
	public String getMember() {
		
		return "member"; //會自動指向/WEB-INF/view/.jsp
	}
	
	// 註冊
	@GetMapping("/register")
	public String getRegister(@ModelAttribute UserRegisterDto userRegisterDto) {
		return "register"; //會自動指向/WEB-INF/view/.jsp
	}
	
	// 交通資訊
	@GetMapping("/information")
	public String getInformation() {
	
		return "information"; //會自動指向/WEB-INF/view/.jsp
	}
	
	// 我的中心
	@GetMapping("/myCenter")
	public String getMyCenter() {
		
		return "myCenter"; //會自動指向/WEB-INF/view/.jsp
	}
}

