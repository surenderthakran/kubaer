package com.surenderthakran.kubaer.api;

import com.google.common.flogger.FluentLogger;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.ServerAddress;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class App {
  private static final FluentLogger logger = FluentLogger.forEnclosingClass();

  public static void main(String[] args) {
    logger.atInfo().log("Hello World!");

    // MongoClient mongoClient = new MongoClient(new MongoClientURI("mongodb://172.17.0.1:27017"));
    MongoClient mongoClient = new MongoClient(new ServerAddress("172.17.0.1", 27017));
    DB database = mongoClient.getDB("dev");

    DBCollection collection = database.getCollection("stocks");
    BasicDBObject document = new BasicDBObject();
    document.put("symbol", "TEST");
    document.put("name", "Test Stock");
    collection.insert(document);

    SpringApplication.run(App.class, args);
  }
}
