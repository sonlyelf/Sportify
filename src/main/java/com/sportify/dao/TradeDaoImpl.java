package com.sportify.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sportify.model.po.Trade;


@Repository
public class TradeDaoImpl implements TradeDao{
	
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	
	

	@Override
	public Trade findById(Integer id) {
		String sql = "select id, user_id, course_id, createDate, course_price, payment_status, order_status from trade where id=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Trade.class), id);
	}

	@Override
	public List<Trade> findAllTrades( ) {
		String sql = "select id, user_id, course_id, createDate, course_price, payment_status, order_status from trade";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Trade.class));
	}

	@Override
	public int createTrade(Trade trade) {
		String sql = "INSERT INTO trade (user_id, course_id, createDate, course_price, payment_status, order_status ) VALUES (?, ?, ?, ?, ?, ?);";
		return jdbcTemplate.update(sql, trade.getUserId(), trade.getCourseId(), trade.getCreateDate(), trade.getCoursePrice(), trade.getPaymentStatus(), trade.getOrderStatus());
	}

	@Override
	public int updateTrade(Trade trade) {
		String sql = "UPDATE trade SET user_id=?, course_id=?, createDate=?, course_price=?, payment_status=?, order_status=? WHERE id=?";
		return jdbcTemplate.update(sql, trade.getUserId(), trade.getCourseId(), trade.getCreateDate(), trade.getCoursePrice(), trade.getPaymentStatus(), trade.getOrderStatus(), trade.getId());
	}
	
	@Override //更新訂單已付款改變狀態
	public int updatePaymentStatus(Integer id, String paymentStatus) {
		String sql = "UPDATE trade SET payment_status = ?  WHERE id = ?";  //訂單 已付款：未付款 : 已取消
		return jdbcTemplate.update(sql, paymentStatus, id);

	}
	
	@Override //更新狀態 訂單 已成功：已取消
	public int updateOrderStatus(Integer id, String orderStatus) {
		String sql = "UPDATE trade SET order_status = ?  WHERE id = ?";  //訂單 已付款：未付款 : 已取消
		return jdbcTemplate.update(sql, orderStatus, id);
	   
	}

	
	
	@Override //取消整筆
	public int cancelTrade(Integer id) {
		String sql = "delete from trade where id=?";
		return jdbcTemplate.update(sql, id);
	}

	  @Override
	    public List<Trade> findTradesByUserId(Integer userId) {
	        String sql = "SELECT * FROM trade WHERE user_id = ?";
	        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Trade.class), userId);
	    }
	
	
	
/*	 private static class TradeRowMapper implements RowMapper<Trade> {
		 @Override
	 public Trade mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Trade trade = new Trade();
	            trade.setId(rs.getInt("id"));
	            trade.setUserId(rs.getInt("user_id"));
	            trade.setCourseId(rs.getInt("course_id"));
	            trade.setCreateDate(rs.getTimestamp("createDate"));
	            trade.setCoursePrice(rs.getInt("course_price"));
	            trade.setPaymentStatus(rs.getString("payment_status"));
	            trade.setOrderStatus(rs.getString("order_status"));
	            return trade;
	        }

	

}*/
}
