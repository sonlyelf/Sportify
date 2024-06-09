package com.sportify.model.po;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Trade {

	private Integer id; //
	
	private Integer userId; // User id
	
	private Integer courseId; // 課程 id
	
	private Timestamp createDate; // 建立日期
	
	private Integer coursePrice; // 課程價格
	
	private String paymentStatus; // 付款狀態
	
	private String orderStatus; // 交易狀態
}
