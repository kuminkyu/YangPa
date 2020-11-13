package co.kr.yangpa.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.yangpa.board.BoardDTO;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> mypage(BoardDTO inDto) {
		
		inDto.setReqNum((inDto.getReqNum()-1)*15);
		
		List<BoardDTO> list = sqlSession.selectList("MypageMapper.mylist",inDto);
				
		return list;
	}

	@Override
	public List<BoardDTO> basket_list(BoardDTO inDto) {
		
		inDto.setReqNum((inDto.getReqNum()-1)*15);
		
		List<BoardDTO> list = sqlSession.selectList("MypageMapper.mybasket",inDto);
		
		return list;
	}

}
