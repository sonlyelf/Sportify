package com.sportify.dao;

import java.util.List;
import java.util.Optional;

import com.sportify.model.po.User;

public interface UserDao {

	Optional <User> findById(Integer id); // 查詢 User

	Optional <User>findByEmail(String email); // 根據 email 來查詢 User

	List<User> FindAllUsers(); // 查詢所有 User

    int createUser(User user); // 建立 User

	int updateUser(User user); // 更新 User

	int deleteUser(Integer id); // 刪除 User
	
	int replaceUser(User user); // 前台更新 User
	

	
}
