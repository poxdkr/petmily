package com.project.petmily.advertise.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.advertise.AdvertiseService;
import com.project.petmily.advertise.AdvertiseVO;
import com.project.petmily.util.Criteria;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {

	@Autowired
	private AdvertiseDAO advertiseDAO;
	
	public AdvertiseServiceImpl() {
		System.out.println("AdvertiseServiceImpl() 객체 생성");
	}
	
	@Override
	public void insertAdvertise(AdvertiseVO vo) {
		advertiseDAO.insertAdvertise(vo);
	}

	@Override
	public void updateAdvertise(AdvertiseVO vo) {
		advertiseDAO.updateAdvertise(vo);
	}

	@Override
	public void deleteAdvertise(AdvertiseVO vo) {
		advertiseDAO.deleteAdvertise(vo);
	}

	@Override
	public AdvertiseVO getAdvertise(AdvertiseVO vo) {
	
		return advertiseDAO.getAdvertise(vo);
	}

	@Override
	public List<AdvertiseVO> getAdvertiseList(Criteria cri) {
		return advertiseDAO.getAdvertiseList(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		System.out.println("total count");
		return advertiseDAO.getTotalCount(cri);
	}

	@Override
	public List<AdvertiseVO> getAdvertiseList() {
		return advertiseDAO.getAdvertiseList();
	}

	@Override
	public void plusCntAd(AdvertiseVO vo) {
		advertiseDAO.plusCntAd(vo);
	}

	


	
	
}
