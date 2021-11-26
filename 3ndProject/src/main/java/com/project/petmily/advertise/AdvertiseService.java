package com.project.petmily.advertise;

import java.util.List;

import com.project.petmily.util.Criteria;

public interface AdvertiseService {
	void insertAdvertise(AdvertiseVO vo);
	void updateAdvertise(AdvertiseVO vo);
	void deleteAdvertise(AdvertiseVO vo);
	AdvertiseVO getAdvertise(AdvertiseVO vo);
	List<AdvertiseVO> getAdvertiseList(Criteria cri);
	int getTotal(Criteria cri);
	//황균이형---------------------------
	//광고의 최대값을 알기 위한 모든 리스트 불러오기
	List<AdvertiseVO> getAdvertiseList();
	//광고를 클릭할 시 count를 더해줄 메소드
	void plusCntAd(AdvertiseVO adVO);
}
