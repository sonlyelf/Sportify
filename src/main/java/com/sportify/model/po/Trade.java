package com.sportify.model.po;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Trade {
	
	private Integer id;
	private Integer userId;
	private Integer courseId;
	private Timestamp createDate;
	private Integer coursePrice;
	private String paymentStatus;
	private String orderStatus;

}
