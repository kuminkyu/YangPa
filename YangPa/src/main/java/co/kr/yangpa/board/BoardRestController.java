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
	
	@RequestMapping(value = "/searchAll/{typeno}", method = RequestMethod.GET)
	public List<BoardDTO> searchAll(@PathVariable("typeno") String typeno) {
		List<BoardDTO> list = service.searchAll(typeno) ;
		
		return list;
	}
}
