package com.project.petmily.pet.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.pet.PetService;
import com.project.petmily.pet.PetVO;

@Repository("petService")
public class PetServiceImpl implements PetService{
	
	@Autowired
	PetDAO petDAO;
	
	@Override
	public List<PetVO> getPetList(PetVO pvo) {
		return petDAO.getPetList(pvo);
	}

	@Override
	public void insertPet(PetVO pvo) {
		petDAO.insertPet(pvo);
	}

	@Override
	public void deletePet(PetVO pvo) {
		petDAO.deletePet(pvo);
	}

}
