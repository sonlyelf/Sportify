package com.sportify.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
	            // 用戶已存在，設置登入狀態為 false
	            session.setAttribute("loginStatus", false);
	            model.addAttribute("error", "此郵箱已被註冊，請重新註冊。");
	            return "register"; // 返回註冊頁面，顯示錯誤消息
	        }

	        // 如果郵箱未被使用，則執行註冊邏輯
	        int result;
	        try {
	            result = userService.addUser(userRegisterDto); // 新增 User
	            if (result == 0) {
	                // 註冊成功
	                model.addAttribute("resultMessage", "註冊成功");
	                // 註冊成功後，設置登入狀態為 true
	                session.setAttribute("loginStatus", true);
	                return "member"; // 導向會員頁面
	            } else {
	                // 註冊失敗
	                model.addAttribute("resultMessage", "註冊失敗");
	                session.setAttribute("loginStatus", false);
	                return "register"; // 返回註冊頁面，顯示錯誤消息
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            model.addAttribute("error", "系統錯誤，請稍後再試。");
	            session.setAttribute("loginStatus", false);
	            return "register"; // 返回註冊頁面，顯示系統錯誤消息
	        }
	    }
	
	
	@PostMapping("/user/login")
	@ResponseBody
	public String getLogin(Model model, @ModelAttribute UserLoginDto userLoginDto, HttpSession session)  {
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
	//檢查是否登入
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
	    

	   

	}