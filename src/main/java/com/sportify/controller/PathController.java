package com.sportify.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.Course;
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;
import com.sportify.service.CourseService;
import com.sportify.service.TradeService;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class PathController {

	@Autowired
	private CourseService courseService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private TradeService tradeService;

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

	// 課程報名
	@GetMapping("/course")
	public String getCourse(Model model) {
		List<Integer> groups = courseService.getAllGroupId();
		List<List<Course>> groupCourses = new ArrayList<>();

		groups.forEach(id -> {
			groupCourses.add(courseService.getGroupCourse(id));
		});

		model.addAttribute("groups", groupCourses);
		return "course";
	}

	// 我的中心 - 登入
	@GetMapping("/member")
	public String getMember() {

		return "member"; // 这里返回登录页面的视图名，具体视图名需要根据实际情况修改
	}

	// 註冊
	@GetMapping("/register")
	public String getRegister(@ModelAttribute UserRegisterDto userRegisterDto) {
		return "register"; // 會自動指向/WEB-INF/view/.jsp
	}

	// 交通資訊
	@GetMapping("/information")
	public String getInformation() {

		return "information"; // 會自動指向/WEB-INF/view/.jsp
	}

	// 我的中心
	@GetMapping("/myCenter")
	public String getmyCenter(HttpSession session, Model model) {
		
		UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");
		User user = userService.findByEmail(userLogin.getEmail()).get();
		
	    if (user != null) {
	        // 获取该用户的所有交易（预定课程）信息
	        List<Trade> trades = tradeService.findTradesByUserId(user.getId());

	        // 将用户和交易信息添加到模型中
	        model.addAttribute("user", user);
	        model.addAttribute("trades", trades);
	    } else {
	        // 处理找不到用户的情况
	        model.addAttribute("error", "用户未找到");
	    }

		System.out.println(user);
		model.addAttribute("user", user);
		
		return "myCenter"; // 这里返回会员中心页面的视图名，具体视图名需要根据实际情况修改

	}

}
