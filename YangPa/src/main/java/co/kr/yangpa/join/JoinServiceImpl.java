package co.kr.yangpa.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoinServiceImpl implements JoinService {

	
	@Autowired
	private JoinDAO dao;
	
	
	@Override
	public int idCheck(String id) {
		int idCount = dao.idCheck(id);
		return idCount;
	}


	@Override
	public int emailCheck(String em) {
         int emailCount = dao.emailCheck(em);
		return emailCount;
	}

}
