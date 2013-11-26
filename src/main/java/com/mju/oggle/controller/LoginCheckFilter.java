package com.mju.oggle.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebFilter(filterName="LoginCheck",urlPatterns={"/*"})
public class LoginCheckFilter implements Filter {

	public LoginCheckFilter() {
		System.out.println("Filter Create");
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		System.out.println("Filter destroy");
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession(false);
		
		if(excludeUrl(httpRequest)) {
			chain.doFilter(request, response);
			return;
		}
		
		boolean login = false;
		if(session != null){
			if(session.getAttribute("user") != null){
				login = true;
			}
		}
		
		System.out.println(httpRequest.getRequestURI().toString().trim());
		// pass the request along the filter chain
		if(login){
			chain.doFilter(request, response);
			return;
		}
		else{
			System.out.println("session 만료");
			httpResponse.sendRedirect("/Oggle/main.do");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Filter init!!!");
	}

	private boolean excludeUrl(HttpServletRequest request) {
		String uri = request.getRequestURI().toString().trim();
		
		if(uri.startsWith("/Oggle/main.do")){
			return true;
		}else if(uri.startsWith("/Oggle/login.do")){
			return true;
		}else if(uri.startsWith("/Oggle/resources/")){
			return true;
		}
		else{
			return false;
		}
	}

}
