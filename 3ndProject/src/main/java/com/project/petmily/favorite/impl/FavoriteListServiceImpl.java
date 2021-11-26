package com.project.petmily.favorite.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.favorite.FavoriteListService;
import com.project.petmily.favorite.FavoriteListVO;

@Service("favoriteListService")
public class FavoriteListServiceImpl implements FavoriteListService {
	
	@Autowired
	private FavoriteListDAO favoriteListDAO;
	
	@Override
	public ArrayList<FavoriteListVO> favoriteList(FavoriteListVO vo) {
		return favoriteListDAO.favoriteList(vo);
	}

	@Override
	public FavoriteListVO favoriteListCnt(FavoriteListVO vo) {
		return favoriteListDAO.favoriteListCnt(vo);
	}

	@Override
	public ArrayList<FavoriteListVO> favoriteListPaging(FavoriteListVO vo) {
		return favoriteListDAO.favoriteListPaging(vo);
	}

}
