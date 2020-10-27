package co.kr.yangpa.board;

import java.util.List;

public interface BoardDAO {

	public List<BoardDTO> searchAll(String typeno, String reqNum);

}
