package com.project.petmily.favorite;

import java.util.ArrayList;
import java.util.List;

public interface FavoriteListService {
	List<FavoriteListVO> favoriteList(FavoriteListVO vo);
	FavoriteListVO favoriteListCnt(FavoriteListVO vo);
	ArrayList<FavoriteListVO> favoriteListPaging(FavoriteListVO vo);
}
