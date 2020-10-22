package co.kr.yangpa.filter;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FilterDAOImpl implements FilterDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<FilterDTO> selectLarge() {
		
		List<FilterDTO> list = sqlSession.selectList("FilterMapper.selectLarge");
		
		return list;
	}

	@Override
	public List<FilterDTO> selectMiddle(String lcode) {
		
		System.out.println(lcode);
		List<FilterDTO> list = sqlSession.selectList("FilterMapper.selectMiddle",lcode);
		
		for(int i = 0 ; i < list.size() ; i ++) {
			System.out.println(list.get(i).getAddrcode());
			System.out.println(list.get(i).getAddrname());
		}
		return list;
	}

}
