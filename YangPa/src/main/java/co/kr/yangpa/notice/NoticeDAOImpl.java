package co.kr.yangpa.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.yangpa.board.BoardDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> yangpaNotice() {
		List<NoticeDTO> list = sqlSession.selectList("NoticeMapper.yangpaNotice");
		return list;
	}//yangpaNotice

	@Override
	public NoticeDTO noticeDetail(String bno) {
		sqlSession.update("NoticeMapper.updatecnt",bno);
		NoticeDTO dto = sqlSession.selectOne("NoticeMapper.noticeDetail", bno);
		return dto;
	}//noticeDetail

	@Override
	public int write(BoardDTO inDTO) {
		
		int successCnt = sqlSession.insert("NoticeMapper.write",inDTO);
		
		return successCnt;
	}

	@Override
	public int delete(BoardDTO inDTO) {
		
		int successCnt = sqlSession.delete("NoticeMapper.delete", inDTO);
		return successCnt;
	}


}//class
