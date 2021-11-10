package com.project.petmily.favorite.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.favorite.FavoriteService;
import com.project.petmily.favorite.FavoriteVO;

@Controller
public class FavoriteAjaxController {

	@Autowired
	FavoriteService favoriteService;
	
	@RequestMapping("getFavoriteCheck.do")
	@ResponseBody
	public FavoriteVO getFavoriteCheck(@RequestBody FavoriteVO fvo) {
		return favoriteService.getFavoriteCheck(fvo);
	}
	
	@RequestMapping("getMyFavoriteList.do")
	@ResponseBody
	public List<FavoriteVO> getMyFavoriteList(@RequestBody FavoriteVO fvo) {
		return favoriteService.getMyFavoriteList(fvo);
	}
	
	@RequestMapping(value = "/insertFavorite.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public void insertFavorite(@RequestBody FavoriteVO fvo) {
		favoriteService.insertFavorite(fvo);
	}
	
	@RequestMapping(value = "/deleteFavorite.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public void deleteFavorite(@RequestBody FavoriteVO fvo) {
		System.out.println("deleteFavorite() _ fvo : " + fvo);
		favoriteService.deleteFavorite(fvo);
	}
	
	
}
