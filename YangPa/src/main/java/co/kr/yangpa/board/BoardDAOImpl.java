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
	public List<BoardDTO> searchAll(String typeno , String reqNum) {
		
		if(typeno.equals("0")) {
			typeno = "";
		}
		SearchDTO dto = new SearchDTO();
		dto.setReqNum((Integer.parseInt(reqNum) - 1 )* 15);
		dto.setTypeno(typeno);
		System.out.println("reqNum : " + dto.getReqNum());
		List<BoardDTO> list = sqlSession.selectList("BoardMapper.searchAll",dto);
		
		return list;
	}

}
