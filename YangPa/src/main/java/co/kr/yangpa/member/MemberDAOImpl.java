package co.kr.yangpa.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int join(MbrDTO inDto) {

		int successCnt = sqlSession.insert("MemberMapper.join", inDto);

		return successCnt;
	}

	@Override
	public MbrDTO login(MbrDTO inDto) {
		int successCnt = sqlSession.selectOne("MemberMapper.login", inDto);
		
		if(successCnt > 0) {
			inDto = sqlSession.selectOne("MemberMapper.getinfo",inDto);
		}else {
			return null;
		}
		
		return inDto;

	}
	@Override
	public int basket(MbrDTO inDTO) {
		int successCnt = sqlSession.update("MemberMapper.basket", inDTO);
		if(successCnt == 0) {
			successCnt = sqlSession.insert("MemberMapper.basketFirst" , inDTO);
		}
		
		return successCnt;
	}

	@Override
	public int isBasket(MbrDTO inDTO) {
		
		int basket = sqlSession.selectOne("MemberMapper.isBasket" , inDTO);
		System.out.println("basket : " + basket);
		return basket;
	}

}
