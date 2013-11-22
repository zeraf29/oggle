package com.mju.oggle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	/*
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main() {
		System.out.println("main!!");
		ModelAndView mav = new ModelAndView("main");
		return mav;
	}
	*/
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView getAuth(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String email = request.getParameter("email");
		String nonce = request.getParameter("nonce");

		ModelAndView mav = new ModelAndView("login");
		
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

}