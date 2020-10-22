package co.kr.yangpa.filter;

import java.util.List;

public interface FilterService {

	public List<FilterDTO> selectLarge();

	public List<FilterDTO> selectMiddle(String lcode);

}
