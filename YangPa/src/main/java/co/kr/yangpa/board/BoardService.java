package co.kr.yangpa.board;

import java.util.List;

public interface BoardService {

	public List<BoardDTO> searchAll(String typeno, String reqNum);

}
