package com.mju.oggle.mongodb;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.mju.oggle.model.Person;

@Repository
public class PersonService {
	
	@Autowired
	private MongoTemplate mongoTemplate;
	
	public static final String COLLECTION_NAME = "person";
	
	public void addPerson(Person person) {
		if (!mongoTemplate.collectionExists(Person.class)) {
			mongoTemplate.createCollection(Person.class);
		}		
		person.setId(UUID.randomUUID().toString());
		mongoTemplate.insert(person, COLLECTION_NAME);
	}
	
	public List<Person> listPerson() {
		return mongoTemplate.findAll(Person.class, COLLECTION_NAME);
	}
	
	public Person selectPerson() {
		
//		BasicQuery query = new BasicQuery("{name : 'aaa'}");
		BasicQuery query = new BasicQuery("{\"name\": {$regex : '" + "vc" + "'} }");
		
		return mongoTemplate.findOne(query, Person.class);
	}
	
	public void deletePerson(Person person) {
		mongoTemplate.remove(person, COLLECTION_NAME);
	}
	
	public void updatePerson(Person person) {
		mongoTemplate.insert(person, COLLECTION_NAME);		
	}
}
