package co.kr.yangpa.member;

public interface MemberDAO {

	public int join(MbrDTO inDto);
	public MbrDTO login(MbrDTO inDto);
	
	

}
