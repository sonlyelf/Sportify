package com.sportify.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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

    @GetMapping("/tradesAll")
    public String getAllTrades(Model model) {
        List<TradeDto> tradesAll = tradeService.getAllTrades();
        model.addAttribute("tradesAll", tradesAll);
        return "redirect:/userTrades";
    }

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

    @PostMapping("/api/get-cart")
    @ResponseBody
    public Map<String, Object> getCart(HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId");
        Map<String, Object> response = new HashMap<>();

        try {
            List<TradeDto> trades = tradeService.findTradesByUserId(userId);
            response.put("success", true);
            response.put("trades", trades);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", e.getMessage());
        }

        return response;
    }
}