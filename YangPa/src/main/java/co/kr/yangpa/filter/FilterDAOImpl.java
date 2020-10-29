package co.kr.yangpa.filter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.yangpa.board.BoardDTO;

@Repository
public class FilterDAOImpl implements FilterDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AddrDTO> selectLarge() {
		
		List<AddrDTO> list = sqlSession.selectList("FilterMapper.selectLarge");
		
		return list;
	}

	@Override
	public List<AddrDTO> selectMiddle(String lcode) {
		
		System.out.println(lcode);
		List<AddrDTO> list = sqlSession.selectList("FilterMapper.selectMiddle",lcode);
		
		return list;
	}

	@Override
	public List<BoardDTO> filterList(FilterDTO inDTO) {
		
		
		List<BoardDTO> list = sqlSession.selectList("FilterMapper.filterList",inDTO);
		
		return list;
	}

}
