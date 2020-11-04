package co.kr.yangpa.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/pageRest")
public class PageRestController {
	
	@Autowired
	private PageService service;
	
	@RequestMapping(value = "/pageCount/{typeno}" , method = RequestMethod.GET)
	public int pageCount(@PathVariable("typeno") String typeno
				, Model model) {
		
		int totCnt = service.totCnt(typeno);
		int maxPage = totCnt / 10;
		if(totCnt % 10 > 0) {
			maxPage = maxPage + 1;
		}
		
		model.addAttribute("maxPage", maxPage);
		return totCnt;
	}
}
