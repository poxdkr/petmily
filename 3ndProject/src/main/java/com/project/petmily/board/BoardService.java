package com.project.petmily.board;

import java.util.List;

public interface BoardService {

	//전체 리스트 불러오기
	List<BoardVO> getBoardList();
	
	//검색조건으로 보드 찾기 (사용자의 아이디 / 카테고리 / 제목) 
	List<BoardVO> getBoardListByKeyword(BoardVO bvo);
	
	//상세보기할 게시판을 가져오기
	BoardVO getBoard(BoardVO bvo);
	
	//게시글 입력
	void insertBoard(BoardVO bvo);
	
	//게시글 수정
	void updateBoard(BoardVO bvo);
	
	//게시글 삭제
	void deleteBoard(BoardVO bvo);
	
	//알람상승
	void updateBoardAlarm(BoardVO bvo);
	
	//알람 리셋
	void resetBoardAlarm(BoardVO bvo);
	
}
