package com.sportify.model.po;


import java.sql.Time;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Course {
	
	private Integer id;
	
	private String name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date startDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date endDate;
	@DateTimeFormat(pattern = "HH:mm:ss") // 日期格式
	@JsonFormat(pattern = "HH:mm:ss")
	private Time startTime;
	@DateTimeFormat(pattern = "HH:mm:ss") // 日期格式
	@JsonFormat(pattern = "HH:mm:ss")
	private Time endTime;
	private String day;
	private Integer price;
	
	private Integer groupId;

}
