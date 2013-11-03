package com.oggle.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oggle.bean.User;
import com.oggle.dao.UserDAO;

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
		String id = request.getParameter("id");
		String pwd1 = request.getParameter("pwd1");
		String pwd2 = request.getParameter("pwd2");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		// 이메일 인증을 위한 64비트 난수 발생
		Random random = new Random();
		String nonce = Long.toString(Math.abs(random.nextLong()));
		
		User user = new User(); 
		user.setUid(id);
		user.setPwd(pwd1);
		user.setName(name);
		user.setEmail(email);
		user.setState("n");
		user.setNonce(nonce);

		UserDAO userDAO = new UserDAO();
		userDAO.insertUser(user);
		
		System.out.println(id+ " " + pwd1+ " " + pwd2);
		System.out.println(name+ " " + email+ " ");
		

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
		sender.sendEmail(email, id, nonce);
	}
	
}
	
