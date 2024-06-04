package com.sportify.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping("/check-email")
    @ResponseBody
    public Map<String, Boolean> checkEmail(@RequestParam("email") String email) {
        Map<String, Boolean> response = new HashMap<>();
        Optional<User> existingUser = userService.findByEmail(email);
        response.put("exists", existingUser.isPresent());
        return response;
    }
	
	@PostMapping("/regist")
	public String getRegister(Model model, UserRegisterDto userRegisterDto, HttpSession session) {
	    // 檢查郵件是否已存在
	    Optional<User> existingUser = userService.findByEmail(userRegisterDto.getEmail());
	    if (existingUser.isPresent()) {
	        // 用户已存在，设置登录状态为 false
	        session.setAttribute("loginStatus", false);
	        model.addAttribute("error", "此郵箱已被註冊，請重新註冊。");
	        return "register"; // 返回注册页面，显示错误消息
	    }

	    // 如果邮箱未被使用，则执行注册逻辑
	    int result = userService.addUser(userRegisterDto); // 新增 User
	    model.addAttribute("resultMessage", result == 0 ? "註冊成功" : "註冊失敗");
	    // 注册成功后，设置登录状态为 true
	    session.setAttribute("loginStatus", true);
	    return "member"; // 会自动指向/WEB-INF/view/.jsp
	}
	
	

	
	@PostMapping("/user/login")
	public String getLogin(Model model, @ModelAttribute UserLoginDto userLoginDto, HttpSession session) {
	    // 模拟登录逻辑，实际应用中应从数据库验证用户信息
	  
		UserLoginDto userLogin = userService.logintUser(userLoginDto);
	    if (userLogin.getEmail() != null) {
	        session.setAttribute("loginStatus", true);
	        session.setAttribute("Email", userLoginDto.getEmail());
	        model.addAttribute("userLoginDto", userLoginDto);
	        return "myCenter"; // 会自动指向/WEB-INF/view/.jsp
	    } else {
	        model.addAttribute("loginError", "Invalid email or password");
	        return "member"; // 登录失败，返回登录页面
	    }
	}
	// 登出
	@PostMapping("/user/logout")
	private String getLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/index"; // 會自動指向/WEB-INF/view/.jsp
	}
}
