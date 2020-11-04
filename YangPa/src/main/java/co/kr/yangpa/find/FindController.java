package co.kr.yangpa.find;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.yangpa.member.MbrDTO;

@Controller
public class FindController {

	@Autowired
	private FindService service;

	@RequestMapping(value = "/find", method = RequestMethod.POST)
	public String idFind(FindDTO inDTO, Model model) {

		MbrDTO dto = service.idFind(inDTO);

		if (dto == null) {
			return "member/login_fail";
		} else {
			model.addAttribute("find_id", dto);
			return "member/find_success_id";
		}

	}// idFind

	@RequestMapping(value = "/findpwd", method = RequestMethod.POST)
	public String findPwd(FindDTO inDTO2, Model model) {

		MbrDTO dto2 = service.findPwd(inDTO2);

		if (dto2 == null) {
			return "member/login_fail2";
		} else {

			model.addAttribute("find_pwd", dto2);
			return "member/find_success_pwd";
		}
	}
}
