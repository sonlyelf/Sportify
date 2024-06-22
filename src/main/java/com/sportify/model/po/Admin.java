package com.sportify.model.po;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
	
	private Integer adminId;
	private String  adminEmail;
	private String  adminPassword;
	

}
