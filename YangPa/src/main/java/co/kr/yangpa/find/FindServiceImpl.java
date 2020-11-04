package co.kr.yangpa.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.yangpa.member.MbrDTO;

@Service
public class FindServiceImpl implements FindService {

	@Autowired
	private FindDAO dao;
	
	@Override
	public MbrDTO idFind(FindDTO inDTO) {
		MbrDTO dto = dao.idFind(inDTO);
		return dto;
	}//idFind

	@Override
	public MbrDTO findPwd(FindDTO inDTO2) {
		MbrDTO dto2 = dao.findPwd(inDTO2);
		return dto2;
	}

}
