package co.kr.yangpa.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/memberRest")
public class MemberRestController {

	@Autowired
	private MemberService service;
	
	//관심목록 여부
	@RequestMapping(value = "/basket" , method = RequestMethod.GET)
	public int basket(MbrDTO inDTO) {
		
		int successCnt = service.basket(inDTO);
		
		return successCnt;
	}
	
	//로딩시 관심목록
	@RequestMapping(value = "/isBasket" , method = RequestMethod.GET)
	public int isBasket(MbrDTO inDTO) {
		
		int basket = service.isBasket(inDTO);
		
		return basket;
	}
}
