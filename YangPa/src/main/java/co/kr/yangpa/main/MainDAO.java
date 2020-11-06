package co.kr.yangpa.main;

import java.util.List;

import co.kr.yangpa.board.BoardDTO;

public interface MainDAO {

	public List<BoardDTO> hotCard(String typeno);

}
