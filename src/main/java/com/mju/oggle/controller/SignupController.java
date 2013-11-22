package com.mju.oggle.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mju.oggle.dao.UserDAO;
import com.mju.oggle.model.User;

@Controller
public class SignupController {
	
	EmailSender sender = new EmailSender();
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.GET)
	public ModelAndView getSignup(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav = new ModelAndView("signup");
		return mav;
	}
	
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public void postSignup(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		System.out.println("Post");
		String email = request.getParameter("email");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		
		// 이메일 인증을 위한 64비트 난수 발생
		Random random = new Random();
		String nonce = Long.toString(Math.abs(random.nextLong()));
		
		UserDAO userDAO = new UserDAO();
		User user1 = userDAO.selectUser(email);

		if(user1 == null) {
			
			User user = new User(); 
			user.setEmail(email);
			user.setPwd(pwd1);
			user.setName(name);
			user.setState("n");
			user.setNonce(nonce);
	
			userDAO.insertUser(user);
			
			System.out.println(email+ " " + pwd1+ " " + name);
			
	
			JSONObject obj = new JSONObject();
			try {
				obj.put("email", email);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			PrintWriter writer = response.getWriter();
			writer.write(obj.toString());

			// 인증 이메일 전송
			sender.sendEmail(email, nonce);
		}
		
		else {
			System.out.println("존재하는 Email");
		}
		
	}
	
}
	
