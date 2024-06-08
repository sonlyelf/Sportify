package com.sportify.filter;

import java.io.IOException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/myCenter/*"})
public class LoginFilter extends HttpFilter {
	
	//之前舊的
//
//	@Override
//	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		HttpSession session = request.getSession();
//		if(session.getAttribute("loginStatus") == null) {
//			response.sendRedirect("/member");
//		} 
//		chain.doFilter(request, response);
//	}
	
	//問chatGPT的
	  @Override
	    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
	            throws IOException, ServletException {
	        HttpSession session = request.getSession();
	        Boolean loginStatus = (Boolean) session.getAttribute("loginStatus");
	        
	        if (loginStatus == null || !loginStatus) {
	            response.sendRedirect("/member");
	        } else {
	            chain.doFilter(request, response);
	        }
	    }
	
}
