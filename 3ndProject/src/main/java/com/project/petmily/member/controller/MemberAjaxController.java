package com.project.petmily.member.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.project.petmily.member.MemberService;
import com.project.petmily.member.MemberVO;

@Controller
public class MemberAjaxController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/getAjaxMember.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public MemberVO getJsonMember(MemberVO mvo){
		//System.out.println("mvo : " + mvo);
		MemberVO member = memberService.getMember(mvo); 
		//System.out.println("member : " + member);
		return member;
	}
	
	@RequestMapping(value = "/getMemberByMid.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public MemberVO getJsonMemberByMid(MemberVO mvo){
		//System.out.println("mvo : " + mvo);
		MemberVO member = memberService.getMemberByMid(mvo); 
		//System.out.println("member : " + member);
		return member;
	}
	
	@RequestMapping(value="getAjaxMemberLogin.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public MemberVO getAjaxMemberLogin (MemberVO mvo,HttpSession session) {
		//System.out.println("mvo : " + mvo);
		MemberVO member = memberService.getMemberByMid(mvo); 
		//해당 member가 null이 아닐 경우
		if(member != null) {
			session.setAttribute("user", member);
		}
		//해당 member가 null일 경우는 session에 저장시켜주지 않는다.
		return member;
	}
}
