package com.mju.oggle.mongodb;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mju.oggle.model.Document;

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
		
//		Criteria cri = new Criteria(COLLECTION_NAME);
//		Query query = new Query();
//		query.with(new Sort(Sort.Direction.ASC, COLLECTION_NAME));
//		query.fields().
		
		Query query = new BasicQuery("{ title : /.*asd.*/ }");
		return mongoTemplate.find(query, Document.class);
		
//		return mongoTemplate.findAll(Document.class, COLLECTION_NAME);
	}
	
	
	public void deleteDocument(Document doc) {
		mongoTemplate.remove(doc, COLLECTION_NAME);
	}
	
	public void updateDocument(Document doc) {
		mongoTemplate.insert(doc, COLLECTION_NAME);		
	}
}
