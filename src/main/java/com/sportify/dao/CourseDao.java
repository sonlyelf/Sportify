package com.sportify.dao;

import java.util.List;
import java.util.Optional;

import com.sportify.model.po.Course;

public interface CourseDao {
	Course findById(Integer id);
	List<Course> findAllCourses();
	int createCourse(Course course);
	int updateCourse(Course course);
	int deleteCourse(Integer id);
	List<Course>getGroupCourse(Integer groupId);
	List<Integer> getAllGroupId();
	
	
}
