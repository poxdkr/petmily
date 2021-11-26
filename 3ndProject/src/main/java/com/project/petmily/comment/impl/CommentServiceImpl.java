package com.project.petmily.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.comment.CommentService;
import com.project.petmily.comment.CommentVO;


// @Service : @Component 상속확장 어노테이션
//		비즈니스 로직 처리 서비스 영역에 사용
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	
	private CommentDAOMybatis commentDAO;

	public CommentServiceImpl() {
		System.out.println(">> CommentServiceImpl() 객체생성");
	}
	
	//댓글 입력
	@Override
	public void insertComment(CommentVO vo) {
		commentDAO.insertComment(vo);
	}
	
	//댓글 삭제
	@Override
	public void deleteComment(CommentVO vo) {
		commentDAO.deleteComment(vo);
	}
	
	//댓글 리스트
	@Override
	public List<CommentVO> getCommentList(CommentVO vo) {
		List<CommentVO> list = commentDAO.getCommentList(vo);
		return list;
	}
	
	//대댓글 리스트
	@Override
	public List<CommentVO> getRecommentList(CommentVO cvo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//대댓글 입력
	@Override
	public void insertRecomment(CommentVO cvo) {
		// TODO Auto-generated method stub
		
	}
	
	
}
