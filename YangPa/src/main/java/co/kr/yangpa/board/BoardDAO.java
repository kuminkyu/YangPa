package co.kr.yangpa.board;

import java.util.List;

public interface BoardDAO {

	public List<BoardDTO> searchAll(String typeno, String reqNum);

	public List<BoardDTO> getOption(String typeno);

	public int boardInsert(BoardDTO inDTO);

	public BoardDTO detail(String bno, String typeno);

	public String getTel(String id);

	public int cmtInsert(BoardDTO inDTO);

	public List<BoardDTO> cmtList(String bno);

}
