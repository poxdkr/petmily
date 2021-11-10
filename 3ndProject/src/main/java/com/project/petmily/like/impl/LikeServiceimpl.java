package com.project.petmily.like.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.petmily.like.LikeService;
import com.project.petmily.like.LikeVO;


@Repository("likeService")
public class LikeServiceimpl implements LikeService{
	
	@Autowired
	private LikeDAO likeDAO;

	@Override
	public List<LikeVO> getBoardLike(LikeVO lvo) {
		
		return likeDAO.getBoardLike(lvo);
	}

	@Override
	public void insertLike(LikeVO lvo) {
		likeDAO.insertLike(lvo);
		
	}

	@Override
	public void deleteLike(LikeVO lvo) {
		likeDAO.deleteLike(lvo);		
	}
}
