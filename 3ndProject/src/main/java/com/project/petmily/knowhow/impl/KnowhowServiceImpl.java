package com.project.petmily.knowhow.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.knowhow.KnowhowService;
import com.project.petmily.knowhow.KnowhowVO;

// @Service : @Component 상속확장 어노테이션
//		비즈니스 로직 처리 서비스 영역에 사용
@Service("knowhowService")
public class KnowhowServiceImpl implements KnowhowService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입
	//private BoardDAO boardDAO;
	//private BoardDAOSpring boardDAO;
	private KnowhowDAOMybatis KnowhowDAO;

	public KnowhowServiceImpl() {
		System.out.println(">> KnowhowServiceImpl() 객체생성");
	}
	
	@Override
	public void insertKnowhow(KnowhowVO vo) {
		KnowhowDAO.insertKnowhow(vo);
	}

	@Override
	public void updateKnowhow(KnowhowVO vo) {
		KnowhowDAO.updateKnowhow(vo);
	}

	@Override
	public void deleteKnowhow(KnowhowVO vo) {
		KnowhowDAO.deleteKnowhow(vo);
	}

	@Override
	public KnowhowVO getKnowhow(KnowhowVO vo) {
		return KnowhowDAO.getKnowhow(vo);
	}

	@Override
	public List<KnowhowVO> getKnowhowList(KnowhowVO vo) {
		return KnowhowDAO.getKnowhowList(vo);
	}

	@Override
	public List<KnowhowVO> getKnowhowListType(KnowhowVO vo) {
		return KnowhowDAO.getKnowhowListType(vo);
	}

	@Override
	public int getKnowhowCount(KnowhowVO vo) {
		return KnowhowDAO.getKnowhowCount(vo);
	}

	@Override
	public List<KnowhowVO> getKnowhowListTop() {
		return KnowhowDAO.getKnowhowListTop();
	}

	@Override
	public List<KnowhowVO> getBoardListTop() {
		return KnowhowDAO.getBoardListTop();
	}

}
