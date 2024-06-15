package com.sportify.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sportify.model.dto.TradeDto;
import com.sportify.model.po.Course;
import com.sportify.model.po.Trade;
import com.sportify.model.po.User;

@Repository
public class TradeDaoImpl implements TradeDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Trade findTradeById(Integer id) {
		
		String sql = "SELECT id, user_id, course_id, createDate, payment_status, order_status "
					+ "FROM trade "
					+ "WHERE id=?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Trade.class), id);
	}

	@Override
	public List<Trade> findAllTrades() {
		
		String sql = "SELECT id, user_id, course_id, createDate,  payment_status, order_status "
					+ "FROM trade";
		
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Trade.class));
	}


	@Override
	public int createTrade(Trade trade) {
		System.out.println("dao:" + trade);
		String sql = "INSERT INTO trade (user_id, course_id, createDate,  payment_status, order_status ) "
					+ "VALUES (?, ?, ?, ?, ?);";
		
		return jdbcTemplate.update(sql, 
				trade.getUserId(), trade.getCourseId(), trade.getCreateDate(),
				trade.getPaymentStatus(), trade.getOrderStatus());
	}

	@Override
	public int updateTrade(TradeDto tradeDto) {
		
		String sql = "UPDATE trade "
					+ "SET user_id=?, course_id=?, createDate=?, payment_status=?, order_status=? "
					+ "WHERE id=?";
		
		return jdbcTemplate.update(sql, tradeDto.getUserId(), tradeDto.getCourseId(), tradeDto.getCreateDate(),
				 tradeDto.getPaymentStatus(), tradeDto.getOrderStatus(), tradeDto.getId());
	}

	@Override // 更新訂單已付款改變狀態
	public int updateStatus(Integer id, String paymentStatus ,String orderStatus) {
		
		String sql = "UPDATE trade "
					+ "SET payment_status = ? ,order_status = ? "
					+ "WHERE id = ?"; // 訂單 已付款：未付款 : 已取消
		
		return jdbcTemplate.update(sql, paymentStatus,orderStatus, id);

	}

	

	@Override // 取消整筆
	public int cancelTrade(Integer id) {
		
		String sql = "DELETE FROM trade "
					+ "WHERE id=?";
		
		return jdbcTemplate.update(sql, id);
	}

	@Override
	public List<TradeDto> findTradesByUserId(Integer userId) {
	    String sql = "SELECT " +
	                 "t.id AS id, t.user_id AS userId, t.course_id AS courseId, t.createDate AS createDate, " +
	                 "t.payment_status AS paymentStatus, t.order_status AS orderStatus, " +
	                 "u.id AS user_id, u.name AS user_name, " +
	                 "c.id AS courseId, c.name AS courseName, c.price AS coursePrice ,c.startDate AS startDate, c.endDate AS endDate,c.day AS day " +
	                 "FROM trade t " +
	                 "JOIN user u ON t.user_id = u.id " +
	                 "JOIN course c ON t.course_id = c.id " +
	                 "WHERE t.user_id = ?";

	    RowMapper<TradeDto> mapper = new RowMapper<TradeDto>() {
	        @Override
	        public TradeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
	            // 逐筆逐項將每一個欄位資料抓出
	            Integer tradeId = rs.getInt("id");
	            Integer tradeUserId = rs.getInt("userId");
	            Integer tradeCourseId = rs.getInt("courseId");
	            Timestamp createDate = rs.getTimestamp("createDate");
	            String paymentStatus = rs.getString("paymentStatus");
	            String orderStatus = rs.getString("orderStatus");

	            String userName = rs.getString("user_name");
	            String courseName = rs.getString("courseName");
	            Integer coursePrice = rs.getInt("coursePrice");
	            Date startDate = rs.getDate("startDate");
                Date endDate = rs.getDate("endDate");
                String day = rs.getString("day");
	            
	            
	            // 注入資料
	            Course course = new Course();
	            course.setId(tradeCourseId);
	            course.setName(courseName);
	            course.setPrice(coursePrice);
                course.setStartDate(startDate);
                course.setEndDate(endDate);
                course.setDay(day);

	            User user = new User();
	            user.setId(tradeUserId);
	            user.setName(userName);

	            // Trade 对象
	            TradeDto trade = new TradeDto();
	            trade.setId(tradeId);
	            trade.setUserId(tradeUserId);
	            trade.setCourseId(tradeCourseId);
	            trade.setCreateDate(createDate);
	            trade.setPaymentStatus(paymentStatus);
	            trade.setOrderStatus(orderStatus);
	            trade.setCourse(course);
	            trade.setUser(user);
	            
	            return trade;
	        }
	    };

	    return jdbcTemplate.query(sql, mapper, userId);
	}

