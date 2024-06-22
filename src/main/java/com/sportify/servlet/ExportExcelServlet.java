package com.sportify.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sportify.model.po.Trade;
import com.sportify.service.TradeService;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/ExportExcelServlet")
public class ExportExcelServlet extends HttpServlet {

    @Autowired
    private TradeService tradeService;

    @RequestMapping(method = RequestMethod.POST)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 获取表格数据
        List<Trade> tradesAll = tradeService.findAllTrades();
        
        // 创建一个新的工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();

        // 创建一个工作表
        XSSFSheet sheet = workbook.createSheet("ALLTrades");

        // 设置中文字体
        XSSFFont font = workbook.createFont();
        font.setFontName("Arial Unicode MS"); // 使用支持中文的 Unicode 字体

        // 创建单元格样式
        XSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);
        
        // 创建表头行
        String[] headers = {"訂單編號", "學員編號", "課程編號", "交易時間", "付款狀態", "訂單狀態"};
        Row headerRow = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(headers[i]);
        }
        
        // 填充数据行
        int rowNum = 1;
        for (Trade trade : tradesAll) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(trade.getId());
            row.createCell(1).setCellValue(trade.getUserId());
            row.createCell(2).setCellValue(trade.getCourseId());
         
            // 日期格式化
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String formattedDate = dateFormat.format(trade.getCreateDate());
            row.createCell(3).setCellValue(formattedDate);
            
            row.createCell(4).setCellValue(trade.getPaymentStatus());
            row.createCell(5).setCellValue(trade.getOrderStatus());
        }
        
        // 设置响应头，指定 Excel 文件类型和文件名
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=bkTrades.xlsx");

        // 将工作簿内容写入响应输出流
        try (OutputStream outputStream = response.getOutputStream()) {
            workbook.write(outputStream);
        }
        
        workbook.close();
    }
}