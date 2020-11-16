package co.kr.yangpa.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.protobuf.DescriptorProtos.FieldDescriptorProto.Type;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<BoardDTO> searchAll(String typeno , String reqNum) {
		
		if(typeno.equals("0")) {
			typeno = "";
		}
		SearchDTO dto = new SearchDTO();
		dto.setReqNum((Integer.parseInt(reqNum) - 1 )* 15);
		dto.setTypeno(typeno);
		System.out.println("reqNum : " + dto.getReqNum());
		List<BoardDTO> list = sqlSession.selectList("BoardMapper.searchAll",dto);
		
		return list;
	}


	@Override
	public List<BoardDTO> getOption(String typeno) {
		
		List<BoardDTO> list = sqlSession.selectList("BoardMapper.getOption",typeno);
		return list;
	}

	@Override
	public String getTel(String id) {
		
		String tel = sqlSession.selectOne("BoardMapper.getTel",id);
		
		return tel;
	}


	@Override
	public int cmtInsert(BoardDTO inDTO) {
		
		int successCnt = sqlSession.insert("BoardMapper.cmtInsert",inDTO);
		
		return successCnt;
	}


	@Override
	public List<BoardDTO> cmtList(String bno) {
		
		List<BoardDTO> cmtList = sqlSession.selectList("BoardMapper.cmtList",bno);
		
		return cmtList;
	}


	@Override
	public BoardDTO uform(String bno) {
		
		BoardDTO dto = sqlSession.selectOne("BoardMapper.uform", bno);
		
		return dto;
	}

	@Override
	public BoardDTO detail(String bno,String typeno) {
		BoardDTO dto = null;
		sqlSession.update("BoardMapper.viewCnt",bno);
		if(typeno.equals("1")) {
			dto = sqlSession.selectOne("BoardMapper.exdetail", bno);
		}else if(typeno.equals("2")){
			dto = sqlSession.selectOne("BoardMapper.trdetail", bno);
		}else if(typeno.equals("3")){
			dto = sqlSession.selectOne("BoardMapper.tidetail", bno);
		}else if(typeno.equals("4")){
			dto = sqlSession.selectOne("BoardMapper.etcdetail", bno);
		}
		
		return dto;
	}
	
	@Override
	public int boardInsert(BoardDTO inDTO) {
		
		int successCnt = sqlSession.insert("BoardMapper.boardInsert",inDTO);
		int typeInsert = 0;
		
		if(successCnt == 1) {
			String type = inDTO.getType();
			if(type.startsWith("1")) {
				typeInsert = sqlSession.insert("BoardMapper.exInsert",inDTO);
			}else if(type.startsWith("2")) {
				typeInsert = sqlSession.insert("BoardMapper.trInsert",inDTO);
			}else if(type.startsWith("3")) {
				typeInsert = sqlSession.insert("BoardMapper.tiInsert",inDTO);
			}else if(type.startsWith("4")) {
				typeInsert = sqlSession.insert("BoardMapper.etcInsert",inDTO);
			}else {
				return -1;
			}
		}else {
			return -1;
		}
		
		return typeInsert;
	}


	@Override
	public int boardUpdate(BoardDTO inDTO) {
		int successCnt = sqlSession.update("BoardMapper.boardUpdate", inDTO);
		int typeUpdate ;
		String type = inDTO.getType();
		int reInsert = 0;
		
		if(successCnt != 1) return -1;
		
		if(inDTO.getChangeAf().equals(inDTO.getChangeBf())) {
			//같은경우엔 업데이트만
			if(type.startsWith("1")) {
				typeUpdate = sqlSession.update("BoardMapper.exUpdate", inDTO);
			}else if(type.startsWith("2")) {
				typeUpdate = sqlSession.update("BoardMapper.trUpdate", inDTO);
			}else if(type.startsWith("3")) {
				typeUpdate = sqlSession.update("BoardMapper.tiUpdate", inDTO);
			}else if(type.startsWith("4")) {
				typeUpdate = sqlSession.update("BoardMapper.etcUpdate", inDTO);
			}else {
				return -1;
			}
			
			return typeUpdate;
		}else{
			//다를경우엔 인서트 와 delete 동시에
			int deleteCnt = sqlSession.delete("BoardMapper.deleteUpdate", inDTO);
			
			if(deleteCnt != 1) return -1;
			
			if(inDTO.getChangeAf().equals("1")) {
				reInsert = sqlSession.insert("BoardMapper.exInsert",inDTO);
			}else if(inDTO.getChangeAf().equals("2")) {
				reInsert = sqlSession.insert("BoardMapper.trInsert",inDTO);
			}else if(inDTO.getChangeAf().equals("3")) {
				reInsert = sqlSession.insert("BoardMapper.tiInsert",inDTO);
			}else if(inDTO.getChangeAf().equals("4")) {
				reInsert = sqlSession.insert("BoardMapper.etcInsert",inDTO);
			}else {
				return -1;
			}
		}
		
		return reInsert;
	}


	@Override
	public int delete(String bno) {
		
		int delCnt = sqlSession.delete("BoardMapper.delete",bno);
		
		if(delCnt != 1) {
			return -1;
		}
		return delCnt;
	}


	@Override
	public int sellComplete(String bno) {
		
		int sellCnt = sqlSession.update("BoardMapper.sellComplete",bno);
		
		return sellCnt;
	}

}
