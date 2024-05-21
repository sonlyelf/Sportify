package com.sportify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/path")
public class PathController {
	
	@GetMapping("/index")
	public String getIndex() {
		return "index"; //會自動指向/WEB-INF/view/hello.jsp
	}
	
	@GetMapping("/announcement")
	public String getAnnouncement() {
		return "announcement"; //會自動指向/WEB-INF/view/hello.jsp
		
	}
}
