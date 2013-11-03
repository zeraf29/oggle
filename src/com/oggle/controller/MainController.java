package com.oggle.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oggle.bean.User;
import com.oggle.dao.UserDAO;

@Controller
public class MainController {
	
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
		
		String id = request.getParameter("id");
		String nonce = request.getParameter("nonce");

		ModelAndView mav = new ModelAndView("main");
		
		if(id == null || nonce == null)
			return mav;
		else {
			System.out.println("id : " + id);
			System.out.println("nonce : " + nonce);
			
			UserDAO userDAO = new UserDAO();
			User user = userDAO.selectUser(id);
			
			String msg;
			
			if(user == null)
				msg = "Auth Error";
			
			else if(!(nonce.equals(user.getNonce()))){
				msg = "Auth Error";
				System.out.println(nonce);
				System.out.println(user.getNonce());
			}
			
			else {
				msg = "Auth Success";
				userDAO.changeUserState(id);
				mav.addObject("id", id);
			}
			
			mav.addObject("msg", msg);
			
			return mav;
		}
	}
}