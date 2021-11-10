package com.project.petmily.advertise;

import java.util.List;

public interface AdvertiseService {

	//광고의 최대값을 알기 위한 모든 리스트 불러오기
	List<AdvertiseVO> getAdvertiseList();
	
	//하나의 광고를 출력하기 위한 광고불러오기
	AdvertiseVO getAdvertise(AdvertiseVO adVO);
	
	//광고를 클릭할 시 count를 더해줄 메소드
	void plusCntAd(AdvertiseVO adVO);
	
}
