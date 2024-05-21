package com.sportify.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/announcement")

public class UserController {
	@GetMapping
	public String hello(Model model) {
		
		//將要傳給jsp渲染的資料放在model中
		model.addAttribute("name", "Rose");
		model.addAttribute("time", new Date());
		return "announcement"; //會自動指向/WEB-INF/view/hello.jsp
		
	}
	


}
