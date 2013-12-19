package org.apache.nutch.indexer.mongodb;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.util.StringUtils;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;
import org.apache.nutch.indexer.IndexerMapReduce;
import org.apache.nutch.indexer.NutchIndexWriterFactory;
import org.apache.nutch.util.HadoopFSUtil;
import org.apache.nutch.util.NutchConfiguration;
import org.apache.nutch.util.NutchJob;
import org.apache.nutch.util.TimingUtil;

public class MongodbIndexer  extends Configured implements Tool {
	public static Log LOG = LogFactory.getLog(MongodbIndexer.class);

	  public MongodbIndexer() {
	    super(null);
	  }

	  public MongodbIndexer(Configuration conf) {
	    super(conf);
	  }
	  
	  public void indexMongodb(String mongodbUrl, Path crawlDb, Path linkDb,
		      List<Path> segments) throws IOException {
		  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    long start = System.currentTimeMillis();
		    LOG.info("MongodbIndexer: starting at " + sdf.format(start));

		    final JobConf job = new NutchJob(getConf());
		    job.setJobName("index-mongodb " + mongodbUrl);

		    IndexerMapReduce.initMRJob(crawlDb, linkDb, segments, job);

		    job.set(MongodbConstants.SERVER_URL, mongodbUrl);

		    NutchIndexWriterFactory.addClassToConf(job, MongodbWriter.class);

		    job.setReduceSpeculativeExecution(false);

		    final Path tmp = new Path("tmp_" + System.currentTimeMillis() + "-" +
		                         new Random().nextInt());

		    FileOutputFormat.setOutputPath(job, tmp);
		    try {
		      // run the job and write the records to infinite (this will be done via the rest api
		      JobClient.runJob(job);
		      long end = System.currentTimeMillis();
		      LOG.info("MongodbIndexer: finished at " + sdf.format(end) + ", elapsed: " + TimingUtil.elapsedTime(start, end));
		    }
		    catch (Exception e){
		      LOG.error(e);
		    } finally {
		      FileSystem.get(job).delete(tmp, true);
		    }
		  }
	  
	  public int run(String[] args) throws Exception {
		    if (args.length < 4) {
		      System.err.println("Usage: MongodbIndexer <mongodb url> <crawldb> <linkdb> (<segment> ... | -dir <segments>)");
		      return -1;
		    }

		    final Path crawlDb = new Path(args[1]);
		    final Path linkDb = new Path(args[2]);

		    final List<Path> segments = new ArrayList<Path>();
		    for (int i = 3; i < args.length; i++) {
		      if (args[i].equals("-dir")) {
		        Path dir = new Path(args[++i]);
		        FileSystem fs = dir.getFileSystem(getConf());
		        FileStatus[] fstats = fs.listStatus(dir,
		                HadoopFSUtil.getPassDirectoriesFilter(fs));
		        Path[] files = HadoopFSUtil.getPaths(fstats);
		        for (Path p : files) {
		          segments.add(p);
		        }
		      } else {
		        segments.add(new Path(args[i]));
		      }
		    }

		    try {
		      indexMongodb(args[0], crawlDb, linkDb, segments);
		      return 0;
		    } catch (final Exception e) {
		      LOG.fatal("MongodbIndexer: " + StringUtils.stringifyException(e));
		      return -1;
		    }
		  }

	      // ./bin/nutch org.apache.nutch.indexer.mongodb.MongodbIndexer localhost crawldb crawldb/linkdb crawldb/segments/*
		  public static void main(String[] args) throws Exception {
		    final int res = ToolRunner.run(NutchConfiguration.create(), new MongodbIndexer(), args);
		    System.exit(res);
		  }
}
