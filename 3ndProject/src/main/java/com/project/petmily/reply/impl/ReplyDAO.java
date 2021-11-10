package com.project.petmily.reply.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.reply.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	
	public List<ReplyVO> getReply(ReplyVO repVO) {
		return sst.selectList("reply.getReply",repVO);
	}
	
	public List<ReplyVO> getRecomment(ReplyVO repVO) {
		return sst.selectList("reply.getRecomment",repVO);
	}

	public void insertReply(ReplyVO repVO) {
		sst.insert("reply.insertReply",repVO);
	}

	public void updateReply(ReplyVO repVO) {
		sst.update("reply.updateReply",repVO);
		
	}

	public void deleteReply(ReplyVO repVO) {
		sst.delete("reply.deleteReply",repVO);
		
	}

	public void insertRecomment(ReplyVO repVO) {
		sst.insert("reply.insertRecomment",repVO);
	}


	
	
}
