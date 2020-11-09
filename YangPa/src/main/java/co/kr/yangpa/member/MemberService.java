package co.kr.yangpa.member;

public interface MemberService {

	int join(MbrDTO inDto);

	MbrDTO login(MbrDTO inDto);

	public int basket(MbrDTO inDTO);

	public int isBasket(MbrDTO inDTO);
}
