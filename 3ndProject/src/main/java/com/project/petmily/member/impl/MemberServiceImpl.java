package com.project.petmily.member.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.petmily.member.MemberService;
import com.project.petmily.member.MemberVO;

@Repository("memberService")
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO getMember(MemberVO mvo) {
	return memberDAO.getMember(mvo);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public void registMember(MemberVO mvo) {
		memberDAO.registMember(mvo);
	}

}
