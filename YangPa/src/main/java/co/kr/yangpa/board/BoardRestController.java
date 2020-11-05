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
	
	@RequestMapping(value = "/getTel" , method = RequestMethod.GET)
	public String getTel(String id) {
		
		String tel = service.getTel(id);
		
		return tel ;
	}
	
	@RequestMapping(value = "/boardInsert" , method = RequestMethod.GET)
	public int boardInsert(BoardDTO inDTO) {
		
		System.out.println(inDTO.getWriter());
		System.out.println(inDTO.getType());
		System.out.println(inDTO.getTitle());
		System.out.println(inDTO.getContents());
		System.out.println(inDTO.getPrice());
		System.out.println(inDTO.getAddrcode());
		System.out.println(inDTO.getAddrdetail());
		System.out.println(inDTO.getAddrgps());
		System.out.println(inDTO.getUseday());
		System.out.println(inDTO.getBuy_type());
		
		int successCnt = service.boardInsert(inDTO);
		
		if(successCnt > 0) {
			return Integer.parseInt(inDTO.getType().substring(0,1));
		}else {
			return -1;
		}
		
	}
}
