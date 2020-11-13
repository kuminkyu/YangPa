package co.kr.yangpa.notice;

import java.util.List;

public interface NoticeService {

	public List<NoticeDTO> yangpaNotice();

	public NoticeDTO noticeDetail(String bno);
	
}
