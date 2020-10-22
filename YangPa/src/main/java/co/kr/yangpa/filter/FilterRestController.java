package co.kr.yangpa.filter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/filterRest")
public class FilterRestController {
	
	@Autowired
	private FilterService service;
	
	@RequestMapping(value = "/selectLarge" , method = RequestMethod.GET)
	public List<FilterDTO> selectLarge() {
		
		List<FilterDTO> list = service.selectLarge();
		return list;
	}
	
	@RequestMapping(value = "/selectMiddle" , method = RequestMethod.GET)
	public List<FilterDTO> selectMiddle(String lcode) {
		
		List<FilterDTO> list = service.selectMiddle(lcode);
		return list;
	}
}

