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
	}// ID/PWD찾기

	@RequestMapping(value = "/allow", method = RequestMethod.GET)
	public String aform() {
		return "member/allow";
	} // 회원약관동의

	@RequestMapping(value = "/loginform", method = RequestMethod.GET)
	public String login2() {
		return "member/login";
	} // 로그인창

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	} // 로그아웃

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MbrDTO inDto, Model model, HttpSession session) {

		inDto = service.login(inDto);
		
		if(inDto == null) {
			return "member/fail";
		}else {
			session.setAttribute("login_id_session", inDto.getId());
			session.setAttribute("login_mno_session", inDto.getMno());
			session.setAttribute("login_tel_session", inDto.getTel());
			session.setAttribute("login_role_session", inDto.getMbr_role());
			
			model.addAttribute("userinfo",inDto);
			
			return "main";
		}
		

	}// 로그인

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MbrDTO inDto) {

		int successCnt = service.join(inDto);

		if (successCnt == 1) {
			return "redirect:/";
		} else {
			return "member/jfail";
		}
	} // 회원가입

	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String jform() {

		return "member/jform";

	} // 회원가입창

}
