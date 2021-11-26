package com.project.petmily.member.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.member.MemberVO;
import com.project.petmily.util.Criteria;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public MemberDAO() {
		System.out.println("MemberDAO() 객체 생성");
	}
	
	public void deleteMember(MemberVO vo) {
		sst.delete("member.deleteMember", vo);
	}
	
	public List<MemberVO> getMemberList(Criteria cri){
		return sst.selectList("member.getMemberList", cri);
	}
	
	public MemberVO getMember(MemberVO vo) {
		System.out.println("DAO vo : " + vo);
		return sst.selectOne("member.getMember", vo);
	}

	public void updateMember(MemberVO vo) {
		sst.update("member.updateMember", vo);
	}

	public int getTotalCount(Criteria cri) {
		return sst.selectOne("member.getTotalCount", cri);
	}

	public List<MemberVO> getFilterUserList1(Criteria cri) {
		return sst.selectList("member.getFilterUserList1", cri);
	}
	
	public List<MemberVO> getFilterUserList2(Criteria cri) {
		return sst.selectList("member.getFilterUserList2", cri);
	}
	
	/* ----------황균이형 부분------------- */
	public List<MemberVO> getMemberList() {
		return sst.selectList("member.getMemberListAll");
	}
	
	public void registMember(MemberVO mvo) {
		sst.insert("member.registMember",mvo);
		
	}

	public MemberVO getMemberByMid(MemberVO mvo) {
		return sst.selectOne("member.getMemberByMid",mvo);
	}

	public void updateMyInfo(MemberVO mvo) {
		sst.update("member.updateMyInfo",mvo);
	}

	public void memberOut(MemberVO mvo) {
		sst.update("member.memberOut",mvo);
	}
}
