package com.sportify.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sportify.model.po.Course;

import com.sportify.service.CourseService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/ExportCourseServlet")
public class ExportCourseServlet extends HttpServlet{
	
	@Autowired
	CourseService courseService;
	

	@RequestMapping(method = RequestMethod.POST)
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		
		
		   List<Course> courses = courseService.findAllCourses();
		   
		   
		   // 创建一个新的工作簿
	        XSSFWorkbook workbook = new XSSFWorkbook();

	        // 创建一个工作表
	        XSSFSheet sheet = workbook.createSheet("ALLCourses");

	        // 设置中文字体
	        XSSFFont font = workbook.createFont();
	        font.setFontName("Arial Unicode MS"); // 使用支持中文的 Unicode 字体

	        // 创建单元格样式
	        XSSFCellStyle style = workbook.createCellStyle();
	        style.setFont(font);
	        
		  
	        // 创建表头行
	        String[] headers = {"課程ID", "課程名稱", "Start Date", "End Date", "Day", "Time", "Price"	,"Group ID"};
	        Row headerRow = sheet.createRow(0);
	        for (int i = 0; i < headers.length; i++) {
	            Cell cell = headerRow.createCell(i);
	            cell.setCellValue(headers[i]);
	        }
	        
	        // 填充数据行
	        int rowNum = 1;
	        for (Course course : courses) {
	            Row row = sheet.createRow(rowNum++);
	            row.createCell(0).setCellValue(course.getId());
	            row.createCell(1).setCellValue(course.getName());
	           
	            // 日期格式化
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            String formattedDate = dateFormat.format(course.getStartDate());
	            row.createCell(2).setCellValue(formattedDate);
	           
	            SimpleDateFormat enddateFormat = new SimpleDateFormat("yyyy-MM-dd");
	            String EnddateFormat = enddateFormat.format(course.getEndDate());
	            row.createCell(3).setCellValue(EnddateFormat);
	            
	            row.createCell(4).setCellValue(course.getDay());
	            row.createCell(5).setCellValue(course.getTime());
	            row.createCell(6).setCellValue(course.getPrice());
	            row.createCell(7).setCellValue(course.getGroupId());
	        }
	        
	      
	        
	        // 设置响应头，指定 Excel 文件类型和文件名
	        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	        response.setHeader("Content-Disposition", "attachment; filename=bkCourses.xlsx");

	        // 将工作簿内容写入响应输出流
	        try (OutputStream outputStream = response.getOutputStream()) {
	            workbook.write(outputStream);
	        }
	        
	        workbook.close();
	    
	}
}
