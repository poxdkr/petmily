package com.project.petmily.advertise.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.advertise.AdvertiseVO;

@Repository
public class AdvertiseDAO {

	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<AdvertiseVO> getAdvertiseList() {
		return sst.selectList("advertise.getAdvertiseList");
	}

	public AdvertiseVO getAdvertise(AdvertiseVO adVO) {
		return sst.selectOne("advertise.getAdvertise",adVO);
	}

	public void plusCntAd(AdvertiseVO adVO) {
		sst.update("advertise.plusCntAd",adVO);
	}
	
}
