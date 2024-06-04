package com.sportify.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportify.dao.CourseDao;
import com.sportify.model.dto.CourseDto;
import com.sportify.model.po.Course;


@Service
public class CourseService {
	
	@Autowired
	private CourseDao courseDao;
	

	

	public CourseDao getCourse() {
		return courseDao;
	}
	
	public Optional<Course> getCourseById(Integer id) {
		return courseDao.findById(id);
	}

	public List<Course> findAllCourses() {
		return courseDao.findAllCourses();
	}


	
	public int updateCourse(Integer id, Course course) {
		return courseDao.updateCourse(id, course);
	}
	
	public  int deleteCourse(Integer id) {
		return courseDao.deleteCourse(id);
	}
	
	public List<Course> getGroupCourse(Integer groupId) {
		return courseDao.getGroupCourse(groupId);
	}
	
	

		public  int addCourse(CourseDto courseDto) {

			// 1.後端取資料庫user資料
			Course course= new Course();
			course.setName(courseDto.getName());
			course.setStartDate(courseDto.getStartDate());
			course.setEndDate(courseDto.getEndDate());
			course.setStartTime(courseDto.getStartTime());
			course.setEndTime(courseDto.getEndTime());
			course.setDay(courseDto.getDay());
			course.setPrice(courseDto.getPrice());
			course.setGroupId(courseDto.getGroupId());
			courseDao.createCourse(course);
			System.out.println(courseDto);
			
			int result = courseDao.createCourse(course);
			
				return result;
			
		}



}
