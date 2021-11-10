package com.project.petmily.reply;

import java.util.List;

public interface ReplyService {

	List<ReplyVO> getReply(ReplyVO repVO);
	List<ReplyVO> getRecomment(ReplyVO repVO);
	void inserReply(ReplyVO repVO);
	void insertRecomment(ReplyVO repVO);
	void updateReply(ReplyVO repVO);
	void deleteReply(ReplyVO repVO);
	
}
