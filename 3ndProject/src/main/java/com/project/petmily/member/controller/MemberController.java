package com.project.petmily.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petmily.member.MemberService;
import com.project.petmily.member.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/memberTest.do")
	public String getMember(MemberVO mvo, HttpSession session) {
		System.out.println("MemberController 작동");
		mvo.setMidx(1);
		mvo = memberService.getMember(mvo);
		System.out.println("user : " + mvo);
		session.setAttribute("user", mvo);
		return "test.jsp";
	}
	
}
