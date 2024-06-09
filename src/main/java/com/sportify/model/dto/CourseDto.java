package com.sportify.model.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseDto {

	private Integer id; // 
	
	private String name; // 課程名稱
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	
	private Date startDate; // 開始時間
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	private Date endDate; // 結束時間

	private String time; // 時間

	private String day; // 日期

	private Integer price; // 價格
	
	private Integer groupId; // 
}
