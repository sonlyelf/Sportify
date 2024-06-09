package com.sportify.model.po;

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

	private String name; // 課程名稱

	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date startDate; // 課程開始日期

	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date endDate; // 課程結束日期

	private String time; // 課程時間

	private String day; // 課程日期

	private Integer price; // 課程價格

	private Integer groupId; //
}
