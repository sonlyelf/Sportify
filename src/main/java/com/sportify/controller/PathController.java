package com.sportify.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportify.model.dto.ClassInfoDto;
import com.sportify.service.ClassInfoService;
import com.sportify.service.ImageService;

@Controller
@RequestMapping
public class PathController {
	
	 @Autowired
	    private ClassInfoService classInfoService;
	    


	// 首頁
	@GetMapping("/index")
	public String getIndex() {

		return "index"; // 會自動指向/WEB-INF/view/.jsp
	}

	// 課程介紹
			@GetMapping("/announcement")
			public String getAnnouncement(Model model) {
				  List<ClassInfoDto> classInfoList = classInfoService.findAllClasses();
			       model.addAttribute("classInfoList", classInfoList);
				return "announcement"; // 會自動指向/WEB-INF/view/.jsp
			}
		

	// 交通資訊
	@GetMapping("/information")
	public String getInformation() {

		return "information"; // 會自動指向/WEB-INF/view/.jsp
	}
}
