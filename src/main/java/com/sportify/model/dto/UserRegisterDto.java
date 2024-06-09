package com.sportify.model.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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

	private String name; // 名稱

	private String password; // 密碼

	@JsonFormat(pattern = "yyyy-MM-dd")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	private Date birthday; // 生日

	private String phone; // 手機

	private String email; // 信箱

	private String salt; // 鹽巴
}
