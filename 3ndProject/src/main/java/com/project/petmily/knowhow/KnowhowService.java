package com.project.petmily.knowhow;

import java.util.List;

public interface KnowhowService {
	//CRUD 기능 구현 메소드 정의
	void insertKnowhow(KnowhowVO vo);
	void updateKnowhow(KnowhowVO vo);
	void deleteKnowhow(KnowhowVO vo);
	KnowhowVO getKnowhow(KnowhowVO vo);
	List<KnowhowVO> getKnowhowList(KnowhowVO vo);
	List<KnowhowVO> getKnowhowListType(KnowhowVO vo);
	int getKnowhowCount(KnowhowVO vo);
	List<KnowhowVO> getKnowhowListTop();
	List<KnowhowVO> getBoardListTop();
}
