package com.sportify.dao;

import java.util.List;

import com.sportify.model.po.Course;

public interface CourseDao {

	/**
	 * 查詢所有課程
	 * 
	 * @return
	 */
	List<Course> findAllCourses();

	/**
	 * 根據 id 查詢課程
	 * 
	 * @param id
	 * @return
	 */
	Course findById(Integer id);

	/**
	 * 新增課程
	 * 
	 * @param course
	 * @return
	 */
	int createCourse(Course course);

	/**
	 * 
	 * @param course
	 * @return
	 */
	int updateCourse(Course course);

	/**
	 * 刪除課程
	 * 
	 * @param id
	 * @return
	 */
	int deleteCourse(Integer id);

	/**
	 * 取得團體課程
	 * 
	 * @param groupId
	 * @return
	 */
	List<Course> getGroupCourse(Integer groupId);

	/**
	 * 取得所有群組 id
	 * 
	 * @return
	 */
	List<Integer> getAllGroupId();
}
