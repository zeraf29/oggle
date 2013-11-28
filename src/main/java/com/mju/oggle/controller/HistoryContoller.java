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


	/*
	@RequestMapping(value = "/contents.do", method = RequestMethod.GET)
	public ModelAndView getContents(HttpServletRequest request, HttpServletResponse response) throws IOException{

		ModelAndView mav = new ModelAndView("contents");

		User user = (User) request.getSession().getAttribute("user");
		UserDAO dao = new UserDAO();
		
		int content = Integer.parseInt((String)request.getParameter("content"));
		System.out.println("\n\ncontent : "+content);
		
		Document doc = new Document();
		
		User user2 = dao.selectUser(user.getEmail());
		UserTags userTags = userTagsService.findOneUserTags(user.getEmail());

		if(userTags == null) {
			userTags = new UserTags();
			userTags.setEmail(user.getEmail());
			userTagsService.addUserTags(userTags);
			
			switch(content){
			case 1: doc = documentService.selectTopBoostDocument(user2.getTag1()); break;
			case 2: doc = documentService.selectTopBoostDocument(user2.getTag2()); break;
			case 3: doc = documentService.selectTopBoostDocument(user2.getTag3()); break;
			}
		}
		else {
			switch(content){
			case 1: doc = documentService.selectTopBoostDocument(user2.getTag1(),userTags.getWatchedList()); break;
			case 2: doc = documentService.selectTopBoostDocument(user2.getTag2(),userTags.getWatchedList()); break;
			case 3: doc = documentService.selectTopBoostDocument(user2.getTag3(),userTags.getWatchedList()); break;
			}
		}
		
		userTags.getWatchedList().add(doc.getId());
		
		if(doc != null){
			userTagsService.updateWatchList(user.getEmail(), doc.getId());
		}
		
		
		mav.addObject("doc", doc);
		mav.addObject("content", content);
		mav.addObject("pageNum", 1);
		
		return mav;
	}
	*/



	@RequestMapping(value = "/history.do", method = RequestMethod.GET)
	public ModelAndView getHistory(HttpServletRequest request, HttpServletResponse response) throws IOException{

		String id = request.getParameter("id");
		
		ModelAndView mav = new ModelAndView("history");
		
		User user = (User) request.getSession().getAttribute("user");
		UserTags userTags = userTagsService.findOneUserTags(user.getEmail());
		
		List<Document> docList = new ArrayList<Document>();
		for(String item : userTags.getWatchedList()){
			docList.add(documentService.selectDocument(item));
		}
		
		Document selectedDoc = new Document();
		if(id!=null){
			selectedDoc = documentService.selectDocument(id);
			mav.addObject("selectedDoc", selectedDoc);
		}
		
		
		mav.addObject("pageNum", 2);
		mav.addObject("docList", docList);
		
		return mav;
	}
}