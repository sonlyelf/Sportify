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
	public Optional<Course > findById(Integer id) {
		String sql = "select id, name, start_date, end_date, start_time, end_time, day, price from course where id=?";
		
		try {
			Course course = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Course.class), id);
			return Optional.ofNullable(course);  
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Optional.of(null); 
	}

	@Override
	public List<Course> findAllCourses() {
		String sql = "select id, name, start_date, end_date, start_time, end_time, day, price ,group_id from course";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Course.class));
	}

	@Override
	public int createCourse(Course course) {
		String sql = "insert into course( name, start_date, end_date, start_time, end_time, day, price,group_id) values(?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, course.getName(), course.getStartDate(), course.getEndDate(), course.getStartTime(), course.getEndTime(), course.getDay(), course.getPrice(),course.getGroupId());
	}

	@Override
	public int updateCourse(Integer id, Course course) {
		String sql = "update course set name=?, start_date=?, end_date=?, start_time=?, end_time=?, day=?, price=? group_id=? where id=?";
		return jdbcTemplate.update(sql, course.getName(), course.getStartDate(), course.getEndDate(), course.getStartTime(), course.getEndTime(), course.getDay(), course.getPrice(),course.getGroupId(), id);
	}

	@Override
	public int deleteCourse(Integer id) {
		String sql = "delete from course where id=?";
		return jdbcTemplate.update(sql, id);
	}

	@Override
	public List<Course> getGroupCourse(Integer groupId) {
		String sql = "select group_id, name,  from course where id in (select id from groupcourse where group_id = ?)";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Course.class), groupId);
	}

}
