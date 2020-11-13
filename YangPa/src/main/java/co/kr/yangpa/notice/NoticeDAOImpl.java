package co.kr.yangpa.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


}//class
