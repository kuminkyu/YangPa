package co.kr.yangpa.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find() {

		return "member/find";
	}// find

	@RequestMapping(value = "/allow", method = RequestMethod.GET)
	public String aform() {
		return "member/allow";
	} // allow

	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	} // login

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model, String bno) {
		
		
		
		return "user/mypage";
	} //myPage

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MbrDTO inDto, Model model, HttpSession session) {

		inDto = service.login(inDto);
		
		if(inDto == null) {
			return "member/login_fail";
		}else {
			session.setAttribute("login_id_session", inDto.getId());
			session.setAttribute("login_mno_session", inDto.getMno());
			
			model.addAttribute("userinfo",inDto);
			
			return "main";
		}
		

	}// login

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MbrDTO inDto) {

		int successCnt = service.join(inDto);

		if (successCnt == 1) {
			return "redirect:/";
		} else {
			return "member/jfail";
		}
	}

	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String jform() {

		return "member/jform";

	} // joinForm

}
