package org.apache.nutch.indexer.mongodb;

import java.io.IOException;
import java.util.Date;
import java.util.Map.Entry;

import org.apache.hadoop.mapred.JobConf;
import org.apache.nutch.indexer.NutchDocument;
import org.apache.nutch.indexer.NutchField;
import org.apache.nutch.indexer.NutchIndexWriter;
import org.apache.solr.common.util.DateUtil;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

public class MongodbWriter  implements NutchIndexWriter{

	private Mongo mongo;
	  
	@Override
	public void open(JobConf job, String name) throws IOException {
		//mongo = new Mongo(job.get(MongodbConstants.SERVER_URL));		
		mongo = new Mongo("127.0.0.1", 27017);
	}

	@Override
	public void write(NutchDocument doc) throws IOException {
		
		// Connect to a mongodb database
		DB db = mongo.getDB( "oggle" );
        DBCollection col = db.getCollection("oggletest");
        
        // Setup the mongodb db object
	    BasicDBObject mongoDoc = new BasicDBObject();
	    
	    for(final Entry<String, NutchField> e : doc) {  
	      for (final Object val : e.getValue().getValues()) {
	    	String key;
	        // normalise the string representation for a Date
	        Object val2 = val;
	        if (val instanceof Date){
	          key = e.getKey();
	          val2 = DateUtil.getThreadLocalDateFormat().format(val);
	          mongoDoc.put(key, val2);
	        } else {
	          key = e.getKey();
	          mongoDoc.put(key, val);
	        }
	      }
	    }
	    // insert the document into mongodb
	    col.insert(mongoDoc);
	    //col.save(mongoDoc);
	}

	@Override
	public void close() throws IOException {
		if ( mongo != null ) {
			mongo.close();
			mongo = null;
		}
	}

}
