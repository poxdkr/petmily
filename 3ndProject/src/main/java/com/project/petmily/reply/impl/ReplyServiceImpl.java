package com.project.petmily.reply.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.reply.ReplyService;
import com.project.petmily.reply.ReplyVO;

@Repository("replyService")
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyDAO replyDAO;
	
	@Override
	public List<ReplyVO> getReply(ReplyVO repVO) {
		return replyDAO.getReply(repVO);
	}
	
	@Override
	public List<ReplyVO> getRecomment(ReplyVO repVO) {
		return replyDAO.getRecomment(repVO);
	}

	@Override
	public void inserReply(ReplyVO repVO) {
		replyDAO.insertReply(repVO);
	}

	@Override
	public void insertRecomment(ReplyVO repVO) {
		replyDAO.insertRecomment(repVO);
		
	}

	@Override
	public void updateReply(ReplyVO repVO) {
		replyDAO.updateReply(repVO);
	}

	@Override
	public void deleteReply(ReplyVO repVO) {
		replyDAO.deleteReply(repVO);
	}





}
