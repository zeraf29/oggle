package com.mju.oggle.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mju.oggle.dao.UserDAO;
import com.mju.oggle.model.Document;
import com.mju.oggle.model.User;
import com.mju.oggle.model.UserTags;
import com.mju.oggle.mongodb.DocumentService;
import com.mju.oggle.mongodb.PersonService;
import com.mju.oggle.mongodb.UserTagsService;


@Controller
public class MainController {

	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private UserTagsService userTagsService;
	
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
			
			String auth;
			
			if(user == null)
				auth = "Error";
			
			else if(!(nonce.equals(user.getNonce()))){
				auth = "Error";
			}
			
			else {
				auth = "Success";
				userDAO.changeUserState(email);
				mav.addObject("email", email);
			}
			
			mav.addObject("auth", auth);
			
			return mav;
		}
	}
	
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public ModelAndView getHome(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("session(name) : " + user.getName());
		System.out.println("session(email) : " + user.getEmail());
		System.out.println("session(state) : " + user.getState());
		
		ModelAndView mav = new ModelAndView("home");
		
		mav.addObject("user",user);
		
		return mav;
	}
	
	@RequestMapping(value = "/contents.do", method = RequestMethod.GET)
	public ModelAndView getMcontents(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		ModelAndView mav = new ModelAndView("contents");
		
		User user = (User) request.getSession().getAttribute("user");
		UserDAO dao = new UserDAO();
		
		User user2 = dao.selectUser(user.getEmail());
		
		mav.addObject("tag1", user2.getTag1());
		mav.addObject("tag2", user2.getTag2());
		mav.addObject("tag3", user2.getTag3());
		
    	List<Document> docList = new ArrayList<Document>();

    	docList.add(documentService.selectTopBoostDocument(user2.getTag1()));
    	docList.add(documentService.selectTopBoostDocument(user2.getTag2()));
    	docList.add(documentService.selectTopBoostDocument(user2.getTag3()));
    	
    	UserTags userTags = new UserTags();
    	userTags.setEmail(user.getEmail());
    	userTags.getWatchedList().add(docList.get(0).getId());
    	userTags.getWatchedList().add(docList.get(1).getId());
    	userTags.getWatchedList().add(docList.get(2).getId());
    	
    	userTagsService.addUserTags(userTags);
    	
    	userTagsService.updateWatchList(user.getEmail(), docList.get(0).getId());
    	userTagsService.updateWatchList(user.getEmail(), docList.get(1).getId());
    	userTagsService.updateWatchList(user.getEmail(), docList.get(2).getId());
    	
    	mav.addObject("docList", docList);
    	
		return mav;
	}
	
	@RequestMapping(value = "/history.do", method = RequestMethod.GET)
	public ModelAndView getHistory(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("history");
		return mav;
	}
}