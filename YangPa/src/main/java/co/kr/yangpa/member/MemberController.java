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
	}//find
	
	@RequestMapping(value = "/allow", method = RequestMethod.GET)
	public String aform() {
		return "member/allow";
	} //allow
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	} //allow
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	/*
	 * @RequestMapping(value = "/login", method = RequestMethod.POST) public String
	 * login(MbrDTO inDto, Model model, HttpSession session) {
	 * 
	 * int successCnt = service.login(inDto);
	 * 
	 * if(successCnt == 1) { //로그인 성공
	 * 
	 * session.setAttribute("login_id_session", inDto.getLogin_id()); return
	 * "redirect:/";
	 * 
	 * }else { //로그인 실패
	 * 
	 * if(successCnt == -1) { //id없음
	 * model.addAttribute("fail_msg","id가 없습니다. 회원가입 해주세요."); }else {
	 * model.addAttribute("fail_msg","pwd를 확인해 주세요.<br>"+"계속 로그인 안될경우 관리자에게 문의해주세요."
	 * ); }
	 * 
	 * return "member/login_fail"; }
	 * 
	 * return "member/login"; }//login
	 */
	
	
	@RequestMapping(value = "/join",method = RequestMethod.POST)
	public String join(MbrDTO inDto) {
		
		int successCnt = service.join(inDto);
		
		if(successCnt == 1) {
			return "redirect:/";
		}else {
			return "member/jfail";
		}
	}
	
	@RequestMapping(value = "/joinform", method = RequestMethod.GET)
	public String jform() {
		
		return "member/jform";
		
	} //joinForm	
	
	
}
