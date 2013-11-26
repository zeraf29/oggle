package com.mju.oggle.mongodb;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.stereotype.Repository;

import com.mju.oggle.model.Document;
import com.mju.oggle.model.Person;

@Repository
public class DocumentService {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public static final String COLLECTION_NAME = "index";
	
	public void addDocument(Document doc) {
		if (!mongoTemplate.collectionExists(Document.class)) {
			mongoTemplate.createCollection(Document.class);
		}		
		doc.setId(UUID.randomUUID().toString());
		mongoTemplate.insert(doc, COLLECTION_NAME);
	}
	
	public List<Document> listDocument() {
		
		return mongoTemplate.findAll(Document.class, COLLECTION_NAME);
	}
	
	public List<Document> listDocument(int limit) {
		
		BasicQuery query = new BasicQuery("{\"title\": {$regex : '" + "All Classes" + "'} }");
		query.limit(limit);
		
		System.out.println(query.toString());

		return mongoTemplate.find(query, Document.class, COLLECTION_NAME);
	}
	
	public Document selectDocument() {

//		BasicQuery query = new BasicQuery("{name : 'aaa'}");
//		BasicQuery query = new BasicQuery("{\"name\": {$regex : '" + "vc" + "'} }");
//		BasicQuery query = new BasicQuery("{title : 'Welcome to Apache Nutch'}");
		BasicQuery query = new BasicQuery("{\"title\": {$regex : '" + "to" + "'} }");

//		query.limit(limit);
		
		System.out.println(query.toString());
		
		return mongoTemplate.findOne(query, Document.class, COLLECTION_NAME);
	}
	
	
	public void deleteDocument(Document doc) {
		mongoTemplate.remove(doc, COLLECTION_NAME);
	}
	
	public void updateDocument(Document doc) {
		mongoTemplate.insert(doc, COLLECTION_NAME);		
	}
}
