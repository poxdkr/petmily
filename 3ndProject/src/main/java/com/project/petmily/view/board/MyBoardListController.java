package com.project.petmily.view.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petmily.board.MyBoardListService;
import com.project.petmily.board.MyBoardListVO;
import com.project.petmily.member.MemberVO;

@Controller
public class MyBoardListController {

	@Autowired
	MyBoardListService myBoardListService;
	
	@RequestMapping("/myBoardListPaging.do")
	public String myBoardListPaging(Model model, MyBoardListVO vo, HttpSession session, HttpServletRequest request) {
		// 선택한 멤버의 정보 받아오고 VO에 저장
		MemberVO target = (MemberVO) session.getAttribute("targetMember");
		vo.setMidx(target.getMidx());

		// 페이지에서 표시할 게시물 수
	    final int PAGE_ROW_COUNT = 12;

	    int pageNum = 1;
	    
	    String strPageNum = request.getParameter("pageNum");
	    if (strPageNum != null) {
	        pageNum = Integer.parseInt(strPageNum);
	    }

	    //페이징 처리
	    int startRowNum = (0 + (pageNum - 1) * PAGE_ROW_COUNT) + 1;
	    int endRowNum = pageNum * PAGE_ROW_COUNT;
	    int rowCount = PAGE_ROW_COUNT;

	    vo.setStartRowNum(startRowNum);
	    vo.setEndRowNum(endRowNum);
	    vo.setRowCount(rowCount);

	    ArrayList<MyBoardListVO> list = null;
	    int totalRow = 0;
	   
	    //페이징 데이터 가져오기
	    list = myBoardListService.myBoardListPaging(vo);

	    // 카테고리별 COUNT
	    MyBoardListVO cntVO = myBoardListService.myBoardListCnt(vo);
	    if(vo.getBoardcate() == 1) {
	    	totalRow = cntVO.getCatcnt();
	    }else if(vo.getBoardcate() == 2) {
	    	totalRow = cntVO.getDogcnt();
	    }else if(vo.getBoardcate() == 3) {
	    	totalRow = cntVO.getFreecnt();
	    }else if(vo.getBoardcate() == 4 || vo.getBoardcate() == 5) {
	    	totalRow = cntVO.getKnowcnt();
	    }else {
	    	totalRow = cntVO.getAllcnt();
	    }

	    // 전체 페이지의 수 계산하기
	    int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

	    model.addAttribute("myBoardList", list);
	    model.addAttribute("myBoardListCnt", cntVO);
	    model.addAttribute("myBoardListTotalPageCount", totalPageCount);
	    model.addAttribute("myBoardListCategory", vo.getBoardcate());
	    return "/views/myBoardList/myBoardList.jsp";
	}


	@RequestMapping(value = "/myBoardListPagingR.do")
	public String myBoardListPagingR(Model model, MyBoardListVO vo, HttpServletRequest request, HttpSession session) {
		MemberVO target = (MemberVO) session.getAttribute("targetMember");
		vo.setMidx(target.getMidx());
		// 페이지에서 표시할 게시물 수
	    final int PAGE_ROW_COUNT = 12;

	    int pageNum = 1;
	    String strPageNum = request.getParameter("pageNum");
	    if (strPageNum != null) {
	        pageNum = Integer.parseInt(strPageNum);
	    }

	    int startRowNum = (0 + (pageNum - 1) * PAGE_ROW_COUNT) + 1;
	    int endRowNum = pageNum * PAGE_ROW_COUNT;

	    int rowCount = PAGE_ROW_COUNT;

	    vo.setStartRowNum(startRowNum);
	    vo.setEndRowNum(endRowNum);
	    vo.setRowCount(rowCount);
	    
	    //사용할 변수 선언
	    ArrayList<MyBoardListVO> list = null;
	    int totalRow = 0;
	    list = myBoardListService.myBoardListPaging(vo);
	    
	    MyBoardListVO cntVO = myBoardListService.myBoardListCnt(vo);
	    if(vo.getBoardcate() == 1) {
	    	totalRow = cntVO.getCatcnt();
	    }else if(vo.getBoardcate() == 2) {
	    	totalRow = cntVO.getDogcnt();
	    }else if(vo.getBoardcate() == 3) {
	    	totalRow = cntVO.getFreecnt();
	    }else if(vo.getBoardcate() == 4 || vo.getBoardcate() == 5) {
	    	totalRow = cntVO.getKnowcnt();
	    }else {
	    	totalRow = cntVO.getAllcnt();
	    }

	    int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
	   
	    model.addAttribute("myBoardList", list);
	    model.addAttribute("myBoardListTotalPageCount", totalPageCount);

	    return "/views/myBoardList/myBoardListAjax.jsp";
	}
}
