package com.mju.oggle.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;

public class Document implements Serializable{

	@Id
	String id;
//	String segment;
//	String digest;
	String boost;
	
//	String host;
//	String site;
	String url;
	String content;
	String title;
//	String chache;
//	String tstamp;
	
//	String anchor;
//	String type;
//	String contentLength;
//	String lastModified;
//	String date;
	
//	String lang;
//	String subcollection;
//	String author;
//	String tag;
//	String feed;
//	String publishedDate;
//	String updatedDate;
//	String cc;
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBoost() {
		return boost;
	}
	public void setBoost(String boost) {
		this.boost = boost;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}
