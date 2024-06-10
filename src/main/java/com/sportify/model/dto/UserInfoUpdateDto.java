package com.sportify.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserInfoUpdateDto {
	
	private Integer userId; 
	
	private String username; // 名稱
	
	private String email; // 信箱
	
	private String phone; // 手機
}
