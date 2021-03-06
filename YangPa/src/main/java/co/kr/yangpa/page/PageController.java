package co.kr.yangpa.page;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.yangpa.member.MbrDTO;

@Controller
public class PageController {

	@Autowired
	private PageService service;
	
	@RequestMapping(value = "/changeid",method = RequestMethod.POST)
	public String update(MbrDTO inDto,Model model) {
		
		int successCnt = service.update(inDto);
		
		if(successCnt > 0) {
			return "main";
		}else {
			return "user/change_fail";
		}
	}//회원정보수정 - POST (GET은 MypageController에)
}
