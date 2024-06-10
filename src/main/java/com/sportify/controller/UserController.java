package com.sportify.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

import com.sportify.model.dto.UserInfoUpdateDto;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;
import com.sportify.service.TradeService;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpSession;

/**
 * User 相關資訊
 * 
 */
@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private TradeService tradeService;

	// 註冊頁面
	@GetMapping("/register")
	public String getRegister(@ModelAttribute UserRegisterDto userRegisterDto) {

		return "register"; // 會自動指向/WEB-INF/view/.jsp
	}

	// 註冊
	@PostMapping("/regist")
	public String getRegister(Model model, UserRegisterDto userRegisterDto, HttpSession session) throws Exception {

		// 檢查郵件是否已存在
		Optional<User> existingUser = userService.findByEmail(userRegisterDto.getEmail());
		if (existingUser.isPresent()) {
			// 用户已存在，设置登录状态为 false
			session.setAttribute("loginStatus", false);
			model.addAttribute("error1", "此郵箱已被註冊，請重新註冊。");
			return "register"; // 返回注册页面，显示错误消息
		}

		// 如果邮箱未被使用且密码长度符合要求，则执行注册逻辑
		if (userRegisterDto.getPassword().length() < 6) {
			model.addAttribute("error2", "密碼長度不得少於6碼。");
			return "register"; // 返回注册页面，显示错误消息
		}

		// 如果邮箱未被使用，则执行注册逻辑
		int result = userService.addUser(userRegisterDto);

		model.addAttribute("resultMessage", result == 0 ? "註冊成功" : "註冊失敗");
		// 注册成功后，设置登录状态为 true
		session.setAttribute("loginStatus", true);
		return "member"; // 会自动指向/WEB-INF/view/.jsp
	}

	// 登入頁面
	@GetMapping("/member")
	public String getMember() {

		return "member"; // 这里返回登录页面的视图名，具体视图名需要根据实际情况修改
	}

	// 登入
	@PostMapping("/user/login")
	@ResponseBody
	public String getLogin(Model model, @ModelAttribute UserLoginDto userLoginDto, HttpSession session)
			throws Exception {

		// 模拟登录逻辑，实际应用中应从数据库验证用户信息
		UserLoginDto userLogin = userService.logintUser(userLoginDto);

		if (userLogin.getEmail() != null) {
			session.setAttribute("loginStatus", true);
			session.setAttribute("Email", userLoginDto.getEmail());
			model.addAttribute("userLoginDto", userLoginDto);
			session.setAttribute("loginStatus", true);
			session.setAttribute("userLogin", userLogin);
			return "success"; // 会自动指向/WEB-INF/view/.jsp
		} else {
			model.addAttribute("loginError", "Invalid email or password");
			return "fail"; // 登录失败，返回登录页面
		}
	}

	// 登出
	@PostMapping("/user/logout")
	private String getLogout(HttpSession session) {

		session.invalidate();

		return "redirect:/index"; // 會自動指向/WEB-INF/view/.jsp
	}
	
	// 管理:更新資料
	@PutMapping("/user/management/update")
	public String upDateUserInfo(UserInfoUpdateDto userInfoUpdateDto) {
		
		int result = userService.updateUser(userInfoUpdateDto);
		
		return "redirect:/myCenter";
	}
	
	// 管理:更新密碼
	@PostMapping("/user/management/password")
	public String upDateUserPassword() {

		return "redirect:/myCenter";
	}

	// 檢查是否登入
	@GetMapping("/api/check-login")
	public ResponseEntity<Map<String, Object>> checkLogin(HttpSession session) {

		Map<String, Object> response = new HashMap<>();

		Boolean loginStatus = (Boolean) session.getAttribute("loginStatus");

		if (loginStatus != null && loginStatus) {
			response.put("loggedIn", true);
			response.put("email", session.getAttribute("Email"));
		} else {
			response.put("loggedIn", false);
		}

		return ResponseEntity.ok(response);
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
		return "myCenter"; // 这里返回会员中心页面的视图名，具体视图名需要根据实际情况修改
	}
	
	// [先不作] 確認 User 的 Email 是否存在 ?
	// @GetMapping("/check-email")
	// @ResponseBody
	//public Map<String, Boolean> checkEmail(@RequestParam("email") String email) {
	//
	//	Map<String, Boolean> response = new HashMap<>();
	//	Optional<User> existingUser = userService.findByEmail(email);
	//	response.put("exists", existingUser.isPresent());
	//
	//	return response;
	//}
	
	// 查找所有使用者
	@GetMapping
	public String findAllUsers(@ModelAttribute User user, Model model) {
		
		List<User> users = userService.findAllUsers();
		
		model.addAttribute("users", users);
		model.addAttribute("method", "POST");
		return "bkuser";
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
	

	// 修改使用者資料
	// @PutMapping
	// public String updateBkUser(@ModelAttribute User user, Model model) {		
	//	int result = userService.updateUser(user);
	//	String message = "更新使用者" + (result == 1 ? "成功" : "失敗");
	//	model.addAttribute("message", message);
	//	return "redirect:/bkuser";
	//}

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