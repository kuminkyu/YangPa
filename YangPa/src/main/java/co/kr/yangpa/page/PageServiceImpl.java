package co.kr.yangpa.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.yangpa.member.MbrDTO;

@Service
public class PageServiceImpl implements PageService {

	@Autowired
	private PageDAO dao;
	
	@Override
	public int totCnt(String typeno) {
		
		int totCnt = dao.totCnt(typeno);
		
		return totCnt;
	}

	@Override
	public int update(MbrDTO inDto) {
		
		int successCnt = dao.update(inDto);
		
		return successCnt;
	}

	@Override
	public int myPageCount(String mno) {
		
		int totCnt = dao.myPageCount(mno);
		return totCnt;
	}

	@Override
	public int myList(String mno) {
		
		int totCnt = dao.myList(mno);
		
		return totCnt;
	}

}
