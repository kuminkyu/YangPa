package co.kr.yangpa.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDAO dao;
	
	@Override
	public List<CustomerDTO> customerService() {
		List<CustomerDTO> list = dao.customerService();
		return list;
	}

}
