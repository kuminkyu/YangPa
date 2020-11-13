package co.kr.yangpa.freeboard;

import java.util.List;

import co.kr.yangpa.freeboard.FreeBoardDTO;

public interface FBService {

	public FreeBoardDTO detail(String bno);


	public List<FreeBoardDTO> list();


	int writer(FreeBoardDTO inDto);


	public int delete(FreeBoardDTO inDto);


	public int update(FreeBoardDTO inDto);


	public   FreeBoardDTO fbuform(String bno);


	public int updateck(FreeBoardDTO inDto);








}
