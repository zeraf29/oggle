package com.mju.oggle.mongodb;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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
	
	public void addUserTags(UserTags userTags) {
		if (!mongoTemplate.collectionExists(UserTags.class)) {
			mongoTemplate.createCollection(UserTags.class);
		}		
		mongoTemplate.insert(userTags, COLLECTION_NAME);
	}
	
	public List<UserTags> listUserTags() {
		
		return mongoTemplate.findAll(UserTags.class, COLLECTION_NAME);
	}
	
	public List<UserTags> listUserTags(int limit) {
		
		BasicQuery query = new BasicQuery("{\"title\": {$regex : '" + "All Classes" + "'} }");
		query.limit(limit);
		
		System.out.println(query.toString());

		return mongoTemplate.find(query, UserTags.class, COLLECTION_NAME);
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
