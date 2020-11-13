package co.kr.yangpa.freeboard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class FBRestController {
	

	
	
	@Autowired
	private  FBService service;
	
	@RequestMapping(value ="/free_board/delete", method = RequestMethod.DELETE)
	public int delete(@RequestBody FreeBoardDTO inDto) {
		
		int delCnt =  service.delete(inDto);
		return  delCnt;
	}

	@RequestMapping(value = "/free_board/updateck", method = RequestMethod.GET)
	public int updateck(FreeBoardDTO inDto) {
		int upck =  service.updateck(inDto);
		return upck;
	}
	
	@RequestMapping(value = "/free_board/update" , method = RequestMethod.POST)
	public int update(FreeBoardDTO inDto) {
		int updateCnt = service.update(inDto);
		
		return updateCnt;
		
	}
}

