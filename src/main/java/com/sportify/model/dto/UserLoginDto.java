package com.sportify.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginDto {

	private Integer id; // 
	
	private String email; // 信箱
	
	private String password; // 密碼
}
