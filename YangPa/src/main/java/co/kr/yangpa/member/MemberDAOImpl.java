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
	

}
