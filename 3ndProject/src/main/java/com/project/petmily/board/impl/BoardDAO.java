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
		sst.insert("board.insertBoard",bvo);
	}

	public void updateBoard(BoardVO bvo) {
		sst.update("board.updateBoard",bvo);
	}

	public void deleteBoard(BoardVO bvo) {
		sst.delete("board.deleteBoard",bvo);
	}
	
	public void updateBoardAlarm(BoardVO bvo) {
		sst.update("board.updateBoardAlarm",bvo);
		
	}

	public void resetBoardAlarm(BoardVO bvo) {
		sst.update("board.resetBoardAlarm",bvo);
	}
	
	public int getBoardCount(BoardVO bvo) {
		return sst.selectOne("board.getBoardCount", bvo);
	}
	
	public List<BoardVO> getBoardListA(BoardVO bvo) {
		return sst.selectList("board.getBoardListA", bvo);
	}
}
