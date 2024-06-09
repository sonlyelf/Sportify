package com.sportify.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.User;
import com.sportify.service.UserService;

@Controller
@RequestMapping("/bkuser")
public class BKUserController {
	
	@Autowired
	private UserService userService;

	// 查找所有使用者
	@GetMapping
	public String findAllUsers(@ModelAttribute User user, Model model) {
		
		List<User> users = userService.findAllUsers();
		
		model.addAttribute("users", users);
		model.addAttribute("method", "POST");
		return "bkuser";
	}

	// 查詢單一使用者
	@GetMapping("/user/{id}")
	@ResponseBody
	public String findById(@PathVariable Integer id, Model model) {
		
		Optional<User> user = userService.findById(id);
		
		if (user.isPresent()) {
			model.addAttribute("user", user.get());
			model.addAttribute("method", "POST");
			return "bkuser";
		} else {
			model.addAttribute("message", "User not found");
			return "redirect:/bkuser"; // 一个处理用户未找到的视图
		}
	}

	// 查詢會員email
	@GetMapping("/email")
	public String findByEmail(@RequestParam("email") String email, Model model) {
		
		Optional<User> user = userService.findByEmail(email);
		
		if (user.isPresent()) {
			model.addAttribute("user", user.get());
			model.addAttribute("method", "POST");
			return "bkuser";
		} else {
			model.addAttribute("message", "User not found");
			return "redirect:/bkuser"; // 一个处理用户未找到的视图
		}
	}

	// 刪除使用者
	@DeleteMapping("/deleteUser/{id}")
	public String delete(@PathVariable Integer id, Model model) {
		
		int rowcount = userService.deleteUser(id);
		String message = "刪除使用者" + (rowcount == 1 ? "成功" : "失敗");
		
		model.addAttribute("message", message);
		return "redirect:/bkuser";
	}

	// 修改使用者資料
	@PutMapping
	public String updateBkUser(@ModelAttribute User user, Model model) {
		
		int result = userService.updateUser(user);
		String message = "更新使用者" + (result == 1 ? "成功" : "失敗");
		
		model.addAttribute("message", message);
		return "redirect:/bkuser";
	}

	// 更新使用者資料
	@PutMapping("/userUpdate/{id}")
	public String updateUser(@PathVariable Integer id, Model model) {
		
		Optional<User> user = userService.findById(id);
		
		if(user.isPresent()) {
			model.addAttribute("user", user.get());			
		}
		model.addAttribute("method", "PUT");
		model.addAttribute("users", userService.findAllUsers());
		return "bkuser";
	}

	// 新增使用者
	@PostMapping
	public String addUser(@ModelAttribute UserRegisterDto user, Model model) throws Exception {
		
		int result = userService.addUser(user);
		String message = "新增使用者" + (result == 1 ? "成功" : "失敗");
		
		model.addAttribute("message", message);
		model.addAttribute("method", "POST");
		return "redirect:/bkuser";
	}
}
