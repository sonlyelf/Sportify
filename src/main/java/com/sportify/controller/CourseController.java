package com.sportify.controller;

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

import com.sportify.model.dto.CourseDto;
import com.sportify.model.po.Course;
import com.sportify.service.CourseService;



@Controller
@RequestMapping("/backgroundCourse")
public class CourseController {
    
    @Autowired
    private CourseService courseService;
    
    // 根據群組ID查找課程
    @GetMapping("/group/{groupId}")
    public String findGroup(@PathVariable Integer groupId, Model model) {
        model.addAttribute("groupCourses", courseService.getGroupCourse(groupId));
        return "backgroundCourse";
    }
    
    // 查找所有課程
    @GetMapping
    public String findAll(@ModelAttribute CourseDto courseDto, Model model) {
        model.addAttribute("courses", courseService.findAllCourses());
        model.addAttribute("method", "POST");
        return "backgroundCourse";
    }
    
    // 根據課程ID查找課程
    @GetMapping("/id/{id}")
    public String findById(@ModelAttribute CourseDto courseDto, @PathVariable Integer id, Model model) {
        model.addAttribute("course", courseService.getCourseById(id));
        return "backgroundCourse";
    }
    
    // 新增課程
    @PostMapping
    public String add(@ModelAttribute CourseDto courseDto, Model model) {
    	System.out.println(courseDto);
        int result = courseService.addCourse(courseDto);
        
        String message = "課程新增" + (result == 1 ? "成功" : "失敗");
        model.addAttribute("message", message);
        return "redirect:/backgroundCourse";
    }
    
    // 修改課程
    @PutMapping
    public String update(@ModelAttribute CourseDto courseDto, Model model) {
    	System.out.println(courseDto);
        int result = courseService.amendCourse(courseDto);
        
        String message = "課程修改" + (result == 1 ? "成功" : "失敗");
        model.addAttribute("message", message);
        return "redirect:/backgroundCourse";
    }
    
    // 更新課程
    @PutMapping("/update/{id}")
    public String update(@PathVariable Integer id, Model model) {
    	Course course = courseService.getCourseById(id);
    	model.addAttribute("method", "PUT");
    	model.addAttribute("courses", courseService.findAllCourses());
        model.addAttribute("course", course);
        return "backgroundCourse";
    }
    
    // 刪除課程
    @DeleteMapping("/delete/{id}")
    public String cancel(@PathVariable Integer id, Model model) {
        int rowcount = courseService.deleteCourse(id);
        String message = "課程取消" + (rowcount == 1 ? "成功" : "失敗");
        model.addAttribute("message", message);
        return "redirect:/backgroundCourse";
    }
}

		
	
	


