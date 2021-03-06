package co.kr.yangpa.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.yangpa.board.BoardDTO;


@Controller
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public String basket_list(Model model,BoardDTO inDto) {
		
		
		model.addAttribute("reqNum",inDto.getReqNum());
		List<BoardDTO> list = service.basket_list(inDto);
		
		model.addAttribute("mybasket",list);
		
		return "user/basket";
	}//장바구니
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(BoardDTO inDto, Model model) {
		
		model.addAttribute("reqNum",inDto.getReqNum());
		
		List<BoardDTO> list = service.mypage(inDto);
		model.addAttribute("mylist",list);
		
		return "user/mypage";
		
	}//내가쓴글
	
	@RequestMapping(value = "/change", method = RequestMethod.GET)
	public String change() {
		
		System.out.println();
		
		return "user/change";
	}//회원정보수정 - GET (POST은 PageController에)
	
	
}
