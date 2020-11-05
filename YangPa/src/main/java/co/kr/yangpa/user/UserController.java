package co.kr.yangpa.user;

import javax.servlet.http.HttpSession;

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
	
	
	
	

	
	
}
