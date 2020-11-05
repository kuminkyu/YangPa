package co.kr.yangpa.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
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
	public String name(String bno, String typeno,Model model) {
		
		BoardDTO dto = service.detail(bno,typeno);
		model.addAttribute("detail_dto",dto);
		
		return "board/detail";
	}
	
}
