package com.sportify.model.dto;

import java.sql.Time;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CourseDto {
	private Integer id;
	private String name;
	private Date startDate;
	private Date endDate;
	private Time startTime;
	private Time endTime;
	private String day;
	private Integer price;


}
