package com.project.petmily.advertise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.project.petmily.advertise.AdvertiseService;
import com.project.petmily.advertise.AdvertiseVO;

@Controller
public class AdvertiseController {

	@Autowired
	private AdvertiseService advertiseService;
	
	@RequestMapping("/getAdvertiseList.do")
	@ResponseBody
	public List<AdvertiseVO> getAdvertiseList(){
		return advertiseService.getAdvertiseList();
	}
	
	@RequestMapping("/getAdvertise.do")
	@ResponseBody
	public AdvertiseVO getAdvertise(AdvertiseVO adVO) {
		return advertiseService.getAdvertise(adVO);
	}
	
	
	@RequestMapping("/plusCntAd.do")
	@ResponseBody
	public void plusCntAd(AdvertiseVO adVO) {
		advertiseService.plusCntAd(adVO);
	}
}
