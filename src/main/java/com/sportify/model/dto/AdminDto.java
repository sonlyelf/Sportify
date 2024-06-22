package com.sportify.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDto {
	private Integer adminId;
	private String  adminEmail;
	private String  adminPassword;
	

}
