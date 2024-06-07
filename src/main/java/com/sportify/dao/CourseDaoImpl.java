package com.sportify.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sportify.model.po.Course;

@Repository
public class CourseDaoImpl implements CourseDao {
	
	@Autowired
	JdbcTemplate jdbcTemplate ;

	@Override
	public Course findById(Integer id) {
		String sql = "select id, name, startDate, endDate, time, day, price, groupId from course where id=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Course.class), id);
	}

	@Override
	public List<Course> findAllCourses() {
		String sql = "select id, name, startDate, endDate, time, day, price ,groupId from course";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Course.class));
	}

	@Override
	public int createCourse(Course course) {
		String sql = "insert into course( name, startDate, endDate, time, day, price,groupId) values(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, course.getName(), course.getStartDate(), course.getEndDate(), course.getTime(), course.getDay(), course.getPrice(),course.getGroupId());
	}

	@Override
	public int updateCourse (Course course) {
		String sql = "update course set name=?, startDate=?, endDate=?, time=?, day=?, price=?,groupId=? where id=?";
		return jdbcTemplate.update(sql, course.getName(), course.getStartDate(), course.getEndDate(), course.getTime(), course.getDay(), course.getPrice(),course.getGroupId(), course.getId());
	}

	@Override
	public int deleteCourse(Integer id) {
		String sql = "delete from course where id=?";
		return jdbcTemplate.update(sql, id);
	}

	@Override
	public List<Course> getGroupCourse(Integer groupId) {
		String sql = "select id, name, startDate, endDate, time, day, price, groupId from course where groupId=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Course.class), groupId);
	}

	@Override
	public List<Integer> getAllGroupId() {
		String sql = "SELECT groupId FROM course group by groupId";
		return jdbcTemplate.queryForList(sql, Integer.class);
	}

}
