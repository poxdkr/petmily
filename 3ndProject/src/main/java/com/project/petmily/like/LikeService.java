package com.project.petmily.like;

import java.util.List;

public interface LikeService {
	
	List<LikeVO> getBoardLike(LikeVO lvo);
	
	void insertLike(LikeVO lvo);

	void deleteLike(LikeVO lvo);
	
	
}
