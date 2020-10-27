package co.kr.yangpa.filter;

import java.util.List;

import co.kr.yangpa.board.BoardDTO;

public interface FilterService {

	public List<AddrDTO> selectLarge();

	public List<AddrDTO> selectMiddle(String lcode);

	public List<BoardDTO> filterList(FilterDTO inDTO);

}
