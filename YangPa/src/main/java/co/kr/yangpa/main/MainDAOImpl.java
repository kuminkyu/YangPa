package co.kr.yangpa.main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.yangpa.board.BoardDTO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDTO> hotCard(String typeno) {
		
		List<BoardDTO> list = sqlSession.selectList("MainMapper.hotCard",typeno);
		return list;
	}

}
