package com.project.petmily.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.comment.CommentVO;

@Repository
public class CommentDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public CommentDAOMybatis() {
		System.out.println(">> CommentDAOMybatis() 객체 생성");
	}
	
	//댓글입력
	public void insertComment(CommentVO vo) {
		System.out.println("===> MyBatis로 insertComment() 실행");
		System.out.println("insertComment vo : " + vo);
		mybatis.insert("commentDAO.insertComment", vo);
	}

	//댓글삭제
	public void deleteComment(CommentVO vo) {
		System.out.println("===> MyBatis로 deleteComment() 실행");
		mybatis.delete("commentDAO.deleteComment", vo);
	}

	//댓글 목록 조회
	public List<CommentVO> getCommentList(CommentVO vo) {
		System.out.println("===> MyBatis로 getCommentList(vo) 실행");
		System.out.println("CommentVO vo : " + vo);
		return mybatis.selectList("commentDAO.getCommentList", vo);
	}
	
	//대댓글 입력
	public void insertRecomment(CommentVO vo) {
		mybatis.insert("commentDAO.insertRecomment", vo);
	}
	//대댓글 목록 조회
	public List<CommentVO> getRecommentList(CommentVO vo) {
		return mybatis.selectList("commentDAO.getRecommentList", vo);
	}
}
