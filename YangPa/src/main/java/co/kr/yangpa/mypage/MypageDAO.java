package co.kr.yangpa.mypage;

import java.util.List;

import co.kr.yangpa.board.BoardDTO;

public interface MypageDAO {

	List<BoardDTO> mypage(String mno);

	List<BoardDTO> basket_list(String mno);

}
