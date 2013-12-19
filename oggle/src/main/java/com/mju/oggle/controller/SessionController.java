package com.mju.oggle.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mju.oggle.dao.UserDAO;
import com.mju.oggle.model.User;

@Controller
public class SessionController {
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public void PostLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException{

		System.out.println("Post");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		System.out.println(email + " " + pwd);
		UserDAO userDAO = new UserDAO();
		User user = userDAO.selectUser(email);

		JSONObject obj = new JSONObject();
		String msg;
		
		if(user == null)
			msg = "1";
		
		else if(!(user.getPwd().equals(pwd)))
			msg = "2";
		
		else if(!(user.getState().equals("y")))
			msg = "3";
		
		else {
			HttpSession session = request.getSession();
			session.setAttribute("user",user);
			msg = "4";
			obj.put("email", user.getEmail());
		}
		
		try {
			obj.put("msg", msg);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
		
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String getHome(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache"); 
		response.setDateHeader("Expires", 0);
//		
		return "main";
		
//		return mav;
	}

}
