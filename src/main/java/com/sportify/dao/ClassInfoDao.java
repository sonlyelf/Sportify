package com.sportify.dao;

import java.util.List;

import com.sportify.model.dto.ClassInfoDto;
import com.sportify.model.po.ClassInfo;

public interface ClassInfoDao {
	
	List<ClassInfoDto> findAllClasses();
	
	List<ClassInfoDto> findByClassId(Integer classId);
		
	int createClass(ClassInfoDto classInfoDto);
	
	int updateClass(ClassInfoDto classInfoDto);
	
	int deleteClass(Integer classId);
	 // 新增方法：存储图片路径到数据库
    void saveImagePath(String imagePath);
	

}
