package com.project.petmily.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petmily.member.MemberService;
import com.project.petmily.member.MemberVO;
import com.project.petmily.util.Criteria;
import com.project.petmily.util.Page;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 회원 정보 리스트
	@RequestMapping("/getMemberList.do")
	public String getMemberList(MemberVO vo, Model model, Criteria cri) {
		System.out.println("### 회원 관리 목록 출력");
		System.out.println("list : " + cri);
		
		List<MemberVO> memberList = memberService.getMemberList(cri);
		
		int total = memberService.getTotal(cri);
		
		System.out.println("list : " + memberList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", new Page(cri, total));
		
		return "getManageUserList.jsp";
	}
	
	//일반회원 리스트
	@RequestMapping("/filterUser1.do")
	public String getFilterUserList1(MemberVO vo, Model model, Criteria cri) {
		System.out.println("### 일반 회원 목록 출력");
		System.out.println("list : " + cri);
		
		List<MemberVO> memberList = memberService.getFilterUserList1(cri);
		
//		int total = memberService.getTotal(cri);
		
		
		int total = memberList.size();
		
		System.out.println("filterList : " + memberList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", new Page(cri, total));
		
		return "getManageUserList.jsp";
	}
	
	
	// 탈퇴 예정 회원 리스트
	@RequestMapping("/filterUser2.do")
	public String getFilterUserList2(MemberVO vo, Model model, Criteria cri) {
		System.out.println("### 탈퇴 예정 회원 목록 출력");
		System.out.println("list : " + cri);
		
		List<MemberVO> memberList = memberService.getFilterUserList2(cri);
		
//		int total = memberService.getTotal(cri);
		
		
		int total = memberList.size();
		
		System.out.println("filterList : " + memberList);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageMaker", new Page(cri, total));
		
		return "getManageUserList.jsp";
	}
	
	
	
	// 회원 정보 보기 및 수정 페이지
	@RequestMapping("/getMember.do")
	public String getMember(MemberVO vo, @ModelAttribute("cri") Criteria cri, Model model) {
		System.out.println("### 회원 상세");
		
		MemberVO member = memberService.getMember(vo);
		System.out.println("MemberVO : " + member);
		model.addAttribute("member", member);
		
		return "getManageUser.jsp";
	}
	
	
	
	@RequestMapping("/updateMember.do")
	public String updateMember(MemberVO vo) {
		System.out.println("### 회원 수정");
		System.out.println("수정페이지 : " + vo);
		
		memberService.updateMember(vo);
		return "getMember.do";
	}
	
	@RequestMapping("/deleteMember.do")
	public String deleteMember(MemberVO vo) {
		System.out.println("### 회원 삭제");
		
		memberService.deleteMember(vo);
		return "getMemberList.do";
	}
	
	@RequestMapping("/myPage.do")
	public String getMemberbyMidx(MemberVO mvo, HttpSession session) {
		//System.out.println("mypage mvo : " + mvo);
		
		mvo = memberService.getMember(mvo);
		System.out.println("mypage mvo : " + mvo);
		session.setAttribute("targetMember",mvo);
		
		return "myPage.jsp";
	}
	
	@RequestMapping("registMember.do")
	public String registMember(MemberVO mvo, HttpSession session) {
		System.out.println("regist Controller 작동");
		System.out.println("받은 mvo값 : " + mvo);
		//member 등록
		memberService.registMember(mvo);
		//등록된 멤버의 midx때문에 다시 불러옴
		mvo = memberService.getMemberByMid(mvo);
		//session에 등록
		session.setAttribute("user", mvo);
		
		return "index.jsp";
	}
	
	@RequestMapping("updateMyInfo.do")
	public String updateMyInfo(MemberVO mvo) {
		System.out.println("mvo 정보수정 : "+mvo);
		
		memberService.updateMyInfo(mvo);
		
		
		return "myPage.do?="+mvo.getMidx();
	}
	
	@RequestMapping("memberOut.do")
	public void memberOut(MemberVO mvo) {
		System.out.println("memberOut Con 연결확인");
		memberService.memberOut(mvo);
		return;
	}
}
