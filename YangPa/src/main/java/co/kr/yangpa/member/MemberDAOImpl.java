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
	public int login(MbrDTO inDto) {

		int successCnt = sqlSession.selectOne("MemberMapper.login", inDto);

		return successCnt;

	}

	@Override
	public int idCheck(MbrDTO inDto) {

		int successCnt = sqlSession.selectOne("MemberMapper.idCheck", inDto);

		return successCnt;
	}

	

}
