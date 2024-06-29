package com.sportify.model.po;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClassInfo {
	
	private Integer classId;
	private String  className;
	private String  classDescription;

	private String   imagePath;
	
	
	

}
