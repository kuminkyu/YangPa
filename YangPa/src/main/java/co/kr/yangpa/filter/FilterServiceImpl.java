package co.kr.yangpa.filter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FilterServiceImpl implements FilterService {
	
	@Autowired
	private FilterDAO dao;
	
	@Override
	public List<FilterDTO> selectLarge() {
		
		List<FilterDTO> list = dao.selectLarge();
		
		return list;
	}

	@Override
	public List<FilterDTO> selectMiddle(String lcode) {
		
		List<FilterDTO> list = dao.selectMiddle(lcode);
		
		return list;
	}

}
