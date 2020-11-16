package co.kr.yangpa.notice;

import java.util.List;

import co.kr.yangpa.board.BoardDTO;

public interface NoticeDAO {

	public List<NoticeDTO> yangpaNotice();

	public NoticeDTO noticeDetail(String bno);

	public int write(BoardDTO inDTO);

	public int delete(BoardDTO inDTO);


}
