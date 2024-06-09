package com.sportify.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sportify.model.po.Course;

@Repository
public class CourseDaoImpl implements CourseDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public Course findById(Integer id) {
		
		String sql = "SELECT id, name, startDate, endDate, time, day, price, groupId "
					+ "FROM course "
					+ "WHERE id=?";
		
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Course.class), id);
	}

	@Override
	public List<Course> findAllCourses() {
		
		String sql = "SELECT id, name, startDate, endDate, time, day, price ,groupId "
					+ "FROM course";
		
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Course.class));
	}

	@Override
	public int createCourse(Course course) {
		
		String sql = "INSERT INTO course(name, startDate, endDate, time, day, price, groupId) "
					+ "values(?, ?, ?, ?, ?, ?, ?)";
		
		return jdbcTemplate.update(sql, 
				course.getName(), course.getStartDate(), course.getEndDate(), course.getTime(),
				course.getDay(), course.getPrice(), course.getGroupId());
	}

	@Override
	public int updateCourse(Course course) {
		
		String sql = "UPDATE course "
					+ "SET name=?, startDate=?, endDate=?, time=?, day=?, price=?,groupId=? "
					+ "WHERE id=?";
		
		return jdbcTemplate.update(sql, 
				course.getName(), course.getStartDate(), course.getEndDate(), course.getTime(),
				course.getDay(), course.getPrice(), course.getGroupId(), course.getId());
	}

	@Override
	public int deleteCourse(Integer id) {
		
		String sql = "DELETE FROM course "
					+ "WHERE id=?";
		
		return jdbcTemplate.update(sql, id);
	}

	@Override
	public List<Course> getGroupCourse(Integer groupId) {
		
		String sql = "SELECT id, name, startDate, endDate, time, day, price, groupId "
					+ "FROM course "
					+ "WHERE groupId=?";
		
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Course.class), groupId);
	}

	@Override
	public List<Integer> getAllGroupId() {
		
		String sql = "SELECT groupId "
					+ "FROM course "
					+ "GROUP BY groupId";
		
		return jdbcTemplate.queryForList(sql, Integer.class);
	}

	/*
	 * private static class CourseRowMapper implements RowMapper<Course> {
	 * 
	 * @Override public Course mapRow(ResultSet rs, int rowNum) throws SQLException
	 * { Course course = new Course(); course.setId(rs.getInt("id"));
	 * course.setName(rs.getString("name"));
	 * course.setStartDate(rs.getDate("startDate"));
	 * course.setEndDate(rs.getDate("endDate"));
	 * course.setTime(rs.getString("time")); course.setDay(rs.getString("day"));
	 * course.setPrice(rs.getInt("price")); course.setGroupId(rs.getInt("groupId"));
	 * return course; } }
	 */
}
