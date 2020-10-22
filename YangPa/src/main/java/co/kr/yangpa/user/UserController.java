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
	
	@RequestMapping(value = "/allow", method = RequestMethod.GET)
	public String home() {
		
		return "user/allow";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return "user/login";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find() {
		
		return "user/find";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() {
		
		return "user/write";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String update() {
		
		return "user/update";
	}
	
	@RequestMapping(value = "/aform1", method = RequestMethod.GET)
	public String aform() {
		return "user/allow";
	} //aform
	
	@RequestMapping(value = "/jform1", method = RequestMethod.GET)
	public String jform() {
		return "user/join";
	} //jform	
	
	@RequestMapping(value = "/mypg1", method = RequestMethod.GET)
	public String myPage() {
		return "user/mypage";
	} //myPage
 
}
