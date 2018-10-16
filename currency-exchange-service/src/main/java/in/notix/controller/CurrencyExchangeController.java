package in.notix.controller;

import in.notix.entity.ExchangeValue;
import in.notix.repository.ExchangeValueRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;

/**
 * @author Vinu Sagar
 * notiX
 */
@RestController
public class CurrencyExchangeController {

    @Autowired
    Environment env;
    @Autowired
    private ExchangeValueRepository repo;
//    Logger logger = LoggerFactory.getLogger(this.getClass());

    @GetMapping("/currency-exchange/from/{from}/to/{to}")
    public ExchangeValue retrieveExchangeValue(@PathVariable String from, @PathVariable String to){
        ExchangeValue eValue = repo.findByFromAndTo(from, to);
        eValue.setPort(Integer.parseInt(env.getProperty("local.server.port")));
        return eValue;

    }
}