package co.kr.yangpa.member;

public interface MemberService {

	int join(MbrDTO inDto);

	MbrDTO login(MbrDTO inDto);

	
}
