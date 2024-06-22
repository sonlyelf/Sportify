package com.sportify.dao;

import java.util.List;
import java.util.Optional;

import com.sportify.model.dto.TradeDto;
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;

public interface TradeDao {

	/**
	 * 查詢全部交易
	 * 
	 * @return
	 */
	List<Trade> findAllTrades();

	/**
	 * 根據 id 查詢交易
	 * 
	 * @param id
	 * @return
	 */
	Trade findTradeById(Integer id);

	/**
	 * 新增交易
	 * 
	 * @param trade
	 * @return
	 */
	int createTrade(Trade trade);

	/**
	 * 修改交易
	 * 
	 * @param trade
	 * @return
	 */
	int updateTrade(TradeDto tradeDto);

	/**
	 * 取消交易
	 * 
	 * @param id
	 * @return
	 */
	int cancelTrade(Integer id);

	/**
	 * 更新狀態
	 * 調整狀態，無需整單取消 ：已付款 已完成
	 * 調整狀態，無需整單取消 ：已退款 已取消
	 * 
	 * @param id
	 * @param paymentStatus
	 * @return
	 */
	int updateStatus(Integer id, String paymentStatus ,String orderStatus);

	
	/**
	 * 根據 UserId 查詢交易
	 * 
	 * @param userId
	 * @return
	 */
	List<TradeDto> findTradesByUserId(Integer userId);
	
	
	/**

	
//	/**
//	 * 預約交易狀態
//	 * 更新狀態 訂單明細
//	 * 
//	 * @trade
//	 * @return
//	 */
//	int addBookingCourse(Trade trade);

	List<TradeDto> findByNameAndEmail(String username, String useremail);
	
	List<TradeDto> getAllTrades();
	
	
	List<TradeDto> findTradesByUserPaymentStatus(Integer userId ,String paymentStatus);
}
