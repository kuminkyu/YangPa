package co.kr.yangpa.batch;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BatchDAOImpl implements BatchDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int updateState() {
		int successCnt =  sqlSession.update("BatchMapper.exUpdateLimitDate");
		successCnt =  sqlSession.update("BatchMapper.exUpdateState");
		successCnt =  sqlSession.update("BatchMapper.trUpdateState");
		successCnt =  sqlSession.update("BatchMapper.tiUpdateState");
			
		
		return successCnt;
	}

}
