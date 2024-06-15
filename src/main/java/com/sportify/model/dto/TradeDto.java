package com.sportify.model.dto;

import java.sql.Timestamp;

import com.sportify.model.po.Course;
import com.sportify.model.po.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TradeDto {
	
	private Integer id; // 交易 id
	
	private Integer userId; // User id
	
	private Integer courseId; // 課程 id
	
	private Timestamp createDate; // 建立日期
	
	private String paymentStatus; // 付款狀態
	
	private String orderStatus; // 交易狀態
	
	// 關聯欄位(多對一)
	private Course course;
	private User user;

	
}
