package co.kr.yangpa.freeboard;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class FBController {

	
	
	
	private static final Logger logger
	= LoggerFactory.getLogger(FBController.class);

	
	@Autowired
	private FBService service;

	@RequestMapping(value="/free_board/list", method=RequestMethod.GET)
	public String list(Model model) {
		
		List<FreeBoardDTO> list = service.list();
		
		model.addAttribute("free_board_list", list);
		
		return "free_board/list";
		
	}//list
	
	@RequestMapping(value="/free_board/detail", method=RequestMethod.GET)
	public String detail(Model model, String bno) {

		FreeBoardDTO dto = service.detail(bno);

		model.addAttribute("free_board_dto", dto);
		return "free_board/detail";

	}//detail

	@RequestMapping(value="/writer", method=RequestMethod.POST)
	public String writer(FreeBoardDTO inDto) {

		System.out.println(inDto.getTitle());

		int succesCnt = service.writer(inDto);

		if(succesCnt == 1) {

			return "redirect:/free_board/list";

		} else {

			return "free_board/wfail";

		}

	}//writer

	@RequestMapping(value="/wform", method=RequestMethod.GET)
	public String writeForm() {

		return "free_board/wform";
	}//writeForm
	
	
	@RequestMapping(value = "/free_board/uform", method = RequestMethod.GET)
      public String fbuform(String bno , Model model) {
    	  FreeBoardDTO dto = service.fbuform(bno);

  		  model.addAttribute("free_boardDTO", dto);

    	  return"/free_board/uform";
	}//uform
	




}//class





