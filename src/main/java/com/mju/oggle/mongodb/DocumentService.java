package com.mju.oggle.mongodb;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mju.oggle.model.Document;

@Repository
public class DocumentService {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public static final String COLLECTION_NAME = "oggletest";
	
	public List<Document> listDocument() {
		
		return mongoTemplate.findAll(Document.class, COLLECTION_NAME);
	}
	
	public List<Document> listDocument(int limit) {
		
		BasicQuery query = new BasicQuery("{\"title\": {$regex : '" + "All Classes" + "'} }");
		query.limit(limit);
		
		System.out.println(query.toString());

		return mongoTemplate.find(query, Document.class, COLLECTION_NAME);
	}
	
	public List<Document> listDocument(String regex, List<String> list) {
		
		Query query = new Query();
		query.addCriteria(Criteria.where("content").regex(regex).and("_id").nin(list));
		
		
		return mongoTemplate.find(query, Document.class, COLLECTION_NAME);
	}
	
	public Document selectTopBoostDocument(String regex) {

		Document doc = null;
		//(?i)
//		BasicQuery query = new BasicQuery("{name : 'aaa'}");
		BasicQuery query = new BasicQuery("{\"content\": {$regex : '" +"(?i)"+ regex + "'} }");
		query.with(new Sort(Direction.DESC, "boost"));
//		query.limit(limit);
		
		doc = mongoTemplate.findOne(query, Document.class, COLLECTION_NAME);
		
		return doc;
	}
	
	public Document selectTopBoostDocument(String regex, List<String> list) {

		Document doc = null;
		
		Query query = new Query();
		query.addCriteria(Criteria.where("content").regex(regex).and("_id").nin(list));
		query.with(new Sort(Direction.DESC, "boost"));
		
		//(?i)
//		BasicQuery query = new BasicQuery("{name : 'aaa'}");
//		BasicQuery query = new BasicQuery("{\"content\": {$regex : '" +"(?i)"+ regex + "'} }");
//		query.with(new Sort(Direction.DESC, "boost"));
//		query.limit(limit);
		
		doc = mongoTemplate.findOne(query, Document.class, COLLECTION_NAME);
		
		return doc;
	}
	
	
	public void deleteDocument(Document doc) {
		mongoTemplate.remove(doc, COLLECTION_NAME);
	}
	
	public void updateDocument(Document doc) {
		mongoTemplate.insert(doc, COLLECTION_NAME);		
	}
}
