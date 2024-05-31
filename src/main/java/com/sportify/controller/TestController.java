package com.sportify.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.User;
import com.sportify.service.UserService;

@Controller
@RequestMapping("/find")
public class TestController {
	
	@Autowired
	UserService userService;
	
	
	
	@GetMapping("/login")
	public String FindAllUsers(Model model) {
		List<User> users = userService.findAllUsers();
		model.addAttribute("users", users);
		return "test";
	}
	
	@PostMapping("/reg")
	public String createUser(Model model,  UserRegisterDto userRegisterDto) {
		try {
			int result = userService.addUser(userRegisterDto);
			String message = "新增會員" + ((result == 0)?"成功":"失敗");
			model.addAttribute("message", message);
		} catch (Exception e) {
			String message = "新增會員錯誤:";
			System.out.print(e);
			// Duplicate
			if(e.getMessage().contains("Duplicate")) {
				message += "該帳號已重複"; 
			} else {
				message += e.getMessage();
			}
			model.addAttribute("message", message);
		}
		return "test";
	}
	
	@PutMapping("/{userId}")
	public String updateUser(@PathVariable("userId") Integer userId, @Valid User user, BindingResult result, Model model) {
		// 判斷驗證是否通過 ?
		if(result.hasErrors()) { // 若有錯誤發生
			// 基本要傳給 user.jsp 的資訊
			userService.findById(userId);
			// 有錯誤的 user 資料也一併帶入給表單使用(內含錯誤的原因)
			// ** 並補 userId ;
			user.setId(userId);
			model.addAttribute("user", user);
			// 重要 ! 要傳 PUT 回去
			model.addAttribute("_method", "PUT");
			return "user/user";
		}
		
		return "test";
	}
	

}
