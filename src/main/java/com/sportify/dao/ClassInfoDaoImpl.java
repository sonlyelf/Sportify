package com.sportify.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.sportify.model.dto.ClassInfoDto;

@Repository
public class ClassInfoDaoImpl implements ClassInfoDao {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<ClassInfoDto> findAllClasses() {
        String sql = "SELECT class_id, class_name, class_description, imagePath FROM classIntro";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ClassInfoDto.class));
    }

    @Override
    public List<ClassInfoDto> findByClassId(Integer classId) {
        String sql = "SELECT class_id, class_name, class_description, imagePath FROM classIntro WHERE class_id = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(ClassInfoDto.class), classId);
    }

    

    @Override
    public int createClass(ClassInfoDto classInfoDto) {
        String sql = "INSERT INTO classIntro (class_name, class_description, imagePath) VALUES (?, ?, ?)";
        return jdbcTemplate.update(sql, classInfoDto.getClassName(), classInfoDto.getClassDescription(), classInfoDto.getImagePath());
    }

    @Override
    public int updateClass(ClassInfoDto classInfoDto) {
        String sql = "UPDATE classIntro SET class_name = ?, class_description = ?, imagePath = ? WHERE class_id = ?";
        return jdbcTemplate.update(sql, classInfoDto.getClassName(), classInfoDto.getClassDescription(), classInfoDto.getImagePath(), classInfoDto.getClassId());
    }

    @Override
    public int deleteClass(Integer classId) {
        String sql = "DELETE FROM classIntro WHERE class_id = ?";
        return jdbcTemplate.update(sql, classId);
    }
    
    // 实现新增的方法：存储图片路径到数据库
    @Override
    public void saveImagePath(String imagePath) {
        String sql = "INSERT INTO imagePath_table (imagePath) VALUES (?)";
        jdbcTemplate.update(sql, imagePath);
    }

}

