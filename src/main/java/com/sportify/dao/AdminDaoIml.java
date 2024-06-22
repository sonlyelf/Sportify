package com.sportify.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sportify.model.dto.AdminDto;
import com.sportify.model.po.Admin;

@Repository
public class AdminDaoIml implements AdminDao {	
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Optional<AdminDto> findByEmail(String adminEmail) {
		String sql = "SELECT admin_id, admin_email, admin_password "
					+ "FROM admin "
					+ "WHERE admin_email=?";
		
		try {
			AdminDto admin = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(AdminDto.class), adminEmail);
			return Optional.of(admin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.empty();
	}

}
