package com.mju.oggle.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mju.oggle.dao.UserDAO;
import com.mju.oggle.model.User;
import com.mju.oggle.mongodb.PersonService;

@Controller
public class ConfigController {

	@Autowired
	private PersonService personService;
	
	@RequestMapping(value = "/config.do", method = RequestMethod.GET)
	public ModelAndView getConfig(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("config");
		return mav;
	}
	
	@RequestMapping(value = "/configSub1.do", method = RequestMethod.GET)
	public ModelAndView getConfigSub1(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("configSub1");
		return mav;
	}
	
	@RequestMapping(value = "/configSub2.do", method = RequestMethod.GET)
	public ModelAndView getConfigSub2(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("configSub2");
		return mav;
	}
	
	@RequestMapping(value = "/configSub3.do", method = RequestMethod.GET)
	public ModelAndView getConfigSub3(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("configSub3");
		return mav;
	}
	
	@RequestMapping(value = "/updateProfile.do", method = RequestMethod.POST)
	public void updateProfile(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("Post");
		
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		
		String pwd1 = request.getParameter("pwd1");
		String name = request.getParameter("name");
		String email = user.getEmail();

		JSONObject obj = new JSONObject();
		String msg=null;
		
		user.setName(name);
		user.setPwd(pwd1);
		
		UserDAO userDAO = new UserDAO();
		userDAO.updateUser(user);
		
		msg = "Profile update completion";
		
		System.out.println(name+ " " + pwd1+ " " + email);
		System.out.println(msg);

		try {
			obj.put("msg", msg);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter writer = response.getWriter();
		writer.write(obj.toString());
	}
	
}