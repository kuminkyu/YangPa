package co.kr.yangpa.find;

import co.kr.yangpa.member.MbrDTO;

public interface FindService {

	public MbrDTO idFind(FindDTO inDTO);

	public MbrDTO findPwd(FindDTO inDTO2);


}
