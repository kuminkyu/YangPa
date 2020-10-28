package co.kr.yangpa.user;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class UserController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		
		return "main";
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		
		return "writing/write";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {
		
		return "writing/update";
	}
	
	@RequestMapping(value = "/mypg1", method = RequestMethod.GET)
	public String myPage() {
		return "user/mypage";
	} //myPage

	
}
