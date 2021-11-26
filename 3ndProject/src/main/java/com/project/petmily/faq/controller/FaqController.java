package com.project.petmily.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.faq.FaqVO;

import com.project.petmily.faq.Faq;

@Controller
public class FaqController {

	@Autowired
	private Faq Faq;

	public FaqController() {
		System.out.println("FaqController() 객체 생성");
	}

	@RequestMapping("/getFaqBoard.do")
	@ResponseBody // response 객체의 몸체(body)에 데이터 전달
	public FaqVO getFaqBoard(@RequestBody FaqVO vo, Model model) {
		System.out.println("getFaqBoard VO : " + vo);
		System.out.println("getFaqBoard() 실행");

		FaqVO faqBoard = Faq.getFaqBoard(vo);
		System.out.println(":: faqBoard : " + faqBoard);

//		model.addAttribute("faqBoard", faqBoard); 

		return faqBoard;
	}

//	@RequestMapping("/faqList.do")
//	public String getFaqBoardList(FaqVO vo, Model model) {
//		System.out.println(">>> 게시글 전체 목록 보여주기");
//		System.out.println(":: getFaqBoardList vo " + vo);
//		
//		List<FaqVO> faqList = Faq.getFaqBoardList();
//		
//		System.out.println("faqList(메인에서넘어옴) : " + faqList);
//		
//		model.addAttribute("faqList", faqList);
//
//		return "faqList.jsp";
//	}
	@RequestMapping("/faqSearchList.do")
	public String faqSearchList(FaqVO vo, Model model) {
		System.out.println(">>> faqSearchList");
		List<FaqVO> faqList = Faq.faqSearchList(vo);
		System.out.println(":: faqSearchList " + vo);

		System.out.println("faqList(뜨면안됨) : " + faqList);

		model.addAttribute("faqList", faqList);

		return "faqSearchList.jsp";
	}

	@RequestMapping("/getJsonFaqList.do")
	@ResponseBody // response 객체의 몸체(body)에 데이터 전달
	public List<FaqVO> faqSearchList(@RequestBody FaqVO vo) {
		List<FaqVO> faqList = Faq.faqSearchList(vo);
		System.out.println("faqSearchList(검색어입력후 ajax실행) : " + faqList);
		// System.out.println("faqSearchList(검색어입력후 ajax실행) : ");
		return faqList;
	}

	@RequestMapping("/buttonFaqList.do")
	@ResponseBody // response 객체의 몸체(body)에 데이터 전달
	public List<FaqVO> buttonFaqList(@RequestBody FaqVO vo) {
		List<FaqVO> faqList = Faq.buttonFaqList(vo);
		System.out.println("buttonFaqList(버튼입력 후 ajax실행) : " + faqList);
		return faqList;
	}

	@RequestMapping("/insertFaq.do")
	public String insertFaq(FaqVO vo) {
		System.out.println("insertFaq VO : " + vo);
		Faq.insertFaq(vo);

		return "faqList.jsp";
	}

	@RequestMapping("/updateFaq.do")
	public String updateFaq(FaqVO vo) {
		System.out.println("updateFaq VO : " + vo);
		Faq.updateFaq(vo);

		return "faqList.jsp";
	}

	@RequestMapping("/deleteFaq.do")
	public String deleteFaq(FaqVO vo) {
		System.out.println("deleteFaq VO : " + vo);
		Faq.deleteFaq(vo);

		return "faqList.jsp";
	}

//	
	@RequestMapping("/thisBoardInfo.do")
	public String thisBoardInfo(FaqVO vo, Model model) {
		System.out.println("updateFaq VO : " + vo);
		FaqVO faqBoard = Faq.getFaqBoard(vo);

		model.addAttribute("faqBoard", faqBoard);

		return "updateFaq.jsp";
	}

}
