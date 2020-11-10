package co.kr.yangpa.board;

import java.util.List;

public interface BoardService {

	public List<BoardDTO> searchAll(String typeno, String reqNum);

	public List<BoardDTO> getOption(String typeno);

	public int boardInsert(BoardDTO inDTO);

	public BoardDTO detail(String bno, String typeno);

	public String getTel(String id);

	public int cmtInsert(BoardDTO inDTO);

	public List<BoardDTO> cmtList(String bno);

	public BoardDTO uform(String bno);

	public int boardUpdate(BoardDTO inDTO);

	public int delete(String bno);

}
