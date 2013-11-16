package com.mju.oggle.controller;

import java.io.IOException;

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

import com.mju.oggle.model.Person;
import com.mju.oggle.mongodb.PersonService;
   
@Controller    
public class MongoController {  
   
	@Autowired
	private PersonService personService;
	
	
	@RequestMapping(value = "/mongo.do", method = RequestMethod.GET)
	public ModelAndView getMongoDB(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		ModelAndView mav = new ModelAndView("mongo");
		return mav;
	}
	
    @RequestMapping(value = "/mongo.do/person", method = RequestMethod.GET)  
	public String getPersonList(ModelMap model) {  
        model.addAttribute("personList", personService.listPerson());  
        return "output";  
    }  
    
    @RequestMapping(value = "/mongo.do/person/save", method = RequestMethod.POST)  
	public View createPerson(@ModelAttribute Person person, ModelMap model) {
    	if(StringUtils.hasText(person.getId())) {
    		personService.updatePerson(person);
    	} else {
    		personService.addPerson(person);
    	}
    	return new RedirectView("/Oggle/mongo.do/person");  
    }
        
    @RequestMapping(value = "/mongo.do/person/delete", method = RequestMethod.GET)  
	public View deletePerson(@ModelAttribute Person person, ModelMap model) {  
        personService.deletePerson(person);  
        return new RedirectView("/Oggle/mongo.do/person");  
    }    
}
