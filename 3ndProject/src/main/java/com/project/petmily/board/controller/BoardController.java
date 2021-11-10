package com.project.petmily.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.board.BoardService;
import com.project.petmily.board.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO bvo, Model model) {
		List<BoardVO> boardList = boardService.getBoardList();
		model.addAttribute("boardList",boardList);
		return "getBoardList.jsp";
	}
	
	@RequestMapping("/getBoardListAjax.do")
	@ResponseBody
	public List<BoardVO> getBoardListAjax() {
		return boardService.getBoardList();
	}
	
	
		
	@RequestMapping("/getBoardListByKeyword.do")
	public String getBoardListByKeyword(BoardVO bvo, Model model) {
		//searchCondition별 boardCate 지정
		//System.out.println("bvo.getSearchCondition >>> " + bvo.getSearchCondition());
		if(bvo.getSearchCondition().equals("고양이")) {
			bvo.setBoardcate(1);
		}else if(bvo.getSearchCondition().equals("강아지")) {
			bvo.setBoardcate(2);
		}else if(bvo.getSearchCondition().equals("댕냥노하우")) {
			bvo.setBoardcate(3);
		}else if(bvo.getSearchCondition().equals("자유주제")) {
			bvo.setBoardcate(4);
		}
		
		//System.out.println("bvo.getSearchKeyword >>> " + bvo.getSearchKeyword());
		//System.out.println("bvo 전체  : " + bvo);
		List<BoardVO> boardList = boardService.getBoardListByKeyword(bvo);
		//System.out.println("boardListByKeyword : "  +boardList);
		model.addAttribute("boardListByKeyword",boardList);
		return "getBoardList.jsp";
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO bvo, Model model) {
		bvo = boardService.getBoard(bvo);
		model.addAttribute("board",bvo);
		return "boardDetatils.jsp";
	}
		
	@RequestMapping("insertBoard.do")
	public String insertBoard(BoardVO bvo) {
		return null;
	}
					
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO bvo) {
		return null;
	}
}
