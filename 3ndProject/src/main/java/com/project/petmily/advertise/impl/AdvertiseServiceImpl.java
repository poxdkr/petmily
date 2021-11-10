package com.project.petmily.advertise.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.advertise.AdvertiseService;
import com.project.petmily.advertise.AdvertiseVO;

@Repository("advertiseService")
public class AdvertiseServiceImpl implements AdvertiseService{
	
	@Autowired
	private AdvertiseDAO advertiseDAO;
	
	@Override
	public List<AdvertiseVO> getAdvertiseList() {
		return advertiseDAO.getAdvertiseList();
	}

	@Override
	public AdvertiseVO getAdvertise(AdvertiseVO adVO) {
		return advertiseDAO.getAdvertise(adVO);
	}

	@Override
	public void plusCntAd(AdvertiseVO adVO) {
		advertiseDAO.plusCntAd(adVO);
	}

}
