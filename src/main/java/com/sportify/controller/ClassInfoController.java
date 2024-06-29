package com.sportify.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sportify.model.dto.ClassInfoDto;
import com.sportify.model.po.Course;
import com.sportify.service.ClassInfoService;
import com.sportify.service.ImageService;

@Controller
@RequestMapping("/classInfo")
public class ClassInfoController {

    @Autowired
    private ClassInfoService classInfoService;
    
    @Autowired
    private ImageService imageService;

    @GetMapping("/bkClassInfo")
    public String getClasses(Model model) {
        List<ClassInfoDto> classInfoList = classInfoService.findAllClasses();
        model.addAttribute("classInfoList", classInfoList);
        return "bkClassInfo"; 
    }

    @PostMapping("/addClass")
    public String addClass(@ModelAttribute ClassInfoDto classInfoDto,
                           @RequestParam("file") MultipartFile file,
                           Model model) {
        try {
            // 保存文件並取得文件路徑或Base64編碼後的圖片字符串
            String imagePath = imageService.saveImage(file);

            // 設置ClassInfoDto對象的imagePath屬性
            classInfoDto.setImagePath(imagePath);

            // 調用服務層方法保存課程信息
            int result = classInfoService.createClass(classInfoDto);
            String message = "課程介紹新增" + (result == 1 ? "成功" : "失敗");
            model.addAttribute("message", message);
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "保存文件失敗: " + e.getMessage());
        }

        return "redirect:/classInfo/bkClassInfo";
    }
    
    

    @DeleteMapping("/deleteClass/{classId}")
    public String deleteClass(@PathVariable Integer classId, Model model) {
        int result = classInfoService.deleteClass(classId);
        String message = "課程介紹刪除" + (result == 1 ? "成功" : "失敗");
        model.addAttribute("message", message);
        return "redirect:/classInfo/bkClassInfo";
    }
}