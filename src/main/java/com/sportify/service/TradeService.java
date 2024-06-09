package com.sportify.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportify.dao.TradeDao;
import com.sportify.model.po.Trade;

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

		return tradeDao.findById(id);
	}

	/**
	 * 新增交易
	 * 
	 * @param trade
	 * @return
	 */
	public int createTrade(Trade trade) {

		trade.setUserId(trade.getUserId());
		trade.setCourseId(trade.getCourseId());
		trade.setCoursePrice(trade.getCoursePrice());
		trade.setCreateDate(trade.getCreateDate());
		trade.setPaymentStatus(trade.getPaymentStatus());
		trade.setOrderStatus(trade.getOrderStatus());

		return tradeDao.createTrade(trade);
	}

	/**
	 * 更新交易
	 * 
	 * @param trade
	 * @return
	 */
	public int updateTrade(Trade trade) {

		trade.setUserId(trade.getUserId());
		trade.setCourseId(trade.getCourseId());
		trade.setCoursePrice(trade.getCoursePrice());
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
	 * 更新付款狀態
	 * 
	 * @param id
	 * @param paymentStatus
	 * @return
	 */
	public int updatePaymentStatus(Integer id, String paymentStatus) {
		return tradeDao.updatePaymentStatus(id, paymentStatus);
	}

	/**
	 * 更新交易狀態
	 * 
	 * @param id
	 * @param orderStatus
	 * @return
	 */
	public int updateOrderStatus(Integer id, String orderStatus) {
		return tradeDao.updateOrderStatus(id, orderStatus);
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
			return tradeDao.findById(trade.getId());
		}
		return null;
	}

	/**
	 * 取消預約課程
	 * 
	 * @param id
	 * @return
	 */
	public int cancelBooking(Integer id) {
		// 取消預約
		return tradeDao.cancelTrade(id);
	}

	/**
	 * 根據 id 取得交易
	 * 
	 * @param userId
	 * @return
	 */
	public List<Trade> findTradesByUserId(Integer userId) {
		return tradeDao.findTradesByUserId(userId);
	}
}