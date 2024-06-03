package com.sportify.model.po;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@NotEmpty (message = "{user.name.notempty}")
	@Size(min = 2, max = 50, message = "{user.name.size}")
	private String name; // 名稱
	
	private String password; // 密碼
	
	@NotNull(message = "{user.birth.notnull}")
	@Past(message = "{user.birth.past}")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date birthday; // 生日
	
	private String phone; // 手機
	
	private String email; // 信箱
	//private ? salt; // 加鹽
}
