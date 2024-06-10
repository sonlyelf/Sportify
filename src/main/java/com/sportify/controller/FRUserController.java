package com.sportify.controller;

//@Controller
//@RequestMapping("/fruser")
public class FRUserController {
	
//	@Autowired
//	private UserService userService;
//
//	// 查找所有使用者
//	@GetMapping
//	public String findAllUsers(@ModelAttribute User user, Model model) {
//		
//		List<User> users = userService.findAllUsers();
//		
//		model.addAttribute("users", users);
//		model.addAttribute("method", "POST");
//		return "myCenter";
//	}
//
//	// 查詢單一使用者
//	@GetMapping("/user/{id}")
//	@ResponseBody
//	public String findById(@PathVariable Integer id, Model model) {
//		
//		Optional<User> user = userService.findById(id);
//		
//		if (user.isPresent()) {
//			model.addAttribute("user", user.get());
//			model.addAttribute("method", "POST");
//			return "myCenter";
//		} else {
//			model.addAttribute("message", "User not found");
//			return "redirect:/bkuser"; // 一个处理用户未找到的视图
//		}
//	}
//
//	// 修改使用者資料
//	@PutMapping
//	public String updateFRUser(@ModelAttribute User user, Model model) {
//		
//		int result = userService.replaceUser(user);
//		
//		String message = "更新使用者" + (result == 1 ? "成功" : "失敗");
//		model.addAttribute("message", message);
//		return "redirect:/myCenter";
//	}
//
//	// 更新使用者資料
//	@PutMapping("/userUpdate/{id}")
//	public String updateUser(@PathVariable Integer id, Model model) {
//		
//		Optional<User> user = userService.findById(id);
//		List<User> users = userService.findAllUsers();
//		
//		model.addAttribute("method", "PUT");
//		model.addAttribute("users", users);
//		model.addAttribute("user", user.get());
//		return "myCenter";
//	}
}
