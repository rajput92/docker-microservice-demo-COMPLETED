package in.notix.repository;
import in.notix.entity.ExchangeValue;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * @author Vinu Sagar
 * notiX
 */
//@Repository
public interface ExchangeValueRepository extends JpaRepository<ExchangeValue, Long> {
    ExchangeValue findByFromAndTo(String from, String to);
}