package com.project.petmily.member;

import java.util.List;

public interface MemberService {

	//한명의 멤버를 가져오기 (midx로)
	MemberVO getMember(MemberVO mvo);
	
	
	//멤버리스트를 가져오기
	List<MemberVO> getMemberList();
	
	//멤버를 새로 등록하기
	void registMember(MemberVO mvo);
	
}
