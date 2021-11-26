package com.project.petmily.knowhow.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.knowhow.KnowhowVO;

@Repository
public class KnowhowDAOMybatis {
	@Autowired
	private SqlSessionTemplate mybatis;

	public KnowhowDAOMybatis() {
		System.out.println(">> KnowhowDAOMybatis() 객체 생성");
	}
	
	//노하우 게시글 입력
	public void insertKnowhow(KnowhowVO vo) {
		System.out.println("===> MyBatis로 insertKnowhow() 실행");
		System.out.println("insertKnowhow vo : " + vo);
		mybatis.insert("KnowhowDAO.insertKnowhow", vo);
	}

	//글수정
	public void updateKnowhow(KnowhowVO vo) {
		System.out.println("===> MyBatis로 updateKnowhowVO() 실행");
		mybatis.update("KnowhowDAO.updateKnowhow", vo);
	}

	//글삭제
	public void deleteKnowhow(KnowhowVO vo) {
		System.out.println("===> MyBatis로 deleteKnowhow() 실행");
		mybatis.delete("KnowhowDAO.deleteKnowhow", vo);
	}
	
	//글 하나조회
	public KnowhowVO getKnowhow(KnowhowVO vo) {
		System.out.println("===> MyBatis로 getKnowhow() 실행");
		return mybatis.selectOne("KnowhowDAO.getKnowhow", vo);
	}

	//전체 노하우 게시글 조회
	public List<KnowhowVO> getKnowhowList(KnowhowVO vo) {
		System.out.println("===> MyBatis로 getKnowhowList(vo) 실행");
		return mybatis.selectList("KnowhowDAO.getKnowhowList", vo);
	}
	
	//강아지&고양이 구분해서 게시글 조회
	public List<KnowhowVO> getKnowhowListType(KnowhowVO vo) {
		System.out.println("===> MyBatis로 getKnowhowList(vo) 실행");
		return mybatis.selectList("KnowhowDAO.getKnowhowListType", vo);
	}
	
	//총 게시글 수 구하기
	public int getKnowhowCount(KnowhowVO vo) {
		System.out.println("===> MyBatis로 getKnowhowCount(vo) 실행");
		return mybatis.selectOne("KnowhowDAO.getKnowhowCount", vo);
	}
	
	//좋아요가 가장 많이 눌러진 노하우 게시글 3개
	public List<KnowhowVO> getKnowhowListTop() {
		System.out.println("===> MyBatis로 getKnowhowListTop() 실행");
		return mybatis.selectList("KnowhowDAO.getKnowhowListTop");
	}
	
	//좋아요가 가장 많이 눌러진 게시판 게시글 3개
	public List<KnowhowVO> getBoardListTop() {
		System.out.println("===> MyBatis로 getBoardListTop() 실행");
		return mybatis.selectList("KnowhowDAO.getBoardListTop");
	}
	
}
