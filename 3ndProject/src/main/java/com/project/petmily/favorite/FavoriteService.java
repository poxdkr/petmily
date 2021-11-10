package com.project.petmily.favorite;

import java.util.List;

public interface FavoriteService {

	List<FavoriteVO> getMyFavoriteList(FavoriteVO fvo);
	
	FavoriteVO getFavoriteCheck(FavoriteVO fvo);
	
	void insertFavorite(FavoriteVO fvo);

	void deleteFavorite(FavoriteVO fvo);
	
	
}
