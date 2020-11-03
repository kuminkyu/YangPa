package co.kr.yangpa.join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAOImpl implements JoinDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public int idCheck(String id) {
		int idCount
			= sqlSession.selectOne("JoinMapper.idCheck", id);
		return idCount;
	}//idCheck

	@Override
	public int emailCheck(String em) {
        int emailCount
           =  sqlSession.selectOne("JoinMapper.emailCheck", em);
		return emailCount;
	}

	

}//class








