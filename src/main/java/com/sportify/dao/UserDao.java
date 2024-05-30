package com.sportify.dao;

import java.util.List;

import com.sportify.model.po.User;

public interface UserDao {

	User findById(Integer id); // 查詢 User

	User findByEmail(String email); // 根據 email 來查詢 User

	List<User> FindAllUsers(); // 查詢所有 User

	int createUser(User user); // 建立 User

	int updateUser(User user); // 更新 User

	int deleteUser(Integer id); // 刪除 User
}
