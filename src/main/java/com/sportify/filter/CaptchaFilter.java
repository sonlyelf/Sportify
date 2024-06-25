package com.sportify.filter;

import java.io.IOException;

import com.sportify.Captcha.CaptchaGenerator;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebFilter("/user/login")
//public class CaptchaFilter extends HttpFilter {
//    @Override
//    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        // 生成验证码
//        String captcha = CaptchaGenerator.generateCaptcha(6);
//
//        // 将验证码存储在会话中
//        request.getSession().setAttribute("captcha", captcha);
//
//        // 继续向下传递请求
//        chain.doFilter(request, response);
//    }
//}