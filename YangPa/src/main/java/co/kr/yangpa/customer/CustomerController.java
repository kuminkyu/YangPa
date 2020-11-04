package co.kr.yangpa.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public String customerService(Model model) {
		
		List<CustomerDTO> list = service.customerService();
		model.addAttribute("customer_list", list);
		return "user/customer";
	} //customerService
}//class
