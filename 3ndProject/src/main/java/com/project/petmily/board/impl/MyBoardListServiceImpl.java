package com.project.petmily.board.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.board.MyBoardListService;
import com.project.petmily.board.MyBoardListVO;

@Service("myBoardListService")
public class MyBoardListServiceImpl implements MyBoardListService {
	
	@Autowired
	private MyBoardListDAO myBoardListDAO;

	@Override
	public MyBoardListVO myBoardListCnt(MyBoardListVO vo) {
		return myBoardListDAO.myBoardListCnt(vo);
	}

	@Override
	public ArrayList<MyBoardListVO> myBoardListPaging(MyBoardListVO vo) {
		return myBoardListDAO.myBoardListPaging(vo);
	}

}
