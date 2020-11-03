package co.kr.yangpa.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/boardRest")
public class BoardRestController {

	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/searchAll/{typeno}/{reqNum}", method = RequestMethod.GET)
	public List<BoardDTO> searchAll(@PathVariable("typeno") String typeno,
			@PathVariable("reqNum") String reqNum) {
		System.out.println(reqNum);
		List<BoardDTO> list = service.searchAll(typeno ,reqNum) ;
		
		return list;
	}
	
	@RequestMapping(value = "/getOption" , method = RequestMethod.GET)
	public List<BoardDTO> getOption(String typeno) {
		
		List<BoardDTO> list = service.getOption(typeno);
		
		return list ;
	}
}
