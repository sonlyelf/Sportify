package com.sportify.dao;

import java.util.List;
import java.util.Optional;

import com.sportify.model.po.User;

public interface UserDao {
	
	/**
	 * 查詢 User
	 * 
	 * @param id
	 * @return
	 */
	Optional<User> findById(Integer id);

	/**
	 * 根據 email 來查詢 User
	 * 
	 * @param email
	 * @return
	 */
	Optional<User> findByEmail(String email);

	/**
	 * 查詢所有 User
	 * 
	 * @return
	 */
	List<User> FindAllUsers();

	/**
	 * 建立 User
	 * 
	 * @param user
	 * @return
	 */
	int createUser(User user);

	/**
	 * 更新 User
	 * 
	 * @param user
	 * @return
	 */
	int updateUser(User user);

	/**
	 * 刪除 User
	 * 
	 * @param id
	 * @return
	 */
	int deleteUser(Integer id);

	/**
	 * 前台更新 User
	 * 
	 * @param user
	 * @return
	 */
	int replaceUser(User user);
}
