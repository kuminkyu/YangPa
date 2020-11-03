package co.kr.yangpa.page;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.yangpa.member.MbrDTO;

@Repository
public class PageDAOImpl implements PageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int totCnt(String typeno) {
		
		if(typeno.equals("0")) {
			typeno = "";
		}
		int totCnt = sqlSession.selectOne("PageMapper.totCnt", typeno);
		
		return totCnt;
	}

	@Override
	public int update(MbrDTO inDto) {
		System.out.println("dao : " + inDto);
		
		int successCnt = sqlSession.update("PageMapper.update", inDto);
		return successCnt;
	}

}
