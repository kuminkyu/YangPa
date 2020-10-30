package co.kr.yangpa.member;

public interface MemberDAO {

	public int join(MbrDTO inDto);
	public int login(MbrDTO inDto);
	public int idCheck(MbrDTO inDto);
	

}
