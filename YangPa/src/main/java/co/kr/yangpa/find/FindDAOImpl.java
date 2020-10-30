package co.kr.yangpa.find;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.yangpa.member.MbrDTO;

@Repository
public class FindDAOImpl implements FindDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MbrDTO idFind(FindDTO inDTO) {
		
		int successCnt = sqlSession.selectOne("FindMapper.idFind", inDTO);
		
		if(successCnt == 0) {
			return null;		
		}else {
			MbrDTO dto = sqlSession.selectOne("FindMapper.idFind2", inDTO);
			return dto;
		}
				
	}//idFind

	@Override
	public MbrDTO findPwd(FindDTO inDTO2) {
		
		int successCnt = sqlSession.selectOne("FindMapper.findPwd",inDTO2);
		
		if(successCnt == 0) {
			return null;
		}else {
			MbrDTO dto2 = sqlSession.selectOne("FindMapper.findPwd2",inDTO2);
			return dto2;
		}
	}

}
