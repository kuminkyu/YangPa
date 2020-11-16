package co.kr.yangpa.notice;

import java.util.List;

import co.kr.yangpa.board.BoardDTO;

public interface NoticeService {

	public List<NoticeDTO> yangpaNotice();

	public NoticeDTO noticeDetail(String bno);

	public int write(BoardDTO inDTO);

	public int delete(BoardDTO inDTO);
	
}
