package co.kr.yangpa.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	@Override
	public List<NoticeDTO> yangpaNotice() {
		List<NoticeDTO> list = dao.yangpaNotice();
		return list;
	}//yangpaNotice

	@Override
	public NoticeDTO noticeDetail(String bno) {
		NoticeDTO dto = dao.noticeDetail(bno);
		return dto;
	}


}//class
