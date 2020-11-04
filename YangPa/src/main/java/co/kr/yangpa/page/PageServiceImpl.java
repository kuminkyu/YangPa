package co.kr.yangpa.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageServiceImpl implements PageService {

	@Autowired
	private PageDAO dao;
	
	@Override
	public int totCnt(String typeno) {
		
		int totCnt = dao.totCnt(typeno);
		
		return totCnt;
	}

}
