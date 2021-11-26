package com.project.petmily.pet.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.pet.PetVO;

@Repository
public class PetDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	public List<PetVO> getPetList(PetVO pvo) {
		return sst.selectList("pet.getPetList",pvo);
	}

	public void insertPet(PetVO pvo) {
		sst.insert("pet.insertPet",pvo);
	}

	public void deletePet(PetVO pvo) {
		sst.delete("pet.deletePet",pvo);
	}

}
