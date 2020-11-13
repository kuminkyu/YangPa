package co.kr.yangpa.freeboard;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;





@Service
public class FBServiceImpl implements FBService {

	@Autowired
	private FBDAO dao;

	@Override
	public FreeBoardDTO detail(String bno) {

		FreeBoardDTO dto = dao.detail(bno);

		return dto;
	}

	@Override
	public int writer(FreeBoardDTO inDto) {

		int successCnt = dao.writer(inDto);

		return successCnt;
	}

	@Override
	public List<FreeBoardDTO> list() {

		List<FreeBoardDTO> list = dao.list();

		return list;

	}//list

	@Override
	public int delete(FreeBoardDTO inDto) {
		int delCnt =  dao.delete(inDto);
		return delCnt;
	}

	@Override
	public int update(FreeBoardDTO inDto) {
		int updateCnt = dao.update(inDto);
		return updateCnt;
	}//update

	@Override
	public   FreeBoardDTO  fbuform(String bno) {
		System.out.println("ㅅ비스불러짐");
		FreeBoardDTO dto = dao.fbuform(bno);
		return dto;
	}

	@Override
	public int updateck(FreeBoardDTO inDto) {

        
		int upck =  dao.updateck(inDto);
		
		return upck;
	}

	
	

}


	

