package com.surenderthakran.kubaer.api;

import com.google.common.flogger.FluentLogger;

class App {
  private static final FluentLogger logger = FluentLogger.forEnclosingClass();

  public static void main(String[] args) {
    logger.atInfo().log("Hello World!");
  }
}
