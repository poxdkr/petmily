package com.project.petmily.favorite.impl;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.favorite.FavoriteListVO;

@Repository
public class FavoriteListDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<FavoriteListVO> favoriteList(FavoriteListVO vo) {
		return (ArrayList) sqlSession.selectList("favoriteListDAO.list", vo);
	}

	public FavoriteListVO favoriteListCnt(FavoriteListVO vo) {
		return (FavoriteListVO) sqlSession.selectOne("favoriteListDAO.listCnt", vo);
	}

	public ArrayList<FavoriteListVO> favoriteListPaging(FavoriteListVO vo) {
		return (ArrayList) sqlSession.selectList("favoriteListDAO.listPaging", vo);
	}


}