package co.kr.yangpa.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.kr.yangpa.board.BoardDTO;

@RestController
public class MainRestController {

	@Autowired
	private MainService service;
	
	@RequestMapping(value = "/hot" , method = RequestMethod.GET)
	public List<BoardDTO> hotCard(String typeno) {
	
		List<BoardDTO> list = service.hotCard(typeno);
		
		return list;
	}
	
	
}
