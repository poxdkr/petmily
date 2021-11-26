package com.project.petmily.member.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.member.MemberService;
import com.project.petmily.member.MemberVO;
import com.project.petmily.util.Criteria;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	public MemberServiceImpl() {
		System.out.println("MemberServiceImpl() 객체 생성");
	}
	
	@Override
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) {
		return memberDAO.getMemberList(cri);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return memberDAO.getMember(vo);
	}

	@Override
	public void updateMember(MemberVO vo) {
		memberDAO.updateMember(vo);
	}

	@Override
	public int getTotal(Criteria cri) {
		System.out.println("total count");
		return memberDAO.getTotalCount(cri);		
	}

	
	@Override
	public List<MemberVO> getFilterUserList1(Criteria cri) {
		return memberDAO.getFilterUserList1(cri);
	}
	
	@Override
	public List<MemberVO> getFilterUserList2(Criteria cri) {
		return memberDAO.getFilterUserList2(cri);
	}

	@Override
	public MemberVO getMemberByMid(MemberVO vo) {
		return memberDAO.getMemberByMid(vo);
	}

	@Override
	public List<MemberVO> getMemberList() {
		return memberDAO.getMemberList();
	}

	@Override
	public void registMember(MemberVO mvo) {
		memberDAO.registMember(mvo);
	}

	@Override
	public void updateMyInfo(MemberVO mvo) {
		memberDAO.updateMyInfo(mvo);
	}

	@Override
	public void memberOut(MemberVO mvo) {
		memberDAO.memberOut(mvo);
	}

}
