package com.sportify.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportify.dao.CourseDao;
import com.sportify.model.dto.CourseDto;
import com.sportify.model.po.Course;

@Service
public class CourseService {

	@Autowired
	private CourseDao courseDao;

	/**
	 * 取得所有的課程
	 * 
	 * @return
	 */
	public List<Course> findAllCourses() {

		return courseDao.findAllCourses();
	}

	/**
	 * 取得所有群組 id
	 * 
	 * @return
	 */
	public List<Integer> getAllGroupId() {
		return courseDao.getAllGroupId();
	}

	/**
	 * 根據 id 取得課程
	 * 
	 * @param id
	 * @return
	 */
	public Course getCourseById(Integer id) {

		return courseDao.findById(id);
	}

	/**
	 * 修改課程
	 * 
	 * @param courseDto
	 * @return
	 */
	public int amendCourse(CourseDto courseDto) {

		// 1.後端取資料庫user資料
		Course course = new Course();
		course.setId(courseDto.getId());
		course.setName(courseDto.getName());
		course.setStartDate(courseDto.getStartDate());
		course.setEndDate(courseDto.getEndDate());
		course.setTime(courseDto.getTime());
		course.setDay(courseDto.getDay());
		course.setPrice(courseDto.getPrice());
		course.setGroupId(courseDto.getGroupId());
		System.out.println(courseDto);

		int result = courseDao.updateCourse(course);

		return result;
	}

	/**
	 * 刪除課程
	 * 
	 * @param id
	 * @return
	 */
	public int deleteCourse(Integer id) {

		return courseDao.deleteCourse(id);
	}

	/**
	 * 取得團體課程
	 * 
	 * @param groupId
	 * @return
	 */
	public List<Course> getGroupCourse(Integer groupId) {

		return courseDao.getGroupCourse(groupId);
	}

	/**
	 * 新增課程
	 * 
	 * @param courseDto
	 * @return
	 */
	public int addCourse(CourseDto courseDto) {

		// 1.後端取資料庫user資料
		Course course = new Course();
		course.setName(courseDto.getName());
		course.setStartDate(courseDto.getStartDate());
		course.setEndDate(courseDto.getEndDate());
		course.setTime(courseDto.getTime());
		course.setDay(courseDto.getDay());
		course.setPrice(courseDto.getPrice());
		course.setGroupId(courseDto.getGroupId());
		int result = courseDao.createCourse(course);
		System.out.println(courseDto);

		return result;
	}
}
