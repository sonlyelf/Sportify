package com.sportify.dao;

import java.util.List;

import com.sportify.model.po.User;

public interface UserDao {
	User findById(Integer id);
	List<User>FindAllUsers();
	int createUser(User user);
	int updateUser(User user);
	int deleteUser(Integer id);
	User findByEmail(String email);
	
	
	

}
