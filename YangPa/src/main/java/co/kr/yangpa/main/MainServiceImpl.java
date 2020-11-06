package co.kr.yangpa.main;

import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.yangpa.board.BoardDTO;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;
	
	@Override
	public List<BoardDTO> hotCard(String typeno) {
		
		List<BoardDTO> list = dao.hotCard(typeno);
		String html ;
		Document doc;
		Elements ele;
		for (BoardDTO boardDTO : list) {
			html = boardDTO.getContents();
			doc = Jsoup.parse(html);
			ele = doc.getElementsByTag("img");
			if(doc.text().length() > 20) {
				boardDTO.setContents(doc.text().substring(0,20) + "...."); //내용이 너무길어 자름
			}else {
				boardDTO.setContents(doc.text()); //카드안의 내용
			}
			String title = boardDTO.getTitle();
			if(title.length() > 10) {
				boardDTO.setTitle(title.substring(0,10) + "..."); //제목이 너무길어 자름
			}
			
			if(ele.size() != 0) {
				boardDTO.setIn_tel(ele.get(0).attr("src").toString());
			}else {
				boardDTO.setIn_tel("/yangpa/ckimg/noimage.png");
			}
			
		}
		return list;
	}

}
