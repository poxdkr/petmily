package com.project.petmily.pet;

import java.util.List;

public interface PetService {
	
	//펫 리스트 불러오기
	List<PetVO> getPetList(PetVO pvo);
	
	//펫등록하기
	void insertPet(PetVO pvo);
	
	//펫 삭제하기
	void deletePet(PetVO pvo);
	
}
