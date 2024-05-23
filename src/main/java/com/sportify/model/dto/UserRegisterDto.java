package com.sportify.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 前端 : User 的註冊資料
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRegisterDto {
	
	private Integer id;
	private String name; // 名稱
	private String password; // 密碼
	private Date birthday; // 生日
	private Integer phone; // 手機
	private String email; // 信箱
}
