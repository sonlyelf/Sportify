package com.sportify.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportify.model.dto.AdminDto;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.po.Admin;
import com.sportify.service.AdminService;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	 @Autowired
	    private AdminService adminService;

	  // 显示管理员登录页面
    @GetMapping("/login")
    public String getAdminLogin() {
        return "adminLogin"; // 返回管理员登录页面的视图名
    }

    // 处理管理员登录请求
    @PostMapping("/login")
    @ResponseBody
    public String loginAdmin(@ModelAttribute AdminDto adminDto, HttpSession session ,Model model) {
        try {
            AdminDto loggedInAdmin = adminService.loginAdmin(adminDto.getAdminEmail(), adminDto.getAdminPassword());

            if (loggedInAdmin != null) {
                session.setAttribute("adminloginStatus", true);
                session.setAttribute("adminId", loggedInAdmin.getAdminId());
                session.setAttribute("Email", loggedInAdmin.getAdminEmail());
                session.setAttribute("adminLogin", loggedInAdmin);
              
                return "success"; // 登录成功，返回成功状态
            } else {
                return "fail"; // 登录失败，返回失败状态
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // 登录过程中发生异常，返回错误状态
        }
    }

    // 检查管理员是否已登录
    @GetMapping("/check-login")
    public ResponseEntity<Map<String, Object>> checkAdminLogin(HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        Boolean loginStatus = (Boolean) session.getAttribute("adminloginStatus");

        if (loginStatus != null && loginStatus) {
            response.put("adminLogin", true);
            response.put("email", session.getAttribute("Email"));
        } else {
            response.put("adminLogin", false);
        }

        return ResponseEntity.ok(response);
    }

    // 管理员登出
    @PostMapping("/logout")
    public String getAdminLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login"; // 重定向到管理员登录页面
    }
}
