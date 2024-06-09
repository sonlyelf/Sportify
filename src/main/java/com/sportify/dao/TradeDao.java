package com.sportify.dao;

import java.util.List;

import com.sportify.model.po.Trade;

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
	Trade findById(Integer id);

	/**
	 * 新增交易
	 * 
	 * @param trade
	 * @return
	 */
	int createTrade(Trade trade);

	/**
	 * 更新交易
	 * 
	 * @param trade
	 * @return
	 */
	int updateTrade(Trade trade);

	/**
	 * 取消交易
	 * 
	 * @param id
	 * @return
	 */
	int cancelTrade(Integer id);

	/**
	 * 更新付款狀態
	 * 調整訂單狀態，無需整單取消 ：已付款：未付款
	 * 
	 * @param id
	 * @param paymentStatus
	 * @return
	 */
	int updatePaymentStatus(Integer id, String paymentStatus);

	/**
	 * 更新交易狀態
	 * 更新狀態 訂單 已成功：已取消
	 * 
	 * @param id
	 * @param orderStatus
	 * @return
	 */
	int updateOrderStatus(Integer id, String orderStatus);

	/**
	 * 根據 UserId 查詢交易
	 * 
	 * @param userId
	 * @return
	 */
	List<Trade> findTradesByUserId(Integer userId);
}
