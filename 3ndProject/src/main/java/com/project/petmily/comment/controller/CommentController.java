package com.project.petmily.comment.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.comment.CommentService;
import com.project.petmily.comment.CommentVO;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	public CommentController() {
		System.out.println("--->> CommentController() 객체 생성!");
	}
	
	
	@RequestMapping("/getCommentList.do")
	public List<CommentVO> getCommentList(CommentVO vo) {
		System.out.println(">>해당 게시글의 전체 댓글 보여주기");
		System.out.println("CommentVO vo : " + vo);
		
		List<CommentVO> list = commentService.getCommentList(vo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/insertComment.do")
	public List<CommentVO> insertComment(CommentVO vo) {
		System.out.println(">>댓글 입력");
		commentService.insertComment(vo);
		
		List<CommentVO> list = commentService.getCommentList(vo);
		System.out.println("commentList : " + list);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/deleteComment.do")
	public List<CommentVO> deleteComment(CommentVO vo) {
		System.out.println(">>댓글 입력");
		commentService.deleteComment(vo);
		
		List<CommentVO> list = commentService.getCommentList(vo);
		System.out.println("commentList : " + list);
		
		return list;
	}
}
