package com.project.petmily.advertise.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.advertise.AdvertiseVO;
import com.project.petmily.util.Criteria;

@Repository
public class AdvertiseDAO {
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public AdvertiseDAO() {
		System.out.println("AdvertiseDAO() 객체 생성");
	}
	
	// 광고 상품 목록 출력
	public List<AdvertiseVO> getAdvertiseList(Criteria cri) {
		return sst.selectList("advertise.getAdvertiseList", cri);
	}
	

	public AdvertiseVO getAdvertise(AdvertiseVO vo) {
		return sst.selectOne("advertise.getAdvertise", vo);
	}

	public void insertAdvertise(AdvertiseVO vo) {
		sst.insert("advertise.insertAdvertise", vo);
		
	}
	
	public void updateAdvertise(AdvertiseVO vo) {
		sst.update("advertise.updateAdvertise", vo);
	}
	
	public void deleteAdvertise(AdvertiseVO vo) {
		sst.delete("advertise.deleteAdvertise", vo);
	}

	public int getTotalCount(Criteria cri) {
		return sst.selectOne("advertise.getTotalCount", cri);
	}
	
	/* ==========황균이형 부분========== */
	public List<AdvertiseVO> getAdvertiseList() {
		return sst.selectList("advertise.getAdvertiseListAll");
	}
	
	public void plusCntAd(AdvertiseVO adVO) {
		sst.update("advertise.plusCntAd",adVO);
	}
}
