package com.mju.oggle.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
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
public class HistoryContoller {

	@Autowired
	private DocumentService documentService;

	@Autowired
	private PersonService personService;

	@Autowired
	private UserTagsService userTagsService;


	@RequestMapping(value = "/history.do", method = RequestMethod.GET)
	public ModelAndView getHistory(HttpServletRequest request, HttpServletResponse response) throws IOException{

		String id = request.getParameter("id");
		
		ModelAndView mav = new ModelAndView("history");
		
		User user = (User) request.getSession().getAttribute("user");
		UserTags userTags = userTagsService.findOneUserTags(user.getEmail());
		
		if(userTags.getWatchedList().size() == 0) {
			ModelAndView mav2 = new ModelAndView("home");
			return mav2;
		}
		
		List<Document> docList = new ArrayList<Document>();
		for(String item : userTags.getWatchedList()){
			docList.add(documentService.selectDocument(item));
		}
		
		Document selectedDoc = new Document();
		if(id!=null){
			selectedDoc = documentService.selectDocument(id);
			mav.addObject("selectedDoc", selectedDoc);
		}
		
		mav.addObject("docList", docList);
		
		return mav;
	}
	
	@RequestMapping(value = "/deleteAllHistory.do", method = RequestMethod.GET)
	public ModelAndView deleteAllHistory(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("home");
		
		User user = (User) request.getSession().getAttribute("user");
		userTagsService.deleteWatchList(user.getEmail());
		
		return mav;
	}
	
	@RequestMapping(value = "/deleteHistory.do", method = RequestMethod.GET)
	public ModelAndView deleteHistory(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		String id = request.getParameter("id");

		System.out.println("deleteHistory.do : "+id);
		
		ModelAndView mav = new ModelAndView("history");
		
		User user = (User) request.getSession().getAttribute("user");
		userTagsService.deleteWatchItem(user.getEmail(), id);
		
		return mav;
	}
}