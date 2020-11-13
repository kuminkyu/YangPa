package co.kr.yangpa.notice;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.yangpa.batch.BatchController;


@Controller
public class NoticeController {

	private static final Logger logger
	= LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService service;
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String yangpaNotice(Model model) {
		List<NoticeDTO> list = service.yangpaNotice();
		model.addAttribute("notice_list", list);
		return "notice/notice";
	}//yangpaNotice
	
	/*
		controller : 주문(화면에서 data 받고, 화면에 data를 넘긴다.)
		service : 주방장(controller에게 업무를 받고, dao에게 일을 시킨다.)
		dao : 창고 담당(service의 명령에 따라, DBMS에 가서 자료를 가져온다.)
		mapper : 창고 보조(dao의 명령에 따라, DBMS에 가서 자료를 가져온다.)
		DB : 창고
	 */
	@RequestMapping(value = "/notice/detail_page", method = RequestMethod.GET)
	public String noticeDetail(String bno, Model model) {

		NoticeDTO dto = service.noticeDetail(bno);

		model.addAttribute("notice_dto", dto);

		return "notice/detail_page";
	}//noticeDetail
}//class
