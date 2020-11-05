package co.kr.yangpa.page;

import co.kr.yangpa.member.MbrDTO;

public interface PageService {

	public int totCnt(String typeno);

	public int update(MbrDTO inDto);

}
