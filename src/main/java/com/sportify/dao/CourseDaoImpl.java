package com.sportify.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.sportify.model.po.Course;

public class CourseDaoImpl implements CourseDao {
	
	JdbcTemplate jdbcTemplate ;

	@Override
	public Course findById(Integer courseId) {
		String sql = "select courseid, coursename, startDate, endDate, startTime, endTime, day, price from course where courseid=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Course.class), courseId);
	}

	@Override
	public List<Course> findAll() {
		String sql = "select courseid, coursename, startDate, endDate, startTime, endTime, day, price from course";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Course.class));
	}

	@Override
	public int create(Course course) {
		String sql = "insert into course(coursename, startDate, endDate, startTime, endTime, day, price) values(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, course.getCoursename(), course.getStartDate(), course.getEndDate(), course.getStartTime(), course.getEndTime(), course.getDay(), course.getPrice());
	}

	@Override
	public int update(Integer courseId, Course course) {
		String sql = "update course set coursename=?, startDate=?, endDate=?, startTime=?, endTime=?, day=?, price=? where courseid=?";
		return jdbcTemplate.update(sql, course.getCoursename(), course.getStartDate(), course.getEndDate(), course.getStartTime(), course.getEndTime(), course.getDay(), course.getPrice(), courseId);
	}

	@Override
	public int delete(Integer courseId) {
		String sql = "delete from course where courseid=?";
		return jdbcTemplate.update(sql, courseId);
	}

}
