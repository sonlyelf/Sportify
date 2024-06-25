package com.sportify.Captcha;


import java.io.IOException;
import java.util.Base64;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/captchaImageServlet")
public class CaptchaImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 生成验证码字符串
        String captcha = CaptchaGenerator.generateCaptcha(6);

        // 将验证码存储在会话中（可选）
        request.getSession().setAttribute("captcha", captcha);

        // 生成验证码图像的 Base64 编码字符串
        String base64Image = CaptchaImageGenerator.generateCaptchaImage(captcha);

        // 将 Base64 编码字符串解码为字节数组
        byte[] imageBytes = Base64.getDecoder().decode(base64Image);

        // 设置响应的内容类型为图片格式
        response.setContentType("image/png");

        // 将图像的字节数组写入响应的 OutputStream 中
        response.getOutputStream().write(imageBytes);
    }
}