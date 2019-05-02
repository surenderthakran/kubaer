package com.surenderthakran.kubaer.api.controllers;

import com.surenderthakran.kubaer.common.types.Stock;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
class GetStockBySymbolController {

  @RequestMapping("/getstockbysymbol")
  Stock getStockBySymbol(@RequestParam(value="symbol") String symbol) {
    return new Stock("TEST", "Test Stock");
  }
}
