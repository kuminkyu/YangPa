package co.kr.yangpa.freeboard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository
public class FBDAOImpl implements FBDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public FreeBoardDTO detail(String bno) {

		FreeBoardDTO dto
			= sqlSession.selectOne("freeboard-mapper.detail", bno);

		return dto;
	}

	@Override
	public int writer(FreeBoardDTO inDto) {

		int successCnt
			= sqlSession.insert("freeboard-mapper.writer", inDto);

		return successCnt;
	}

	@Override
	public List<FreeBoardDTO> list() {

		List<FreeBoardDTO> list
			= sqlSession.selectList("freeboard-mapper.list");

		return list;
	}//list

	@Override
	public int delete(FreeBoardDTO inDto) {
		int delCnt =  sqlSession.delete("freeboard-mapper.delete", inDto);
		
		
		return delCnt;
	}

	@Override
	public int update(FreeBoardDTO inDto) {
		int updateCnt
		= sqlSession.update("freeboard-mapper.update", inDto);
		return updateCnt;
	}

	@Override
	public  FreeBoardDTO fbuform(String bno) {
		System.out.println("daoimpl 에서 불러짐");
		FreeBoardDTO dto
		= sqlSession.selectOne("freeboard-mapper.uform", bno);
		return dto;
	}

	@Override
	public int updateck(FreeBoardDTO inDto) {
		int upck  = sqlSession.selectOne("freeboard-mapper.updateck", inDto);
		return upck;
	}






}//class
