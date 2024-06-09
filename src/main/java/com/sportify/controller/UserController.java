package com.sportify.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;
import com.sportify.service.TradeService;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private TradeService tradeService;

	// 確認 User 的 Email 是否存在 ?
	@GetMapping("/check-email")
	@ResponseBody
	public Map<String, Boolean> checkEmail(@RequestParam("email") String email) {

		Map<String, Boolean> response = new HashMap<>();
		Optional<User> existingUser = userService.findByEmail(email);
		response.put("exists", existingUser.isPresent());

		return response;
	}

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
		model.addAttribute("user", user);
		return "myCenter"; // 这里返回会员中心页面的视图名，具体视图名需要根据实际情况修改
	}
}