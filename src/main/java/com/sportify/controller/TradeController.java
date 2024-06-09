package com.sportify.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.sportify.model.po.Trade;
import com.sportify.service.TradeService;

import jakarta.servlet.http.HttpSession;
@Controller
@RequestMapping("/trades")
public class TradeController {
	
	 @Autowired
	    private TradeService tradeService;

	    @GetMapping("/userTrades")
	    public String getUserTrades(HttpSession session, Model model) {
	        Integer userId = (Integer) session.getAttribute("userId");
	        if (userId == null) {
	            model.addAttribute("error", "用戶未登錄");
	            return "error";
	        }
	        List<Trade> userTrades = tradeService.findTradesByUserId(userId);
	        model.addAttribute("userTrades", userTrades);
	        return "userTrades";
	    }

	    @GetMapping("/tradesAll")
	    public String getAllTrades(Model model) {
	        List<Trade> trades = tradeService.findAllTrades();
	        model.addAttribute("trades", trades);
	        return "trades";
	    }

	    @GetMapping("/trade/{id}")
	    public String getTradeById(@PathVariable Integer id, Model model) {
	        Trade trade = tradeService.findTradeById(id);
	        if (trade == null) {
	            model.addAttribute("error", "交易未找到");
	            return "error";
	        }
	        model.addAttribute("trade", trade);
	        return "tradeDetails";
	    }

	    @PostMapping
	    public String createTrade(@ModelAttribute Trade trade, Model model) {
	        tradeService.createTrade(trade);
	        model.addAttribute("message", "交易創建成功");
	        return "redirect:/trades";
	    }

	    @PutMapping("/trade/update")
	    public String updateTrade(@ModelAttribute Trade trade, Model model) {
	        tradeService.updateTrade(trade);
	        model.addAttribute("message", "交易修改成功");
	        return "redirect:/trades";
	    }

	    @PostMapping("/trade/cancel")
	    public String cancelTrade(@RequestParam Integer id, Model model) {
	        tradeService.cancelTrade(id);
	        model.addAttribute("message", "交易取消成功");
	        return "redirect:/trades";
	    }

	    @PutMapping("/trade/updatePaymentStatus")
	    public String updatePaymentStatus(@RequestParam Integer id, @RequestParam String paymentStatus, Model model) {
	        tradeService.updatePaymentStatus(id, paymentStatus);
	        model.addAttribute("message", "支付狀態更新成功");
	        return "redirect:/trades";
	    }

	    @PutMapping("/trade/updateOrderStatus")
	    public String updateOrderStatus(@RequestParam Integer id, @RequestParam String orderStatus, Model model) {
	        tradeService.updateOrderStatus(id, orderStatus);
	        model.addAttribute("message", "訂單狀態更新成功");
	        return "redirect:/trades";
	    }
	}
	


