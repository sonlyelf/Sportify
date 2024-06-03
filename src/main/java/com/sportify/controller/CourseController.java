package com.sportify.controller;

import java.io.IOException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;


import org.springframework.stereotype.Controller;


import com.sportify.model.po.Course;
import com.sportify.service.CourseService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller 
@WebServlet("/course")
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CourseService courseService ;
	

	public CourseController(CourseService courseService) {
		this.courseService = courseService;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 是否有 deleteId 參數帶入 ?
		String deleteId = req.getParameter("deleteId");
		// 如果有 deleteId 參數帶入
		if (deleteId != null) {
			// 刪除
			courseService.delete(Integer.valueOf(deleteId));
			// 重新導向至 /course
			resp.sendRedirect(req.getContextPath() + "/course"); // resp.sendRedirect("/JavaWeb/room");
			// 退出
			return;
		}
		// 將所有房間資料放入 request 物件中
		req.setAttribute("courses", courseService.findAll());
		// 轉交至 /WEB-INF/jsp/course.jsp
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/course.jsp");
		// 轉交
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	        // 获取请求参数
	        Integer courseId = Integer.valueOf(req.getParameter("courseId"));
	        String courseName = req.getParameter("courseName");
	        String startDateStr = req.getParameter("startDate");
	        String endDateStr = req.getParameter("endDate");
	        String startTimeStr = req.getParameter("startTime");
	        String endTimeStr = req.getParameter("endTime");
	        String day = req.getParameter("day");
	        Integer price = Integer.valueOf(req.getParameter("price"));

	        // 日期和时间格式化
	        Date startDate = null;
	        Date endDate = null;
	        Time startTime = null;
	        Time endTime = null;
	        
	        if (startDateStr != null && !startDateStr.isEmpty()) {
	            startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
	        }
	        if (endDateStr != null && !endDateStr.isEmpty()) {
	            endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
	        }
	        if (startTimeStr != null && !startTimeStr.isEmpty()) {
	            startTime = Time.valueOf(startTimeStr + ":00"); // 确保时间字符串格式正确
	        }
	        if (endTimeStr != null && !endTimeStr.isEmpty()) {
	            endTime = Time.valueOf(endTimeStr + ":00"); // 确保时间字符串格式正确
	        }

	        // 创建 Course 对象
	        Course course = new Course(courseId, courseName, startDate, endDate, startTime, endTime, day, price);

	        // 调用服务层方法创建课程
	        courseService.create(course);

	        // 重新导向至 /course
	        resp.sendRedirect(req.getContextPath() + "/course");
	    } catch (Exception e) {
	        // 记录异常日志
	        Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, e);
	        
	        // 设置响应状态码和错误消息
	        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input parameters");
	    }
	}
	
}
