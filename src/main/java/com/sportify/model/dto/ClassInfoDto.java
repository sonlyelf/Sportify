package com.sportify.model.dto;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ClassInfoDto {
	private Integer classId;
	private String  className;
	private String  classDescription;
	
	private String  imagePath;


}
