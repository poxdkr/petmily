package com.project.petmily.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.board.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public List<BoardVO> getBoardList() {
		return sst.selectList("board.getBoardList");
	}
	
	public List<BoardVO> getBoardListByKeyword(BoardVO bvo) {
		return sst.selectList("board.getBoardListByKeyword",bvo);
	}

	public BoardVO getBoard(BoardVO bvo) {
		return sst.selectOne("board.getBoard",bvo);
		
	}

	public void insertBoard(BoardVO bvo) {
		// TODO Auto-generated method stub
		
	}

	public void updateBoard(BoardVO bvo) {
		// TODO Auto-generated method stub
		
	}

	public void deleteBoard(BoardVO bvo) {
		// TODO Auto-generated method stub
		
	}
	
}
