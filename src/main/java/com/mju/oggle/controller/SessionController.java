package com.mju.oggle.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView getLogin(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public void PostLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, JSONException{

		System.out.println("Post");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UserDAO userDAO = new UserDAO();
		User user = userDAO.selectUser(id);

		JSONObject obj = new JSONObject();
		String msg;
		
		if(user == null)
			msg = "ID doesn't exist";
		
		else if(!(user.getPwd().equals(pwd)))
			msg = "Incorrect password";
		
		else if(!(user.getState().equals("y")))
			msg = "Unauthorized ID : Check your email \n("+user.getEmail()+")";
		
		else {
			HttpSession session = request.getSession();
			session.setAttribute("user",user);
			msg = "Welcome";
			obj.put("user", user);
		}
		
		System.out.println("\n\n\n\n"+msg);
		try {
			obj.put("msg", msg);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView getLogout(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav = new ModelAndView("home");
		return mav;
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main");
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		return mav;
	}
}
