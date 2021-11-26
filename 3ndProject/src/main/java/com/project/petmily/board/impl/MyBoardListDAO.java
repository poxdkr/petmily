package com.project.petmily.board.impl;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.board.MyBoardListVO;

@Repository
public class MyBoardListDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public MyBoardListVO myBoardListCnt(MyBoardListVO vo) {
		 return (MyBoardListVO) sqlSession.selectOne("myBoardListDAO.listCnt", vo);
	}

	public ArrayList<MyBoardListVO> myBoardListPaging(MyBoardListVO vo) {
		return (ArrayList) sqlSession.selectList("myBoardListDAO.listPaging", vo);
	}


}