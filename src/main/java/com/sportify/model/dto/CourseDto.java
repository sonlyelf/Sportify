package com.sportify.model.dto;

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
public class CourseDto {

	private Integer id;
	private String name;
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	private Date startDate;
	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
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
