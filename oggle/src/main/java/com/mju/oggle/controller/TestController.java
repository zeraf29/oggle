package com.mju.oggle.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
public class TestController {

	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private PersonService personService;
	
	@Autowired
	private UserTagsService userTagsService;
	
	@RequestMapping(value = "/doList.do", method = RequestMethod.GET)
	public void getTest(HttpServletRequest request, HttpServletResponse response) throws IOException{
//		ModelAndView mav = new ModelAndView("test");
//		mav.addObject("msg", "Asdasd");
		
//		return mav;
	}
}