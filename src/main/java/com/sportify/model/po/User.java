package com.sportify.model.po;

import java.util.Date;
import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 後端 DB 來使用
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	
	private Integer id;
	private String name; // 名稱
	private String password; // 密碼
	private Date birthday; // 生日
	private Integer phone; // 手機
	private String email; // 信箱
	//private ? salt; // 加鹽
}
