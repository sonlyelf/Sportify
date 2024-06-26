package com.sportify.filter;

import java.io.IOException;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebFilter(urlPatterns = { "/searchMember", "/memberTransactions","/classInfo/bkClassInfo" })
public class LoginFilter extends HttpFilter {

	// 之前舊的
	// @Override
	// protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
	//		throws IOException, ServletException {
	//	HttpSession session = request.getSession();
	//	if(session.getAttribute("loginStatus") == null) {
	//		response.sendRedirect("/member");
	//	} 
	//	chain.doFilter(request, response);
	//}

	// 問chatGPT的
	@Override
	protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpSession session = request.getSession();
		Boolean adminLoggedIn = (Boolean) session.getAttribute("adminloginStatus");

		if (adminLoggedIn == null || !adminLoggedIn)  {
			response.sendRedirect("/admin/login");
		} else {
			chain.doFilter(request, response);
		}
	}
}
