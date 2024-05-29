package com.sportify.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sportify.model.po.User;

@Repository
public class UserDaoImpl implements UserDao {
 JdbcTemplate jdbcTemplate;

	@Override
	public User findById(Integer id) {
		String sql = "select id, name from user where id=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
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
		return jdbcTemplate.update(sql, user.getName(), user.getBirthday(), user.getPhone(), user.getEmail(),user.getPassword());
	}

	@Override
	public int updateUser(User user) {
		String sql = "update user set name=?, birthday=?, phone=?, email=? where id=?";
		return jdbcTemplate.update(sql, user.getName(), user.getBirthday(), user.getPhone(), user.getEmail(),user.getId());
	}

	@Override
	public int deleteUser(Integer id) {
		String sql = "delete from user where id=?";
		return jdbcTemplate.update(sql, id);
	}
	@Override
	public User findByEmail(String email) {
		String sql = "select id,name,birthday,phone,email from user where email=?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), email);
		
	}
	

}
