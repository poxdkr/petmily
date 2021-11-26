package com.project.petmily.view.favorite;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petmily.favorite.FavoriteListService;
import com.project.petmily.favorite.FavoriteListVO;
import com.project.petmily.member.MemberVO;

@Controller
public class FavoriteListController {

	@Autowired
	FavoriteListService favoriteListService;
	
	@RequestMapping("/favoriteListPaging.do")
	public String favoriteListPaging(Model model, FavoriteListVO vo, HttpSession session, HttpServletRequest request) {
		MemberVO mVO = (MemberVO) session.getAttribute("user");
		vo.setMidx(mVO.getMidx());

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

	    ArrayList<FavoriteListVO> list = null;
	    int totalRow = 0;

	    list = favoriteListService.favoriteListPaging(vo);
	    
	    FavoriteListVO cntVO = favoriteListService.favoriteListCnt(vo);
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

	    // 전체 페이지의 갯수 
	    int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

	    // view단에서 필요한 정보 등록
	    model.addAttribute("favoriteList", list);
	    model.addAttribute("favoriteListCnt", cntVO);
	    model.addAttribute("totalPageCount", totalPageCount);
	    model.addAttribute("favoriteListCategory", vo.getBoardcate());
	    return "/views/favoriteList/favoriteList.jsp";
	}


	@RequestMapping(value = "/favoriteListPagingR.do")
	public String picture_ajax_page(Model model, FavoriteListVO vo, HttpServletRequest request, HttpSession session) {
		MemberVO mVO = (MemberVO) session.getAttribute("user");
		vo.setMidx(mVO.getMidx());
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

	    ArrayList<FavoriteListVO> list = null;
	    int totalRow = 0;
	    list = favoriteListService.favoriteListPaging(vo);
	    
	    FavoriteListVO cntVO = favoriteListService.favoriteListCnt(vo);
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
	   
	    model.addAttribute("favoriteList", list);
	    model.addAttribute("totalPageCount", totalPageCount);

	    return "/views/favoriteList/favoriteListAjax.jsp";
	}
}
