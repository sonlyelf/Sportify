package com.sportify.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sportify.dao.CourseDao;
import com.sportify.dao.CourseDaoImpl;
import com.sportify.model.po.Course;

@Service
public class CourseService {
	private CourseDao courseDao;

	public CourseService() {
		courseDao = new CourseDaoImpl();
	}
	
	public Course getCourseDao(Integer courseId) {
		return courseDao.findById(courseId);
	}

	public List<Course> findAll() {
		return courseDao.findAll();
	}

	public int create(Course course) {
		return courseDao.create(course);
	}
	
	public boolean update(Integer courseId, Course course) {
		return courseDao.update(courseId, course)>0;
	}
	
	public  boolean delete(Integer courseId) {
		return courseDao.delete(courseId)>0;
	}
	

}
