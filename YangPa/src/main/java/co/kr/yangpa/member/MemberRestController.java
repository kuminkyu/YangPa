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
	
	@RequestMapping(value = "/basket" , method = RequestMethod.GET)
	public int basket(MbrDTO inDTO) {
		
		int successCnt = service.basket(inDTO);
		
		return successCnt;
	}
	
	@RequestMapping(value = "/isBasket" , method = RequestMethod.GET)
	public int isBasket(MbrDTO inDTO) {
		
		int basket = service.isBasket(inDTO);
		
		return basket;
	}
}
