package com.sportify.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportify.dao.TradeDao;
import com.sportify.model.dto.TradeDto;
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;

@Service
public class TradeService {

	@Autowired
	private TradeDao tradeDao;

	/**
	 * 取得所有的交易
	 * 
	 * @return
	 */
	public List<Trade> findAllTrades() {

		return tradeDao.findAllTrades();
	}

	/**
	 * 根據 id 取得交易
	 * 
	 * @param id
	 * @return
	 */
	public Trade findTradeById(Integer id) {

		return tradeDao.findTradeById(id);
	}

	/**
	 * 新增交易
	 * 
	 * @param trade
	 * @return
	 */
	public int createTrade(Trade trade) {
		return tradeDao.createTrade(trade);
	}

	/**
	 * 更新交易
	 * 
	 * @param trade
	 * @return
	 */
	public int updateTrade(TradeDto tradeDto) {
		TradeDto trade = new TradeDto();
		trade.setUserId(trade.getUserId());
		trade.setCourseId(trade.getCourseId());
		trade.setCreateDate(trade.getCreateDate());
		trade.setPaymentStatus(trade.getPaymentStatus());
		trade.setOrderStatus(trade.getOrderStatus());
		return tradeDao.updateTrade(trade);
	}

	/**
	 * 取消交易
	 * 
	 * @param id
	 * @return
	 */
	public int cancelTrade(Integer id) {
		return tradeDao.cancelTrade(id);
	}

	/**
	 * 更新交易狀態
	 * 
	 * @param id
	 * @param paymentStatus
	 * @return
	 */
	public int updateStatus(Integer id, String paymentStatus , String orderStatus) {
		return tradeDao.updateStatus(id, paymentStatus, orderStatus);
	}

	

	/**
	 * 預約課程
	 * 
	 * @param trade
	 * @return
	 */
	public Trade bookCourse(Trade trade) {
		// 註冊預約
		int result = tradeDao.createTrade(trade);
		if (result == 1) {
			return tradeDao.findTradeById(trade.getId());
		}
		return null;
	}



	/**
	 * 根據 id 取得交易
	 * 
	 * @param users
	 * @return
	 */
	public List<TradeDto> findTradesByUserId(Integer userId) {
		
		return tradeDao.findTradesByUserId(userId);
	}
	
	/**
	 * 取得所有的交易
	 * 
	 * @return
	 */
	public List<TradeDto> getAllTrades() {
		return tradeDao.getAllTrades();
	}

	public List<TradeDto> findTradeByPaymentStatus(Integer userId ,String paymentStatus) {
		return tradeDao.findTradesByUserPaymentStatus(userId,paymentStatus);
	}
	
}