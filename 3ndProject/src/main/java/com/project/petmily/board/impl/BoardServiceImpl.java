package com.project.petmily.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.board.BoardService;
import com.project.petmily.board.BoardVO;

@Repository("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public List<BoardVO> getBoardList() {
		return boardDAO.getBoardList();
	}

	@Override
	public List<BoardVO> getBoardListByKeyword(BoardVO bvo) {
		return boardDAO.getBoardListByKeyword(bvo);
	}

	@Override
	public BoardVO getBoard(BoardVO bvo) {
		return boardDAO.getBoard(bvo);
	}

	@Override
	public void insertBoard(BoardVO bvo) {
		boardDAO.insertBoard(bvo);
	}

	@Override
	public void updateBoard(BoardVO bvo) {
		boardDAO.updateBoard(bvo);
	}

	@Override
	public void deleteBoard(BoardVO bvo) {
		boardDAO.deleteBoard(bvo);
	}

	@Override
	public void updateBoardAlarm(BoardVO bvo) {
		boardDAO.updateBoardAlarm(bvo);
	}

	@Override
	public void resetBoardAlarm(BoardVO bvo) {
		boardDAO.resetBoardAlarm(bvo);
	}

	@Override
	public int getBoardCount(BoardVO bvo) {
		return boardDAO.getBoardCount(bvo);
	}

	@Override
	public List<BoardVO> getBoardListA(BoardVO bvo) {
		return boardDAO.getBoardListA(bvo);
	}


	
}
