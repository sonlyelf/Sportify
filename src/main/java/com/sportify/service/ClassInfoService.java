package com.sportify.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sportify.dao.ClassInfoDao;
import com.sportify.model.dto.ClassInfoDto;
import com.sportify.model.po.ClassInfo;

@Service
public class ClassInfoService {
    
    @Autowired
    private ClassInfoDao classInfoDao;
   

    public List<ClassInfoDto> findAllClasses() {
        return classInfoDao.findAllClasses();
    }

    public List<ClassInfoDto> findByClassId(Integer classId) {
        return classInfoDao.findByClassId(classId);
    }

    public int createClass(ClassInfoDto classInfoDto) throws IOException {

        // 將 ClassInfoDto 轉換為 ClassInfo 對象
        ClassInfoDto classInfo = new ClassInfoDto();
        classInfo.setClassName(classInfoDto.getClassName());
        classInfo.setClassDescription(classInfoDto.getClassDescription());
        classInfo.setImagePath(classInfoDto.getImagePath());

        // 將 ClassInfo 對象保存到資料庫
        int result = classInfoDao.createClass(classInfo);
        return result;
    }

    public int updateClass(ClassInfoDto classInfoDto) throws IOException {
       
        // 將 ClassInfoDto 轉換為 ClassInfo 對象
        ClassInfoDto classInfo = new ClassInfoDto();
        classInfo.setClassId(classInfoDto.getClassId()); // 如果需要更新，需要設置 classId
        classInfo.setClassName(classInfoDto.getClassName());
        classInfo.setClassDescription(classInfoDto.getClassDescription());
        classInfo.setImagePath(classInfoDto.getImagePath());

        // 更新 ClassInfo 對象到資料庫
        int result = classInfoDao.updateClass(classInfo);
        return result;
    }

    public int deleteClass(Integer classId) {
        return classInfoDao.deleteClass(classId);
    }
}