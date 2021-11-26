package com.project.petmily.board;

import java.util.ArrayList;

public interface MyBoardListService {
	MyBoardListVO myBoardListCnt(MyBoardListVO vo);
	ArrayList<MyBoardListVO> myBoardListPaging(MyBoardListVO vo);
}
