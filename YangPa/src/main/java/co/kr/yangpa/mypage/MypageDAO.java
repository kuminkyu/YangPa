package co.kr.yangpa.mypage;

import java.util.List;

import co.kr.yangpa.board.BoardDTO;

public interface MypageDAO {

	List<BoardDTO> mypage(String mno);

}
