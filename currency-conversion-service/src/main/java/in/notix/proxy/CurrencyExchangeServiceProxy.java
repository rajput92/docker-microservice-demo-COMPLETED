package in.notix.proxy;



        import in.notix.bean.CurrencyConversionBean;
        import org.springframework.cloud.netflix.ribbon.RibbonClient;
        import org.springframework.cloud.openfeign.FeignClient;
        import org.springframework.context.annotation.Bean;
        import org.springframework.web.bind.annotation.GetMapping;
        import org.springframework.web.bind.annotation.PathVariable;

/**
 * @author Vinu Sagar
 * notiX
 */

//@FeignClient(name = "currency-exchange-service", url = "localhost:8000")
@FeignClient(name = "netflix-zuul-api-gateway")
@RibbonClient(name = "currency-exchange-service")
public interface CurrencyExchangeServiceProxy {

    @GetMapping("/currency-exchange-service/currency-exchange/from/{from}/to/{to}")
    public CurrencyConversionBean retrieveExchangeValue(@PathVariable("from") String from, @PathVariable("to") String to);
}
