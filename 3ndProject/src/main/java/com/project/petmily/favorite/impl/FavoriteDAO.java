package com.project.petmily.favorite.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.petmily.favorite.FavoriteVO;

@Repository
public class FavoriteDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<FavoriteVO> getMyFavoriteList(FavoriteVO fvo) {
		return sst.selectList("favorite.getMyFavoriteList",fvo);
	}

	public FavoriteVO getFavoriteCheck(FavoriteVO fvo) {
		return sst.selectOne("favorite.getFavoriteCheck",fvo);
	}

	public void insertFavorite(FavoriteVO fvo) {
		sst.insert("favorite.insertFavorite",fvo);
	}

	public void deleteFavorite(FavoriteVO fvo) {
		System.out.println("DAO까지 옴");
		sst.delete("favorite.deleteFavorite",fvo);
	}
}
