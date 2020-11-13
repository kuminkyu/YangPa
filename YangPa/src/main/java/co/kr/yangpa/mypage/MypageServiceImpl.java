package co.kr.yangpa.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.yangpa.board.BoardDTO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO dao;
	
	@Override
	public List<BoardDTO> mypage(BoardDTO inDto) {
		
		List<BoardDTO> list = dao.mypage(inDto);
		return list;
	}

	@Override
	public List<BoardDTO> basket_list(BoardDTO inDto) {
		
		List<BoardDTO> list = dao.basket_list(inDto);
		return list;
	}

}
