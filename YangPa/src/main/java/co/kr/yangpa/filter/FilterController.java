package co.kr.yangpa.filter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.yangpa.board.BoardDTO;

@Controller
@RequestMapping(value= "/filter")
public class FilterController {
	
	@Autowired
	private FilterService service;
	
	@RequestMapping(value = "/filterselect", method = RequestMethod.GET)
	public String filterList(FilterDTO inDTO , Model model) {
		System.out.println("======================");
		System.out.println(inDTO.getBun());
		System.out.println(inDTO.getLargelist());
		System.out.println(inDTO.getMiddlelist());
		System.out.println(inDTO.getMinprice());
		System.out.println(inDTO.getMaxprice());
		System.out.println(inDTO.getKind());
		System.out.println(inDTO.getOption());
		System.out.println(inDTO.getUseday());

		System.out.println("=====옵션목록들=====");
		for (int i = 0; i < inDTO.getOption().length; i++) {
			System.out.println(inDTO.getOption()[i]);
		}
		if(inDTO.getOption().length == 0 ) inDTO.setOption(null);
		if(inDTO.getLargelist().equals("0")) inDTO.setLargelist(null);
		if(inDTO.getMiddlelist().equals("0")) inDTO.setMiddlelist(null);
		if(inDTO.getMinprice().equals("")) inDTO.setMinprice(null);
		if(inDTO.getMaxprice().equals("")) inDTO.setMaxprice(null);
		if(inDTO.getUseday().equals("")) inDTO.setUseday(null);;
		
		List<BoardDTO> list = service.filterList(inDTO);
		
		model.addAttribute("filter_list", list);
		return "board/list";
	}
	
	@RequestMapping(value = "/test" , method= RequestMethod.GET)
	public String test() {
		
		return "board/list";
	}
	
}
