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

}
