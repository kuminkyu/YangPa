package co.kr.yangpa.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import co.kr.yangpa.board.BoardDTO;

@RestController
public class NoticeRestController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "/notice/write" , method = RequestMethod.POST)
	public int write(BoardDTO inDTO) {
		
		int successCnt = service.write(inDTO);
		
		return successCnt;
	}
	
	@RequestMapping(value = "/notice/delete" , method = RequestMethod.GET)
	public int delete(BoardDTO inDTO) {
		
		int successCnt = service.delete(inDTO);
		
		return successCnt;
	}
}
