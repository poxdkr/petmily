package com.project.petmily.withpet.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.withpet.WithpetService;
import com.project.petmily.withpet.WithpetVO;

@Service("withpetService")
public class WithpetServiceImpl implements WithpetService{
	@Autowired
	private WithpetDAOMybatis withpetDAO;
	
	public WithpetServiceImpl() {
		System.out.println("withpetService 실행");
	}
	@Override
	public void insertWithpet(WithpetVO vo) {
		withpetDAO.insertWithpet(vo);
		
	}

	@Override
	public void updateWithpet(WithpetVO vo) {
		withpetDAO.updateWithpet(vo);
	}

	@Override
	public void deleteWithpet(WithpetVO vo) {
		withpetDAO.deleteWithpet(vo);
	}

	@Override
	public WithpetVO getWithpet(WithpetVO vo) {
		return withpetDAO.getWithpet(vo);
	}
	
	@Override
	public List<WithpetVO> getWithpetList(WithpetVO vo) {
		return withpetDAO.getWithpetList(vo);
	}
	@Override
	public int getWithpetCount(WithpetVO vo) {
		return withpetDAO.getWithpetCount(vo);
	}
	@Override
	public List<WithpetVO> getWithpetListType(WithpetVO vo) {
		return withpetDAO.getWithpetListType(vo);
	}

}
