package com.mju.oggle.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

		ModelAndView mav = new ModelAndView("login");
		
		System.out.println("Post");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		System.out.println(email + " " + pwd);
		UserDAO userDAO = new UserDAO();
		User user = userDAO.selectUser(email);

		JSONObject obj = new JSONObject();
		String msg;
		
		if(user == null)
			msg = "Email doesn't exist";
		
		else if(!(user.getPwd().equals(pwd)))
			msg = "Incorrect password";
		
		else if(!(user.getState().equals("y")))
			msg = "Unauthorized Email : Check your email \n("+user.getEmail()+")";
		
		else {
			HttpSession session = request.getSession(true);
			session.setAttribute("user",user);
			msg = "Welcome";
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
	public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("main");
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.invalidate();
		
		return mav;
	}
}
