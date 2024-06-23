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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sportify.email.SSLEmail;
import com.sportify.model.dto.TradeDto;
import com.sportify.model.dto.UserInfoUpdateDto;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.dto.UserPwdUpdateDto;
import com.sportify.model.dto.UserRegisterDto;
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;
import com.sportify.security.KeyUtil;
import com.sportify.service.TradeService;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
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
			session.setAttribute("loginStatus", false);
			return "member"; // 会自动指向/WEB-INF/view/.jsp
		}

	// 登入頁面
	@GetMapping("/member")
	public String getMember() {

		return "member"; 
	}
	 
	
	// 登入
		@PostMapping("/user/login")
		@ResponseBody
		public String loginUser(Model model, @ModelAttribute UserLoginDto userLoginDto, HttpSession session) throws Exception {
		    // 调用 userService 的方法验证用户登录信息
		    UserLoginDto userLogin = userService.logintUser(userLoginDto);

		    if (userLogin.getEmail() != null) {
				session.setAttribute("loginStatus", true);
				session.setAttribute("userId", userLogin.getId());
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
		
		
	// 登出
	@PostMapping("/user/logout")
	private String getLogout(HttpSession session) {

		session.invalidate();

		return "redirect:/index"; // 會自動指向/WEB-INF/view/.jsp
	}
	
	

	
	// 管理:更新資料
	@PutMapping("/user/management/update")
	public String upDateUserInfo(UserInfoUpdateDto userInfoUpdateDto,Model model) {
		
		int result = userService.updateUserInfo(userInfoUpdateDto);
		if(result == 1) {
			model.addAttribute("message", "更新成功");
		}else {
			model.addAttribute("message", "更新失敗");
		}
		
		return "redirect:/myCenter";
	}
	
	
	
	// 管理:更新密碼
	@PutMapping("/user/management/password")
	public String upDateUserPassword(UserPwdUpdateDto userPwdUpdateDto,Model model) throws Exception {

		int result = userService.updateUserPassword(userPwdUpdateDto);
		if(result == 1) {
			model.addAttribute("message", "更新成功");
		}else {
			model.addAttribute("message", "更新失敗");
		}
		
		return "redirect:/myCenter";
	}

	

	// 會員報名的課程和訂單
	@GetMapping("/myCenter")
	public String getMyCenter(HttpSession session, Model model,HttpServletRequest request) {
	    // 从session中获取登录用户信息
	    UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");

	    if (userLogin == null) {
	        // 如果未登录，返回登录页面或错误信息
	        model.addAttribute("error", "用户未登录");
	        return "redirect:/member"; // 假设你有一个登录页面的路径
	    }

	    // 根据用户登录信息获取用户对象
		User user = userService.findByEmail(userLogin.getEmail()).get();

	    if (user == null) {
	        // 如果找不到用户，返回错误信息
	        model.addAttribute("error", "用户未找到");
	        return "error"; // 这里假设有一个错误页面
	    }

	    // 获取该用户的所有交易（预定课程）信息
	    List<TradeDto> userTrades = tradeService.findTradesByUserId(user.getId());

	    // 将用户和交易信息添加到模型中
	    model.addAttribute("user", user);
	    model.addAttribute("userTrades", userTrades);

	    return "myCenter"; // 返回会员中心页面的视图名
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
	
	
	
	// 後台頁面-查找所有使用者
	@GetMapping("/bkuser")
	public String findAllUsers(@ModelAttribute User user, Model model,HttpSession session) {
		// 检查管理员是否已登录，如果未登录则重定向到登录页面
	    Boolean adminLoggedIn = (Boolean) session.getAttribute("adminloginStatus");
	    if (adminLoggedIn == null || !adminLoggedIn) {
	        return "redirect:/admin/login";
	    }
	   
		
		List<User> users = userService.findAllUsers();
		
		model.addAttribute("users", users);
		model.addAttribute("method", "POST");
		return "bkuser";
	}
	

	
	// 後台頁面-刪除使用者
	@DeleteMapping("/deleteUser/{id}")
	public String delete(@PathVariable Integer id, Model model) {
		
		int rowcount = userService.deleteUser(id);
		String message = "刪除使用者" + (rowcount == 1 ? "成功" : "失敗");
		
		model.addAttribute("message", message);
		return "redirect:/bkuser";
	}
	
	
	//後台頁面-搜尋會員頁面
	@GetMapping("/searchMember")
	public String searchMember() {
		return "searchMember";
	}
	//後台頁面-搜尋會員方法
	@GetMapping("/searchUser")
    public String searchUser(@RequestParam(required = false) String name,
                             @RequestParam(required = false) String email,
                             Model model, HttpSession session) {
		
		// 检查管理员是否已登录，如果未登录则重定向到登录页面
	    Boolean adminLoggedIn = (Boolean) session.getAttribute("adminloginStatus");
	    if (adminLoggedIn == null || !adminLoggedIn) {
	        return "redirect:/admin/login";
	    }
	   
        Optional<User> user = Optional.empty();

        if (name != null && email != null) {
            user = userService.findByNameAndEmail(name, email);
        } else if (name != null) {
            user = userService.findByName(name);
        } else if (email != null) {
            user = userService.findByEmail(email);
        }

        user.ifPresent(u -> model.addAttribute("user", u));

        return "searchMember"; // 返回到搜索页面，显示搜索结果
    }

	
	

	// 後台頁面-更新使用者資料
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
	
	
	//後台頁面-查詢會員交易紀錄
	@GetMapping("/memberTransactions")
	public String searchTrade() {
		return "memberTransactions";
	}
	//後台頁面-搜尋會員交易紀錄方法
	@GetMapping("/bkuser/transactions")
	public String searchTransactions(@RequestParam(required = false) String name,
	                                 @RequestParam(required = false) String email,
	                                 Model model, HttpSession session) {
		
		// 检查管理员是否已登录，如果未登录则重定向到登录页面
	    Boolean adminLoggedIn = (Boolean) session.getAttribute("adminloginStatus");
	    if (adminLoggedIn == null || !adminLoggedIn) {
	        return "redirect:/admin/login";
	    }
	   
	    // 获取该用户的所有交易（预定课程）信息
	    List<TradeDto> searchuserTrades = tradeService.findByNameAndEmail(name, email);

	    // 将用户和交易信息添加到模型中
	    model.addAttribute("searchuserTrades", searchuserTrades);

	    return "memberTransactions";
	}
	
	

	// 後台頁面-新增使用者
	@PostMapping
	public String addUser(@ModelAttribute UserRegisterDto user, Model model) throws Exception {
		
		int result = userService.addUser(user);
		String message = "新增使用者" + (result == 1 ? "成功" : "失敗");
		
		model.addAttribute("message", message);
		model.addAttribute("method", "POST");
		return "redirect:/bkuser";
	}
	
	
	// 會員忘記密碼
	 @PostMapping("/forgetPassword")
	 @ResponseBody
	 public String forgetPassword(@RequestBody Map<String, String> requestBody) throws Exception {
	        String email = requestBody.get("email");
	        try {
	            System.out.println(email); // 將電子郵件地址打印到控制台，以便調試

	            // 發送郵件
	            SSLEmail.sendEmail(email);

	            // 查找用戶
	            Optional<User> user = userService.findByEmail(email);
	            if (user.isPresent()) {
	                // 更新用戶密碼
	                UserPwdUpdateDto userPwdUpdateDto = new UserPwdUpdateDto();
	                userPwdUpdateDto.setPassword("12345678"); // 這裡設置新的密碼
	                userPwdUpdateDto.setUserId(user.get().getId());
	                userService.updateUserPassword(userPwdUpdateDto); // 更新用戶密碼
	            }

	            return "{\"message\": \"success\"}"; // 返回成功的 JSON 響應給前端
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "{\"message\": \"error\"}"; // 返回錯誤的 JSON 響應給前端
	        }
	    }
	}
	
	
	
