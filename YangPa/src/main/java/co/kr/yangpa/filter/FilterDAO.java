package co.kr.yangpa.filter;

import java.util.List;

public interface FilterDAO {

	public List<FilterDTO> selectLarge();

	public List<FilterDTO> selectMiddle(String lcode);

}
