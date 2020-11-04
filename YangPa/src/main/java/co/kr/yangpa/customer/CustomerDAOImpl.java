package co.kr.yangpa.customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public List<CustomerDTO> customerService() {
		List<CustomerDTO> list = sqlsession.selectList("CustomerMapper.customerService");
		return list;
	} //customerService

} //
