package com.sportify.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserPwdUpdateDto {
	
	private Integer userId; 
	
	private String password; // 密碼
}
