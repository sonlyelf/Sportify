package com.sportify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/path")
public class PathController {
	
	@GetMapping("/index")
	public String getIndex() {
		return "index"; //會自動指向/WEB-INF/view/.jsp
	}
	
	@GetMapping("/announcement")
	public String getAnnouncement() {
		return "announcement"; //會自動指向/WEB-INF/view/.jsp
		
	}
	
	@GetMapping("/course")
	public String getCourse() {
		return "course"; //會自動指向/WEB-INF/view/.jsp
		
	}
	@GetMapping("/member")
	public String getMember() {
		return "member"; //會自動指向/WEB-INF/view/.jsp
		
	}
	@GetMapping("/register")
	public String getRegister() {
		return "register"; //會自動指向/WEB-INF/view/.jsp
		
	}
	
	
	@GetMapping("/information")
	public String getInformation() {
		return "information"; //會自動指向/WEB-INF/view/.jsp
		
	}
}
