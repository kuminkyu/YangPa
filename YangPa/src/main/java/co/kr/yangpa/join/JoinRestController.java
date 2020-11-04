package co.kr.yangpa.join;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JoinRestController {

	private static final Logger logger
		= LoggerFactory.getLogger(JoinRestController.class);

	@Autowired
	private JoinService service;

	@RequestMapping(value="/idchk", method=RequestMethod.GET)
	public String idCheck(String id) {
		logger.info("idchk");
		int idCount = service.idCheck(id);
		logger.info("idchk : "+idCount);
		return ""+idCount;
	}//idCheck

}//class
