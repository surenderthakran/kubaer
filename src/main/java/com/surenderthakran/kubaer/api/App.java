package com.surenderthakran.kubaer.api;

import com.google.common.flogger.FluentLogger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
class App {
  private static final FluentLogger logger = FluentLogger.forEnclosingClass();

  public static void main(String[] args) {
    logger.atInfo().log("Hello World!");

    SpringApplication.run(App.class, args);
  }
}
