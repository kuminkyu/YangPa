package co.kr.yangpa.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	
	@Override
	public List<BoardDTO> searchAll(String typeno) {
		List<BoardDTO> list = dao.searchAll(typeno) ;
		
		return list;
	}

}
