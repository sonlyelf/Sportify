package com.sportify.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportify.model.dto.TradeDto;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;
import com.sportify.service.TradeService;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/trade")
public class TradeController {

    @Autowired
    private TradeService tradeService;

    @Autowired
    private UserService userService;

    
    //進入交易頁面
    @GetMapping("/userTrades")
    public String getUserTrades(HttpSession session, Model model) {
        UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");

        if (userLogin == null) {
            model.addAttribute("error", "用戶未登入");
            return "redirect:/member"; // 假設你有一個登錄頁面的路徑
        }

        User user = userService.findByEmail(userLogin.getEmail()).orElse(null);
        if (user == null) {
            model.addAttribute("error", "用戶未找到");
            return "error"; // 假設你有一個錯誤頁面
        }

        List<TradeDto> trades = tradeService.findTradesByUserId(user.getId());
        model.addAttribute("trades", trades);
        return "userTrades"; // 假設你有一個名為 userTrades 的視圖模板
    }

    
	//取得全部交易信息
    @GetMapping("/bktrades")
    public String getAllTrades(@ModelAttribute TradeDto tradeDto, Model model, HttpSession session) {
    	// 检查管理员是否已登录，如果未登录则重定向到登录页面
	    Boolean adminLoggedIn = (Boolean) session.getAttribute("adminloginStatus");
	    if (adminLoggedIn == null || !adminLoggedIn) {
	        return "redirect:/admin/login";
	    }
	   
    	
    	List<Trade> tradesAll = tradeService.findAllTrades();
        model.addAttribute("tradesAll", tradesAll);
        return "bktrades";
    }
    
    //根據交易編號取得交易信息回傳到購物頁面
    @GetMapping("/trade/{tradeId}")
    public String getTradeById(@PathVariable Integer tradeId, Model model) {
        Trade trade = tradeService.findTradeById(tradeId);

        if (trade == null) {
            model.addAttribute("error", "交易未找到");
            return "error";
        }

        model.addAttribute("trade", trade);
        return "redirect:/userTrades";
    }
    
    
	//創建交易
    @PostMapping("/trade/create")
    public String createTrade(@ModelAttribute Trade trade, HttpSession session, Model model) {
        UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");

        if (userLogin == null) {
            return "redirect:/member";
        }

        User user = userService.findByEmail(userLogin.getEmail()).orElse(null);
        if (user == null) {
            return "error";
        }

        try {
            trade.setUserId(user.getId());
            tradeService.createTrade(trade);

            List<TradeDto> userTrades = tradeService.findTradeByPaymentStatus(user.getId(), "未付款");
            model.addAttribute("userTrades", userTrades);
            model.addAttribute("message", "交易創建成功");

            return "redirect:/trade/userTrades";
        } catch (Exception e) {
            model.addAttribute("error", "創建交易失敗: " + e.getMessage());
            return "error";
        }
    }
    
