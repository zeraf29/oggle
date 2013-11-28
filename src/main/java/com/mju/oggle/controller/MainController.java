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

	@RequestMapping(value ="/getHtml.do",method = RequestMethod.GET)
	public ModelAndView getHtml(HttpServletRequest request, HttpServletResponse response){
		System.out.println("getHtml");
		response.setContentType("text/html;charset=UTF-8");
		String str = "";
		String urls = request.getParameter("url");
		ModelAndView mav = new ModelAndView("getHtml");
		try{
			URL url = new URL(urls);
			// url클래스로 접근한 호스트의 정보를 보여줍니다.

			InputStreamReader isr = new InputStreamReader(url.openStream(), "UTF-8");//입력스트림을 생성합니다. 
			BufferedReader br = new BufferedReader(isr); 
			String inLine = null;

			while ((inLine=br.readLine())!= null){ // 라인단위로 읽어들이기
				str += inLine; 
			}

			br.close(); //데이터 읽기가 끝나면 close메소드로 스트림을 닫습니다.

		}catch (IOException e) { 
			str = e.toString(); 
		}
		mav.addObject("html",str);
		return mav;
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

	/*
	@RequestMapping(value = "/contents.do", method = RequestMethod.GET)
	public ModelAndView getMcontents(HttpServletRequest request, HttpServletResponse response) throws IOException{

		ModelAndView mav = new ModelAndView("contents");

		User user = (User) request.getSession().getAttribute("user");
		UserDAO dao = new UserDAO();

		User user2 = dao.selectUser(user.getEmail());
//		mav.addObject("tag1", user2.getTag1());
//		mav.addObject("tag2", user2.getTag2());
//		mav.addObject("tag3", user2.getTag3());

		List<Document> docList = new ArrayList<Document>();

		UserTags userTags = userTagsService.findOneUserTags(user.getEmail());

		if(userTags == null) {
			userTags = new UserTags();
			userTags.setEmail(user.getEmail());
			userTagsService.addUserTags(userTags);

			docList.add(documentService.selectTopBoostDocument(user2.getTag1()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag2()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag3()));
		}
		else {
			//    		System.out.println(userTags.getWatchedList().size());
			docList.add(documentService.selectTopBoostDocument(user2.getTag1(),userTags.getWatchedList()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag2(),userTags.getWatchedList()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag3(),userTags.getWatchedList()));
		}
		
		if(documentService.selectTopBoostDocument(user2.getTag1()) != null)
			userTags.getWatchedList().add(docList.get(0).getId());
		if(documentService.selectTopBoostDocument(user2.getTag2()) != null)
			userTags.getWatchedList().add(docList.get(1).getId());
		if(documentService.selectTopBoostDocument(user2.getTag3()) != null)
			userTags.getWatchedList().add(docList.get(2).getId());
		
		System.out.println("\n\n"+docList.size());

		for(Document item : docList){
			if(item != null)
				userTagsService.updateWatchList(user.getEmail(), item.getId());
		}
		mav.addObject("docList", docList);

		return mav;
	}
	*/
	
	@RequestMapping(value = "/contents.do", method = RequestMethod.GET)
	public ModelAndView getContents(HttpServletRequest request, HttpServletResponse response) throws IOException{

		ModelAndView mav = new ModelAndView("contents");

		User user = (User) request.getSession().getAttribute("user");
		UserDAO dao = new UserDAO();
		
//		String tag1 = (String)request.getParameter("tag1");
//		String tag2 = (String)request.getParameter("tag2");
//		String tag3 = (String)request.getParameter("tag3");
//
//		System.out.println(tag1);
//		System.out.println(tag2);
//		System.out.println(tag3);
		
		int content = Integer.parseInt((String)request.getParameter("content"));
		System.out.println("\n\ncontent : "+content);
		
//		int option = 0;
		
//		if(tag1 != null) option=1;
//		if(tag2 != null) option=2;
//		if(tag3 != null) option=3;
		
//		System.out.println(option+"");

		Document doc = new Document();
		
		User user2 = dao.selectUser(user.getEmail());
		UserTags userTags = userTagsService.findOneUserTags(user.getEmail());

		if(userTags == null) {
			userTags = new UserTags();
			userTags.setEmail(user.getEmail());
			userTagsService.addUserTags(userTags);
			
			switch(content){
			case 1: doc = documentService.selectTopBoostDocument(user2.getTag1()); System.out.println(1); break;
			case 2: doc = documentService.selectTopBoostDocument(user2.getTag2()); System.out.println(2); break;
			case 3: doc = documentService.selectTopBoostDocument(user2.getTag3()); System.out.println(3); break;
			}
		}
		else {
			switch(content){
			case 1: doc = documentService.selectTopBoostDocument(user2.getTag1(),userTags.getWatchedList()); System.out.println(4); break;
			case 2: doc = documentService.selectTopBoostDocument(user2.getTag2(),userTags.getWatchedList()); System.out.println(5); break;
			case 3: doc = documentService.selectTopBoostDocument(user2.getTag3(),userTags.getWatchedList()); System.out.println(6); break;
			}
		}
		

		System.out.println(doc.getTitle());
		System.out.println(doc.getContent());
		System.out.println(doc.getUrl());
		
		mav.addObject("doc", doc);
		mav.addObject("content", content);
		
		return mav;
		
//		userTags.getWatchedList().add(doc.getId());
		
		/*
		if(doc != null){
			userTagsService.updateWatchList(user.getEmail(), doc.getId());
			mav.addObject("doc", doc);
		}
		System.out.println(doc.getId());
		System.out.println(doc.getUrl());
		System.out.println(doc.getContent());
		
		return mav;
		*/
/*
			docList.add(documentService.selectTopBoostDocument(user2.getTag1()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag2()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag3()));
		}
		else {
			//    		System.out.println(userTags.getWatchedList().size());
			docList.add(documentService.selectTopBoostDocument(user2.getTag1(),userTags.getWatchedList()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag2(),userTags.getWatchedList()));
			docList.add(documentService.selectTopBoostDocument(user2.getTag3(),userTags.getWatchedList()));
		}
		System.out.println(docList.get(0).getId());
		if(documentService.selectTopBoostDocument(user2.getTag1()) != null)
			userTags.getWatchedList().add(docList.get(0).getId());
		if(documentService.selectTopBoostDocument(user2.getTag2()) != null)
			userTags.getWatchedList().add(docList.get(1).getId());
		if(documentService.selectTopBoostDocument(user2.getTag3()) != null)
			userTags.getWatchedList().add(docList.get(2).getId());

		for(Document item : docList){
			if(item != null)
				userTagsService.updateWatchList(user.getEmail(), item.getId());
		}
		mav.addObject("docList", docList);
*/
//		return mav;
	}


	@RequestMapping(value="/doLike.do",method=RequestMethod.GET)
	public boolean doLike(HttpServletRequest request, HttpServletResponse response) throws IOException{

		boolean rValue = false;
		/*
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		 */
		String email = "pooingx2@gmail.com";
		String id = "155511123";

		return userTagsService.updateLikeList(email, id);
	}

	@RequestMapping(value = "/history.do", method = RequestMethod.GET)
	public ModelAndView getHistory(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mav = new ModelAndView("history");
		return mav;
	}
}