package co.kr.yangpa.page;

import co.kr.yangpa.member.MbrDTO;

public interface PageDAO {

	public int totCnt(String typeno);

	public int update(MbrDTO inDto);

	public int myPageCount(String mno);

	public int myList(String mno);

}
