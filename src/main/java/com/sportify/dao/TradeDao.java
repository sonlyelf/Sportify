package com.sportify.dao;

import java.util.List;

import com.sportify.model.po.Trade;

public interface TradeDao {
	 
	
	Trade findById(Integer id); // <-- 查詢>
	List<Trade> findAllTrades(); // <-- 查詢全部>
	int	 createTrade(Trade trade);
	int	 updateTrade(Trade trade);
	int	 cancelTrade(Integer id);  // <-- 取消整筆>
	int updatePaymentStatus(Integer id,String paymentStatus);// <-- 調整訂單狀態，無需整單取消 ：已付款：未付款 >
	int updateOrderStatus(Integer id, String orderStatus);	//更新狀態 訂單 已成功：已取消
	List<Trade> findTradesByUserId(Integer userId);
}