//	@Override
//	public int addBookingCourse(TradeDto tradeDto) {
//		String sql = "insert into Trade( user_id,course_id=?, createDate=?, course_price=?, payment_status=?, order_status=? ) values(?, ?, ?, ?, ?, ?)";
//		int rowcount = jdbcTemplate.update(sql, tradeDto.getUserId(), 
//				tradeDto.getCourseId(),
//				tradeDto.getCreateDate(), tradeDto.getCoursePrice(), tradeDto.getPaymentStatus(), tradeDto.getOrderStatus());
//		return rowcount;
//	}
//	
	 @Override
	    public List<TradeDto> getAllTrades() {
	        String sql = "SELECT " +
	                     "t.user_id AS userId, t.course_id AS courseId, t.createDate AS createDate, " +
	                     "t.payment_status AS paymentStatus, t.order_status AS orderStatus, " +
	                     "u.id AS userId, u.name AS userName, " +
	                     "c.id AS courseId, c.name AS courseName, c.price AS coursePrice ,c.startDate AS startDate, c.endDate AS endDate,c.day AS day " +
	                     "FROM trade t " +
	                     "JOIN user u ON t.user_id = u.id " +
	                     "JOIN course c ON t.course_id = c.id";

	        RowMapper<TradeDto> mapper = new RowMapper<TradeDto>() {
	            @Override
	            public TradeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
	                // 逐筆逐項將每一個欄位資料抓出
	                Integer userId = rs.getInt("userId");
	                Integer courseId = rs.getInt("courseId");
	                Timestamp createDate = rs.getTimestamp("createDate");
	                String paymentStatus = rs.getString("paymentStatus");
	                String orderStatus = rs.getString("orderStatus");

	                String userName = rs.getString("userName");
		            String courseName = rs.getString("courseName");
		            Integer coursePrice = rs.getInt("coursePrice");
		            Date startDate = rs.getDate("startDate");
	                Date endDate = rs.getDate("endDate");
	                String day = rs.getString("day");
	                

	           
	                // 注入資料
	                Course course = new Course();
	                course.setId(courseId);
	                course.setName(courseName);
	                course.setPrice(coursePrice);
	                course.setStartDate(startDate);
	                course.setEndDate(endDate);
	                course.setDay(day);

	                User user = new User();
	                user.setId(userId);
	                user.setName(userName);

	                // Trade 对象
	                TradeDto trade = new TradeDto();
	                trade.setUserId(userId);
	                trade.setCourseId(courseId);
	                trade.setCreateDate(createDate);
	                trade.setPaymentStatus(paymentStatus);
	                trade.setOrderStatus(orderStatus);
	                trade.setCourse(course);
	                trade.setUser(user);
	                
	                return trade;
	            }
	        };

	        return jdbcTemplate.query(sql, mapper);
	    }
	 
	 
	 @Override
	 public List<TradeDto> findTradesByUserPaymentStatus(Integer userId ,String paymentStatus) {
	     String sql = "SELECT " +
	         "t.id AS id, t.user_id AS userId, t.course_id AS courseId, t.createDate AS createDate, " +
	         "t.payment_status AS paymentStatus, t.order_status AS orderStatus, " +
	         "u.id AS user_id, u.name AS user_name, " +
	         "c.id AS courseId, c.name AS courseName, c.price AS coursePrice, c.startDate AS startDate, c.endDate AS endDate, c.day AS day " +
	         "FROM trade t " +
	         "JOIN user u ON t.user_id = u.id " +
	         "JOIN course c ON t.course_id = c.id " +
	         "WHERE t.user_id = ? AND t.payment_status = ?";
	     
	     RowMapper<TradeDto> mapper = new RowMapper<TradeDto>() {
	         @Override
	         public TradeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
	             // 获取每一列的数据
	             Integer tradeId = rs.getInt("id");
	             Integer userId = rs.getInt("userId");
	             Integer courseId = rs.getInt("courseId");
	             Timestamp createDate = rs.getTimestamp("createDate");
	             String paymentStatus = rs.getString("paymentStatus");
	             String orderStatus = rs.getString("orderStatus");

	             String userName = rs.getString("user_name");
	             String courseName = rs.getString("courseName");
	             Integer coursePrice = rs.getInt("coursePrice");
	             Date startDate = rs.getDate("startDate");
	             Date endDate = rs.getDate("endDate");
	             String day = rs.getString("day");

	             // 创建 Course 对象并设置属性
	             Course course = new Course();
	             course.setId(courseId);
	             course.setName(courseName);
	             course.setPrice(coursePrice);
	             course.setStartDate(startDate);
	             course.setEndDate(endDate);
	             course.setDay(day);

	             // 创建 User 对象并设置属性
	             User user = new User();
	             user.setId(userId);
	             user.setName(userName);

	             // 创建 TradeDto 对象并设置属性
	             TradeDto trade = new TradeDto();
	             trade.setId(tradeId);
	             trade.setUserId(userId);
	             trade.setCourseId(courseId);
	             trade.setCreateDate(createDate);
	             trade.setPaymentStatus(paymentStatus);
	             trade.setOrderStatus(orderStatus);
	             trade.setCourse(course);
	             trade.setUser(user);

	             return trade;
	         }
	     };

	     return jdbcTemplate.query(sql, mapper, userId,paymentStatus);
	 }
	}
