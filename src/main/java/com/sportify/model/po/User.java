package com.sportify.model.po;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import jakarta.annotation.Nonnull;
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
	
	@NotEmpty(message = "{user.password.notnull}")
	@Size(min = 6, max = 50, message = "{user.password.size}")
	private String password; // 密碼
	
	@NotNull(message = "{user.birth.notnull}")
	@Past(message = "{user.birth.past}")
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date birthday; // 生日
	
	@NotEmpty(message = "{user.phone.notnull}")
	private String phone; // 手機
	
	@NotEmpty(message = "{user.email.notnull}")
	private String email; // 信箱
	
	
//	private String salt; // 新增的鹽值屬性
//	
//	 // getters and setters for all fields, including salt
//    public String getSalt() {
//        return salt;
//    }
//
//    public void setSalt(String saltHex) {
//        this.salt = saltHex;
//    }


}
