package com.project.petmily.member;

import java.util.List;

import com.project.petmily.util.Criteria;

public interface MemberService {
	void deleteMember(MemberVO vo);
	
	void updateMember(MemberVO vo);
	
	//한명의 멤버를 가져오기 (midx로)
	MemberVO getMember(MemberVO vo);
	
	List<MemberVO> getMemberList(Criteria cri);
	
	int getTotal(Criteria cri);
	
	// 카테고리 일반회원 리스트
	List<MemberVO> getFilterUserList1(Criteria cri);
	
	// 카테고리 탈퇴예정회원 리스트
	List<MemberVO> getFilterUserList2(Criteria cri);
	
	//------황균이형 부분-------
	//한명의 멤버를 가져오기 (mid로)
	MemberVO getMemberByMid(MemberVO vo);
	
	//멤버리스트를 가져오기
	List<MemberVO> getMemberList();
	
	//멤버를 새로 등록하기
	void registMember(MemberVO mvo);

	void updateMyInfo(MemberVO mvo);

	void memberOut(MemberVO mvo);
}
