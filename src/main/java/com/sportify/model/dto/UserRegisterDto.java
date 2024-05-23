package com.sportify.model.dto;

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
	
	private String Sname; // 名稱
	private String Spassword; // 密碼
	private String Sconfirm_password; // 確認密碼
	private String Sbirthdate; // 生日
	private Integer Sphone; // 手機
	private String Semail; // 信箱
}
