package com.project.petmily.like.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.like.LikeService;
import com.project.petmily.like.LikeVO;

@Controller
public class LikeAjaxController {

	@Autowired
	LikeService likeService;
	
	@RequestMapping("getBoardLike.do")
	@ResponseBody
	public List<LikeVO> getBoardLike(LikeVO lvo) {
		return likeService.getBoardLike(lvo);
	}
	
	@RequestMapping("insertLike.do")
	@ResponseBody
	public void insertLike(@RequestBody LikeVO lvo) {
		System.out.println("insertLikeVO vo : " + lvo);
		likeService.insertLike(lvo);
	}
	
	@RequestMapping("deleteLike.do")
	@ResponseBody
	public void deleteLike(@RequestBody LikeVO lvo) {
		likeService.deleteLike(lvo);
	}
}
