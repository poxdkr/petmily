package com.project.petmily.withpet.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.withpet.WithpetVO;

@Repository
public class WithpetDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public WithpetDAOMybatis() {
		System.out.println(">> WithpetDAOMybatis() 실행");
	}
	
	//위드펫 게시글 입력
	public void insertWithpet(WithpetVO vo) {
		System.out.println("===> MyBatis로 insertWithpet() 실행");
		mybatis.insert("withpetDAO.insertWithpet", vo);
	}

	//위드펫 글수정
	public void updateWithpet(WithpetVO vo) {
		System.out.println("===> MyBatis로 updateWithpet() 실행");
		mybatis.update("withpetDAO.updateWithpet", vo);
	}

	//위드펫 글삭제
	public void deleteWithpet(WithpetVO vo) {
		System.out.println("===> MyBatis로 deleteWithpet() 실행");
		mybatis.delete("withpetDAO.deleteWithpet", vo);
	}
	
	//위드펫 상세 보기
	public WithpetVO getWithpet(WithpetVO vo) {
		System.out.println("===> MyBatis로 getWithpet() 실행");
		return mybatis.selectOne("withpetDAO.getWithpet", vo);
	}

	//전체 위드펫 게시글 조회
	public List<WithpetVO> getWithpetList(WithpetVO vo) {
		System.out.println("===> MyBatis로 getWithpetList(vo) 실행");
		return mybatis.selectList("withpetDAO.getWithpetList", vo);
	}
	
	//위드펫 목록별 게시글 조회
	public List<WithpetVO> getWithpetListType(WithpetVO vo) {
		System.out.println("===> MyBatis로 getWithpetList(vo) 실행");
		
		return mybatis.selectList("withpetDAO.getWithpetListType", vo);
	}
	
	//위드펫 총 게시글 수
	public int getWithpetCount(WithpetVO vo) {
		System.out.println("===> Mybatis로 getWithpetCount(vo) 실행");
		return mybatis.selectOne("withpetDAO.getWithpetCount", vo);
	}
}
