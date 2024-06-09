package com.sportify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class PathController {

	// 首頁
	@GetMapping("/index")
	public String getIndex() {

		return "index"; // 會自動指向/WEB-INF/view/.jsp
	}

	// 課程介紹
	@GetMapping("/announcement")
	public String getAnnouncement() {

		return "announcement"; // 會自動指向/WEB-INF/view/.jsp
	}

	// 交通資訊
	@GetMapping("/information")
	public String getInformation() {

		return "information"; // 會自動指向/WEB-INF/view/.jsp
	}
}
