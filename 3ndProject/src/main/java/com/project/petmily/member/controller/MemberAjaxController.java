package com.project.petmily.member.controller;
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
	public MemberVO getJsonMember( MemberVO mvo){
		//System.out.println("mvo : " + mvo);
		MemberVO member = memberService.getMember(mvo); 
		//System.out.println("member : " + member);
		return member;
	}
}
