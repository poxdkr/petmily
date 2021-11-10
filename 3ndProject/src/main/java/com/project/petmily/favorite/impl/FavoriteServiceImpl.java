package com.project.petmily.favorite.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.favorite.FavoriteService;
import com.project.petmily.favorite.FavoriteVO;

@Repository("favoriteService")
public class FavoriteServiceImpl implements FavoriteService{
	@Autowired
	FavoriteDAO favoriteDAO;
	
	@Override
	public List<FavoriteVO> getMyFavoriteList(FavoriteVO fvo) {
		return favoriteDAO.getMyFavoriteList(fvo);
	}

	@Override
	public FavoriteVO getFavoriteCheck(FavoriteVO fvo) {
		return favoriteDAO.getFavoriteCheck(fvo);
		
	}
	@Override
	public void insertFavorite(FavoriteVO fvo) {
		favoriteDAO.insertFavorite(fvo);
	}
	@Override
	public void deleteFavorite(FavoriteVO fvo) {
		favoriteDAO.deleteFavorite(fvo);
	}

}
