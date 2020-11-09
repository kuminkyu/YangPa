package co.kr.yangpa.member;

public interface MemberDAO {

	public int join(MbrDTO inDto);
	public MbrDTO login(MbrDTO inDto);
	public int basket(MbrDTO inDTO);
	public int isBasket(MbrDTO inDTO);
	

}
