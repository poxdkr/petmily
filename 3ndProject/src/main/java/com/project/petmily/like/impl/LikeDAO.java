package com.project.petmily.like.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.like.LikeVO;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSessionTemplate sst;

	public List<LikeVO> getBoardLike(LikeVO lvo) {
		return sst.selectList("like.getBoardLike", lvo);
	}
	
	public void insertLike(LikeVO lvo) {
		sst.insert("like.insertLike",lvo);
		
	}

	public void deleteLike(LikeVO lvo) {
		sst.delete("like.deleteLike",lvo);
	}

}
