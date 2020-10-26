package co.kr.yangpa.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<BoardDTO> searchAll(String typeno) {
		
		if(typeno.equals("0")) {
			typeno = "";
		}
		List<BoardDTO> list = sqlSession.selectList("BoardMapper.searchAll",typeno);
		
		return list;
	}

}
