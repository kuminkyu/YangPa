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

		String where = inDTO.getOption().replace("[","");
		where = where.replace("]", "");
		
		String[] whereList = where.split(",");
		inDTO.setWhere(whereList);
		
		List<BoardDTO> list = service.filterList(inDTO);
		
		model.addAttribute("filter_list", list);
		System.out.println(list.get(0).getBno());
		System.out.println(list.get(0).getType());
		System.out.println(list.get(0).getTitle());
		
		return "board/list";
	}
	
	@RequestMapping(value = "/test" , method= RequestMethod.GET)
	public String test() {
		
		return "board/list";
	}
	
}
