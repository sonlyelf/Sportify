package com.sportify.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.sportify.model.po.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Optional<User> findById(Integer id) {
	    String sql = "select id, name, birthday ,phone ,email ,password ,salt from user where id=?";
	    
	    try {
	        User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), id);
	        return Optional.of(user);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return Optional.empty(); // Use Optional.empty() instead of Optional.of(null)
	}

	@Override
	public Optional<User> findByEmail(String email) {
	    String sql = "select id, name, birthday ,phone,password,salt, email from user where email=?";
	    
	    try {
	        User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), email);
	        return Optional.of(user);
	    } catch (Exception e) {
	       
	    	 e.printStackTrace();
//	        Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, e);
	    }
	    return Optional.empty();
	}
	@Override
	public List<User> FindAllUsers() {
		
		String sql = "SELECT id, name, birthday, phone, email, password, salt FROM user;";
		List<User> users = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
		
		return users;
	}

	@Override
	public int createUser(User user) {
		
		String sql = "INSERT INTO user (name, birthday, phone, email, password, salt) VALUES (?, ?, ?, ?, ?, ?);";
		
		return jdbcTemplate.update(sql, user.getName(), user.getBirthday(), user.getPhone(), user.getEmail(), user.getPassword(), user.getSalt());
	}

	@Override
	public int updateUser( User user) {
		
		String sql = "update user set name=?, birthday=?, phone=?, email=? password=? ,salt=? where id=?";
		
		return jdbcTemplate.update(sql, user.getName(), user.getBirthday(), user.getPhone(), user.getEmail(),user.getPassword(), user.getSalt(), user.getId());
	}

	@Override
	public int deleteUser(Integer id) {
		
		String sql = "delete from user where id=?";
		
		return jdbcTemplate.update(sql, id);
	}
	@Override
	public int replaceUser(User user) {
	    String sql = "UPDATE user SET name=?, phone=?, email=?, password=?, salt=? WHERE id=?";
	    return jdbcTemplate.update(sql, user.getName(), user.getPhone(), user.getEmail(), user.getPassword(), user.getSalt(), user.getId());
	}
	
	
/*	   private static class UserRowMapper implements RowMapper<User> {
	        @Override
	        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
	            User user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("name"));
	            user.setEmail(rs.getString("email"));
	            user.setPhone(rs.getString("phone"));
	            user.setBirthday(rs.getDate("birthday"));
	            user.setPassword(rs.getString("password"));
	            user.setSalt(rs.getString("salt"));
	            return user;
	        }
	    }	*/
}
