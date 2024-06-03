package com.sportify.dao;

import java.util.List;

import com.sportify.model.po.Course;

public interface CourseDao {
	Course findById(Integer courseId);
	List<Course> findAll();
	int create(Course course);
	int update(Integer courseId, Course course);
	int delete(Integer courseId);
	
}
