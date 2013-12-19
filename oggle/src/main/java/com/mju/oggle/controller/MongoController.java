package com.mju.oggle.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import com.mju.oggle.model.MinDocument;
import com.mju.oggle.model.Person;
import com.mju.oggle.model.UserTags;
import com.mju.oggle.mongodb.DocumentService;
import com.mju.oggle.mongodb.PersonService;
import com.mju.oggle.mongodb.UserTagsService;
   
@Controller    
public class MongoController {  
   
	@Autowired
	private PersonService personService;
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	private UserTagsService userTagsService;
	
	
	@RequestMapping(value = "/mongo.do", method = RequestMethod.GET)
	public ModelAndView getMongoDB(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("mongo");
		return mav;
	}
	
    @RequestMapping(value = "/person.do", method = RequestMethod.GET)  
	public ModelAndView getPersonList(ModelMap model) {
    	
    	ModelAndView mav = new ModelAndView("pOutput");
    	mav.addObject("personList", personService.listPerson());  
    	mav.addObject("person", personService.selectPerson());  
    	
    	System.out.println(personService.selectPerson()+"!!!!!");
        return mav; 
    	
    } 
    
    @RequestMapping(value = "/document.do", method = RequestMethod.GET)  
	public ModelAndView getdocList(ModelMap model) {
    	
    	ModelAndView mav = new ModelAndView("dOutput");
    	mav.addObject("docList", documentService.listDocument()); 
    	
        return mav;  
    }  
    
    @RequestMapping(value = "/userTag.do", method = RequestMethod.GET)  
	public ModelAndView getTagList(ModelMap model) {
    	
    	ModelAndView mav = new ModelAndView("uOutput");
    	mav.addObject("utList", userTagsService.listUserTags()); 

        return mav;  
    }  
    
    
    @RequestMapping(value = "/insert.do", method = RequestMethod.POST)  
	public View createPerson(@ModelAttribute Person person, ModelMap model) {
    	if(StringUtils.hasText(person.getId())) {
    		personService.updatePerson(person);
    	} else {
    		personService.addPerson(person);
    	}
    	return new RedirectView("/Oggle/person.do");
    }
        
    
    @RequestMapping(value = "/delete.do", method = RequestMethod.GET)  
	public View deletePerson(@ModelAttribute Person person, ModelMap model) {  
        personService.deletePerson(person);  
        return new RedirectView("/Oggle/person.do");  
    }    
    
}
