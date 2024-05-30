package com.sportify.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sportify.model.po.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Optional<User> findById(Integer id) {
		
		String sql = "select id, name from user where id=?";
		
		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
			return Optional.of(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.of(null);
	}

	@Override
	public Optional <User>findByEmail(String email) {
		
		String sql = "select id,name,birthday,phone,email from user where email=?";

		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), email);
			return Optional.of(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.of(null);
	}

	@Override
	public List<User> FindAllUsers() {
		
		String sql = "select id, name,birthday ,phone ,email from user";
		List<User> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
		
		return users;
	}

	@Override
	public int createUser(User user) {
		
		String sql = "insert into user(name, birthday, phone, email ,password) values(?,?,?,?,?)";
		
		return jdbcTemplate.update(sql, user.getName(), user.getBirthday(), user.getPhone(), user.getEmail(), user.getPassword());
	}

	@Override
	public int updateUser(Integer userId, User user) {
		
		String sql = "update user set name=?, birthday=?, phone=?, email=? where id=?";
		
		return jdbcTemplate.update(sql, user.getName(), user.getBirthday(), user.getPhone(), user.getEmail(), user.getId());
	}

	@Override
	public int deleteUser(Integer id) {
		
		String sql = "delete from user where id=?";
		
		return jdbcTemplate.update(sql, id);
	}
}
