package co.kr.yangpa.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		
		
		return "board/list";
	}
	
	@RequestMapping(value = "/mainlist", method = RequestMethod.GET)
	public String search(String maintype, Model model) {
		model.addAttribute("maintype",maintype);
		
		
		return "board/list";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String name(String bno) {
		
		System.out.println(bno);
		
		return "board/detail";
	}
	
}
