package co.kr.yangpa.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		
		
		return "board/list";
	}
	
}
