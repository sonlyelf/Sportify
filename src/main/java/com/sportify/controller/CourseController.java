package com.sportify.controller;

import java.util.ArrayList;
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

import com.sportify.model.dto.CourseDto;
import com.sportify.model.dto.UserLoginDto;
import com.sportify.model.po.Course;
import com.sportify.model.po.User;
import com.sportify.service.CourseService;
import com.sportify.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/backgroundCourse")
public class CourseController {

	@Autowired
	private CourseService courseService;
	
	

	// 根據群組ID查找課程
	@GetMapping("/group/{groupId}")
	public String findGroup(@PathVariable Integer groupId, Model model) {

		List<Course> courses = courseService.getGroupCourse(groupId);

		model.addAttribute("groupCourses", courses);
		return "bkcourse";
	}
	
	@GetMapping("/bkcourse")
	public String getBkCourse(HttpSession session, Model model) {
		// 检查管理员是否已登录，如果未登录则重定向到登录页面
	    Boolean adminLoggedIn = (Boolean) session.getAttribute("adminloginStatus");
	    if (adminLoggedIn == null || !adminLoggedIn) {
	        return "redirect:/admin/login";
	    }
	   
	    // 載入所有課程信息
	    List<Course> courses = courseService.findAllCourses();
	    model.addAttribute("courses", courses);

	    return "bkcourse"; // 返回到後台管理頁面的視圖名稱，顯示管理員相關的內容和所有課程信息
	}

	// 根據課程ID查找課程
	@GetMapping("/course/{id}")
	public String findById(@ModelAttribute CourseDto courseDto, @PathVariable Integer id, Model model) {

		Course course = courseService.getCourseById(id);

		model.addAttribute("course", course);
		return "bkcourse";
	}

	// 新增課程
	@PostMapping
	public String add(@ModelAttribute CourseDto courseDto, Model model) {

		int result = courseService.addCourse(courseDto);

		String message = "課程新增" + (result == 1 ? "成功" : "失敗");
		model.addAttribute("message", message);
		return "redirect:/backgroundCourse/bkcourse";
	}

	// 修改課程
	@PutMapping
	public String update(@ModelAttribute CourseDto courseDto, Model model) {

		int result = courseService.amendCourse(courseDto);

		String message = "課程修改" + (result == 1 ? "成功" : "失敗");
		model.addAttribute("message", message);
		return "redirect:/backgroundCourse/bkcourse";
	}

	// 更新課程
	@PutMapping("/update/{id}")
	public String update(@PathVariable Integer id, Model model) {

		Course course = courseService.getCourseById(id);
		List<Course> courses = courseService.findAllCourses();

		model.addAttribute("method", "PUT");
		model.addAttribute("courses", courses);
		model.addAttribute("course", course);
		return "bkcourse";
	}

	// 刪除課程
	@DeleteMapping("/delete/{id}")
	public String cancel(@PathVariable Integer id, Model model) {

		int rowcount = courseService.deleteCourse(id);

		String message = "課程取消" + (rowcount == 1 ? "成功" : "失敗");
		model.addAttribute("message", message);
		return "redirect:/backgroundCourse/bkcourse";
	}

	// 課程報名
	@GetMapping("/course")
	public String getCourse(Model model) {

		List<Integer> groups = courseService.getAllGroupId();
		List<List<Course>> groupCourses = new ArrayList<>();

		groups.forEach(id -> groupCourses.add(courseService.getGroupCourse(id)));

		model.addAttribute("groups", groupCourses);
		return "course";
	}
	
	
}
