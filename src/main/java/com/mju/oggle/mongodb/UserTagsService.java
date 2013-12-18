package com.mju.oggle.mongodb;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mju.oggle.model.UserTags;

@Repository
public class UserTagsService {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public static final String COLLECTION_NAME = "userTags";
	
	public boolean updateLikeList(String email, String id){
		boolean rValue = false;
		Query query = new Query();
		query.addCriteria(Criteria.where("_id").is(email));
		//BasicQuery query = new BasicQuery("{\"email\": \""+ email + "\" }");
		UserTags user =  mongoTemplate.findOne(query, UserTags.class, COLLECTION_NAME);
		//query.addCriteria(Criteria.where("content").regex("test").and("_id").nin();
		if(!user.getEmail().isEmpty()){
			Update update = new Update();
			update.addToSet("likeList", id);
			mongoTemplate.updateFirst(query, update, UserTags.class);
			rValue = true;
		}

		return rValue;
	}
	
	public void addUserTags(UserTags userTags) {
		if (!mongoTemplate.collectionExists(UserTags.class)) {
			mongoTemplate.createCollection(UserTags.class);
		}		
		mongoTemplate.insert(userTags, COLLECTION_NAME);
	}
	
	public List<UserTags> listUserTags() {
		
		return mongoTemplate.findAll(UserTags.class, COLLECTION_NAME);
	}
	
	public UserTags findOneUserTags(String email) {
		
		BasicQuery query = new BasicQuery("{email : \'"+email+"\'}");
		UserTags userTags = new UserTags();
		userTags = mongoTemplate.findOne(query, UserTags.class, COLLECTION_NAME);
		
		return userTags;
	}
	
	public void updateWatchList(String email, String id) {
		
//		BasicQuery query = new BasicQuery("{email : 'pooingx2@gmail.com'}");
		BasicQuery query = new BasicQuery("{email : \'"+email+"\'}");
		UserTags userTags = new UserTags();
		userTags = mongoTemplate.findOne(query, UserTags.class, COLLECTION_NAME);
		
		System.out.println(userTags.getEmail());
		System.out.println(userTags.getWatchedList());
		
		for (String item : userTags.getWatchedList()) {
			if (item.equals(id)) return;
		}
		
		userTags.getWatchedList().add(id);
		
		mongoTemplate.save(userTags);
	}
	
	
	public void deleteWatchList(String email) {
		
		BasicQuery query = new BasicQuery("{email : \'"+email+"\'}");
		UserTags userTags = new UserTags();
		
		userTags = mongoTemplate.findOne(query, UserTags.class, COLLECTION_NAME);
		userTags.setWatchedList(new ArrayList<String>());
		
		mongoTemplate.save(userTags);
	}
	
	public void deleteWatchItem(String email, String id) {
		
		BasicQuery query = new BasicQuery("{email : \'"+email+"\'}");
		UserTags userTags = new UserTags();
		userTags = mongoTemplate.findOne(query, UserTags.class, COLLECTION_NAME);
		
		System.out.println(userTags.getEmail());
		System.out.println(userTags.getWatchedList());
		
		Iterator<String> i = userTags.getWatchedList().iterator();
		while (i.hasNext()) {
		   String s = i.next();
		   if(s.equals(id))
			   i.remove();
		}
				
		mongoTemplate.save(userTags);
	}
	
	/*
	public UserTags selectTopBoostUserTags(String regex) {

		//(?i)
//		BasicQuery query = new BasicQuery("{name : 'aaa'}");
		BasicQuery query = new BasicQuery("{\"title\": {$regex : '" +"(?i)"+ regex + "'} }");
		query.with(new Sort(Direction.DESC, "boost"));
//		query.limit(limit);
		
		return mongoTemplate.findOne(query, UserTags.class, COLLECTION_NAME);
	}
	
	
	public void deleteUserTags(UserTags userTags) {
		mongoTemplate.remove(userTags, COLLECTION_NAME);
	}
	
	public void updateUserTags(UserTags userTags) {
		mongoTemplate.insert(userTags, COLLECTION_NAME);		
	}
	*/
}
