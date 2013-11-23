package com.mju.oggle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mju.oggle.dao.UserDAO;
import com.mju.oggle.model.User;
import com.mju.oggle.mongodb.PersonService;

@Controller
public class MainController {

	@Autowired
	private PersonService personService;
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("test");
		mav.addObject("msg", "Asdasd");
		return mav;
	}
	
	@RequestMapping(value = "/main2.do", method = RequestMethod.GET)
	public ModelAndView getMain(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("main2");
		mav.addObject("msg", "Asdasd");
		return mav;
	}
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView getAuth(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String email = request.getParameter("email");
		String nonce = request.getParameter("nonce");

		ModelAndView mav = new ModelAndView("main");
		
		if(email == null || nonce == null)
			return mav;
		else {
			
			System.out.println("email : " + email);
			System.out.println("nonce : " + nonce);
			
			UserDAO userDAO = new UserDAO();
			User user = userDAO.selectUser(email);
			
			String msg;
			
			if(user == null)
				msg = "Auth Error";
			
			else if(!(nonce.equals(user.getNonce()))){
				msg = "Auth Error";
			}
			
			else {
				msg = "Auth Success";
				userDAO.changeUserState(email);
				mav.addObject("email", email);
			}
			
			mav.addObject("msg", msg);
			
			return mav;
		}
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		System.out.println("session(name) : " + user.getName());
		System.out.println("session(email) : " + user.getEmail());
		System.out.println("session(state) : " + user.getState());
		
		ModelAndView mav = new ModelAndView("home");
		
		mav.addObject("user",user);
		mav.addObject("msg","Asdf");
		
		return mav;
	}
	
	@RequestMapping(value = "/mContents.do", method = RequestMethod.GET)
	public ModelAndView getMcontents(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("mContents");
		return mav;
	}
	
	@RequestMapping(value = "/fContents.do", method = RequestMethod.GET)
	public ModelAndView getFcontents(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("fContents");
		return mav;
	}
	
	@RequestMapping(value = "/history.do", method = RequestMethod.GET)
	public ModelAndView getHistory(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("history");
		return mav;
	}
	
	@RequestMapping(value = "/config.do", method = RequestMethod.GET)
	public ModelAndView getConfig(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("config");
		return mav;
	}

}