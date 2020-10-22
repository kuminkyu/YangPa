package co.kr.yangpa.filter;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value= "/filter")
public class FilterController {
	
	@RequestMapping(value = "/filterselect", method = RequestMethod.GET)
	public String filterList(FilterDTO inDTO) {
		System.out.println("======================");
		System.out.println(inDTO.getBun());
		System.out.println(inDTO.getLargelist());
		System.out.println(inDTO.getMiddlelist());
		System.out.println(inDTO.getMinprice());
		System.out.println(inDTO.getMaxprice());
		System.out.println(inDTO.getKind());
		System.out.println(inDTO.getOption().toString());
		System.out.println(inDTO.getUseday());
		
		
		return "list";
	}
	
}
