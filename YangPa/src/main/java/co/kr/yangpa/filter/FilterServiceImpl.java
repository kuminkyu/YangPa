package co.kr.yangpa.filter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.yangpa.board.BoardDTO;

@Service
public class FilterServiceImpl implements FilterService {
	
	@Autowired
	private FilterDAO dao;
	
	@Override
	public List<AddrDTO> selectLarge() {
		
		List<AddrDTO> list = dao.selectLarge();
		
		return list;
	}

	@Override
	public List<AddrDTO> selectMiddle(String lcode) {
		
		List<AddrDTO> list = dao.selectMiddle(lcode);
		
		return list;
	}

	@Override
	public List<BoardDTO> filterList(FilterDTO inDTO) {
		
		List<BoardDTO> list = dao.filterList(inDTO);
		
		return list;
	}

}
