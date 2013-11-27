package com.mju.oggle.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class UserTags {

	@Id
	private String email;
	private List<String> tag1;
	private List<String> tag2;
	private List<String> tag3;

	private List<String> watchedList;
	private List<String> likeList;
//	private String likeList;
	
	public UserTags(){
		tag1=new ArrayList<String>();
		tag2=new ArrayList<String>();
		tag3=new ArrayList<String>();
		watchedList = new ArrayList<String>();
		likeList = new ArrayList<String>();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<String> getTag1() {
		return tag1;
	}

	public void setTag1(List<String> tag1) {
		this.tag1 = tag1;
	}

	public List<String> getTag2() {
		return tag2;
	}

	public void setTag2(List<String> tag2) {
		this.tag2 = tag2;
	}

	public List<String> getTag3() {
		return tag3;
	}

	public void setTag3(List<String> tag3) {
		this.tag3 = tag3;
	}

	public List<String> getWatchedList() {
		return watchedList;
	}

	public void setWatchedList(List<String> watchedList) {
		this.watchedList = watchedList;
	}

	public List<String> getLikeList() {
		return likeList;
	}

	public void setLikeList(List<String> likeList) {
		this.likeList = likeList;
	}

	
}
