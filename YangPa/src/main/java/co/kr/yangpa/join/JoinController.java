package co.kr.yangpa.join;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value="/join")
public class JoinController {

	private static final Logger logger
		= LoggerFactory.getLogger(JoinController.class);

	@Autowired
	private JoinService service;


}//class
