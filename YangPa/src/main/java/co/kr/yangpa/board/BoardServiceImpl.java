package co.kr.yangpa.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	
	@Override
	public List<BoardDTO> searchAll(String typeno , String reqNum) {
		List<BoardDTO> list = dao.searchAll(typeno, reqNum) ;
		
		return list;
	}


	@Override
	public List<BoardDTO> getOption(String typeno) {
		
		List<BoardDTO> list = dao.getOption(typeno);
		
		return list;
	}


	@Override
	public int boardInsert(BoardDTO inDTO) {
		int successCnt = dao.boardInsert(inDTO);
		
		return successCnt;
	}


	@Override
	public BoardDTO detail(String bno,String typeno) {
		
		BoardDTO dto = dao.detail(bno,typeno);
		
		return dto;
	}


	@Override
	public String getTel(String id) {
		
		String tel = dao.getTel(id);
		
		return tel;
	}


	@Override
	public int cmtInsert(BoardDTO inDTO) {
		
		int successCnt = dao.cmtInsert(inDTO);
		
		return successCnt;
	}


	@Override
	public List<BoardDTO> cmtList(String bno) {
		
		List<BoardDTO> cmtList = dao.cmtList(bno);
		
		return cmtList;
	}


	@Override
	public BoardDTO uform(String bno) {
		
		BoardDTO dto = dao.uform(bno);
		
		return dto;
	}


	@Override
	public int boardUpdate(BoardDTO inDTO) {
		
		int successCnt = dao.boardUpdate(inDTO);
		
		return successCnt;
	}


	@Override
	public int delete(String bno) {
		
		int delCnt = dao.delete(bno);
		
		return delCnt;
	}

}
