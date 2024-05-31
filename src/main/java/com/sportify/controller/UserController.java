package com.sportify.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.User;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserService userService;

	// 註冊
	@PostMapping("/regist")
	private String getRegister(Model model, UserRegisterDto userRegisterDto) {

		int result = userService.addUser(userRegisterDto); // 新增 User
//		System.out.println("111111111111 ");
		model.addAttribute("resultMessage", result == 0 ? "註冊成功" : "註冊失敗");
		return "member"; // 會自動指向/WEB-INF/view/.jsp

	}
	
	
	
	private boolean authenticate(String email, String password) {
	    // TODO: 从数据库验证用户信息
	    return "user@example.com".equals(email) && "password".equals(password);
	}

	
	@PostMapping("/user/login")
	public String getLogin(Model model, @ModelAttribute UserLoginDto userLoginDto, HttpSession session) {
	    // 模拟登录逻辑，实际应用中应从数据库验证用户信息
	    boolean loginSuccessful = authenticate(userLoginDto.getEmail(), userLoginDto.getPassword());
	    
	    if (loginSuccessful) {
	        session.setAttribute("loginStatus", true);
	        session.setAttribute("Email", userLoginDto.getEmail());
	        model.addAttribute("userLoginDto", userLoginDto);
	        return "myCenter"; // 会自动指向/WEB-INF/view/.jsp
	    } else {
	        model.addAttribute("loginError", "Invalid email or password");
	        return "login"; // 登录失败，返回登录页面
	    }
	}
	// 登出
	@PostMapping("/user/logout")
	private String getLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/login"; // 會自動指向/WEB-INF/view/.jsp
	}
}
