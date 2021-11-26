package com.project.petmily.comment;

import java.util.List;

public interface CommentService {

	List<CommentVO> getCommentList(CommentVO cvo);
	List<CommentVO> getRecommentList(CommentVO cvo);
	void insertComment(CommentVO cvo);
	void insertRecomment(CommentVO cvo);
	void deleteComment(CommentVO cvo);
	
}
