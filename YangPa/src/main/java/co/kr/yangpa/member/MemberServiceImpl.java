package co.kr.yangpa.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;

	@Override
	public int join(MbrDTO inDto) {

		int successCnt = dao.join(inDto);

		return successCnt;
	}

	@Override
	public MbrDTO login(MbrDTO inDto) {

		inDto = dao.login(inDto);
		
		return inDto;
	}
	
	@Override
	public int basket(MbrDTO inDTO) {
		
		int successCnt = dao.basket(inDTO);
		return successCnt;
	}

	@Override
	public int isBasket(MbrDTO inDTO) {
		
		int basket = dao.isBasket(inDTO);
				
		return basket;
	}

}