    // 更新交易
    @PutMapping("/trade/update")
    public String updateTrade(@ModelAttribute TradeDto tradeDto, Model model) {
        try {
            tradeService.updateTrade(tradeDto);
            model.addAttribute("message", "交易修改成功");
            return "redirect:/userTrades";
        } catch (Exception e) {
            model.addAttribute("error", "更新交易失敗: " + e.getMessage());
            return "error";
        }
    }
    
 
    //刪除購物車訂單
    @DeleteMapping("/trade/cancel/{tradeId}")
    public String cancelTrade(@PathVariable Integer tradeId, Model model, HttpSession session) {
        UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");
        if (userLogin == null) {
            return "redirect:/member";
        }

        User user = userService.findByEmail(userLogin.getEmail()).orElse(null);
        if (user == null) {
            return "error";
        }

        int rowCount = tradeService.cancelTrade(tradeId);
        String message = "課程取消" + (rowCount == 1 ? "成功" : "失敗");
        model.addAttribute("message", message);

        List<TradeDto> userTrades = tradeService.findTradeByPaymentStatus(user.getId(), "未付款");
        model.addAttribute("userTrades", userTrades);
        return "redirect:/trade/userTrades";
    }
    
    
	// 更改交易狀態：未付款、已付款、已完成 購物車->我的中心
    @PostMapping("/trade/updateStatus")
    public String updatePaymentStatus(@RequestParam Integer id, 
							    		@RequestParam String paymentStatus, 
							    		@RequestParam String orderStatus, 
							    		HttpSession session, Model model) {
      
    	try {

            // 获取当前登录用户的信息
            UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");
            if (userLogin == null) {
                return "redirect:/member";
            }

            User user = userService.findByEmail(userLogin.getEmail()).orElse(null);
            if (user == null) {
                return "error";
            }
           
            // 更新支付状态和订单状态
         	int result=  tradeService.updateStatus(id, paymentStatus, orderStatus);
            if (result == 1) {
                session.removeAttribute("trades"); // 移除购物车信息
                model.addAttribute("message", "更新成功");
            } else {
                model.addAttribute("message", "更新失败");
            }

            return "redirect:/myCenter"; // 确保这里返回的是 myCenter 视图名称
        } catch (Exception e) {
            model.addAttribute("error", "支付失敗: " + e.getMessage());
            return "error";
        }
    }
    
    
    // 更改交易狀態：已取消、已退款 我的中心：已完成訂單->已取消訂單
    @PostMapping("/booking/updateStatus")
    public String updateOrderStatus(@RequestParam Integer id, 
							    		@RequestParam String paymentStatus, 
							    		@RequestParam String orderStatus, 
							    		HttpSession session, Model model) {
      
    	try {

            // 获取当前登录用户的信息
            UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");
            if (userLogin == null) {
                return "redirect:/member";
            }

            User user = userService.findByEmail(userLogin.getEmail()).orElse(null);
            if (user == null) {
                return "error";
            }
           
            // 更新支付状态和订单状态
         	int result=  tradeService.updateStatus(id, paymentStatus, orderStatus);
            if (result == 1) {
                session.removeAttribute("trades"); // 移除购物车信息
                model.addAttribute("message", "更新成功");
            } else {
                model.addAttribute("message", "更新失败");
            }

            return "redirect:/myCenter"; // 确保这里返回的是 myCenter 视图名称
        } catch (Exception e) {
            model.addAttribute("error", "支付失敗: " + e.getMessage());
            return "error";
        }
    }


  

	// 將課程加入購物車
    @PostMapping("/api/add-to-cart")
    public String addToCart(HttpSession session, HttpServletRequest request, Model model) {
        Integer courseId = Integer.parseInt(request.getParameter("booking-course"));
        UserLoginDto userLogin = (UserLoginDto) session.getAttribute("userLogin");

        if (userLogin == null) {
            model.addAttribute("error", "用戶未登入");
            return "redirect:/member";
        }

        User user = userService.findByEmail(userLogin.getEmail()).orElse(null);
        if (user == null) {
            model.addAttribute("error", "用戶未找到");
            return "error";
        }

        try {
            Trade trade = new Trade();
            trade.setCourseId(courseId);
            trade.setUserId(user.getId());
            trade.setCreateDate(new Timestamp(System.currentTimeMillis()));
            trade.setPaymentStatus("未付款");
            trade.setOrderStatus("未完成");

            tradeService.createTrade(trade);

            // 这里使用重定向并附带数据
            return "redirect:/trade/userTrades";
        } catch (Exception e) {
            model.addAttribute("error", "無法將課程添加到購物車: " + e.getMessage());
            return "error";
        }
    }
    
    
    // 獲取交易統計圖表
    @GetMapping("/getStatistics")
    public ResponseEntity<Map<String, Object>> getStatistics() {
        Map<String, Object> statistics = new HashMap<>();
        
        // 假设从 tradeService 中获取交易数据，并统计课程报名数量
        List<TradeDto> trades = tradeService.getAllTrades();
        Map<String, Integer> courseEnrollments = new HashMap<>();
        
        for (TradeDto trade : trades) {
            String courseName = trade.getCourse().getName(); // 假设课程名称在 TradeDto 中有对应的属性
            if (!courseEnrollments.containsKey(courseName)) {
                courseEnrollments.put(courseName, 0);
            }
            courseEnrollments.put(courseName, courseEnrollments.get(courseName) + 1);
        }
        
        // 将统计数据放入返回的 Map 中
        List<String> courseNames = new ArrayList<>(courseEnrollments.keySet());
        List<Integer> enrollmentCounts = new ArrayList<>(courseEnrollments.values());
        
        statistics.put("courseNames", courseNames);
        statistics.put("enrollmentCounts", enrollmentCounts);
        
        return ResponseEntity.ok().body(statistics);
    }

 
}