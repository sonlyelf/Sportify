package com.sportify.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportify.dao.TradeDao;
import com.sportify.model.po.Trade;

@Service
public class TradeService {
	
	
	 @Autowired
	    private TradeDao tradeDao;

	    public Trade findTradeById(Integer id) {
	        return tradeDao.findById(id);
	    }

	    public List<Trade> findAllTrades() {
	        return tradeDao.findAllTrades();
	    }

	    public int createTrade(Trade trade) {
	      
	        trade.setUserId(trade.getUserId());
	        trade.setCourseId(trade.getCourseId());
	        trade.setCoursePrice(trade.getCoursePrice());
	        trade.setCreateDate(trade.getCreateDate());
	        trade.setPaymentStatus(trade.getPaymentStatus());
	        trade.setOrderStatus(trade.getOrderStatus());
	        
	        return tradeDao.createTrade(trade);
	    }

	    public int updateTrade(Trade trade) {
	      
	        trade.setUserId(trade.getUserId());
	        trade.setCourseId(trade.getCourseId());
	        trade.setCoursePrice(trade.getCoursePrice());
	        trade.setCreateDate(trade.getCreateDate());
	        trade.setPaymentStatus(trade.getPaymentStatus());
	        trade.setOrderStatus(trade.getOrderStatus());
	        return tradeDao.updateTrade(trade);
	    }

	    public int cancelTrade(Integer id) {
	        return tradeDao.cancelTrade(id);
	    }

	    public int updatePaymentStatus(Integer id, String paymentStatus) {
	        return tradeDao.updatePaymentStatus(id, paymentStatus);
	    }

	    public int updateOrderStatus(Integer id, String orderStatus) {
	        return tradeDao.updateOrderStatus(id, orderStatus);
	    }
	    
	    public Trade bookCourse(Trade trade) {
	        // 註冊預約
	        int result = tradeDao.createTrade(trade);
	        if (result == 1) {
	            return tradeDao.findById(trade.getId());
	        }
	        return null;
	    }
	    
	    public int cancelBooking(Integer id) {
	        // 取消預約
	        return tradeDao.cancelTrade(id);
	    }
	    public List<Trade> findTradesByUserId(Integer userId) {
	        return tradeDao.findTradesByUserId(userId);
	    }
	}