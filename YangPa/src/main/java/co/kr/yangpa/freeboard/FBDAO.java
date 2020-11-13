package co.kr.yangpa.freeboard;

import java.util.List;

public interface FBDAO {

	FreeBoardDTO detail(String bno);

	int writer(FreeBoardDTO inDto);

	List<FreeBoardDTO> list();

	int delete(FreeBoardDTO inDto);


	int update(FreeBoardDTO inDto);

	FreeBoardDTO fbuform(String bno);

	int updateck(FreeBoardDTO inDto);





}
