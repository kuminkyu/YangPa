package co.kr.yangpa.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BatchServiceImpl implements BatchService {

	@Autowired
	private BatchDAO dao;
	
	@Override
	public int updateState() {
		
		int successCnt = dao.updateState();
		
		return successCnt;
	}

}
