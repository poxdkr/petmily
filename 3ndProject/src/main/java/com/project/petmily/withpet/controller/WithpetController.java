package com.project.petmily.withpet.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petmily.common.KnowhowPaging;
import com.project.petmily.knowhow.KnowhowVO;
import com.project.petmily.withpet.WithpetService;
import com.project.petmily.withpet.WithpetVO;

@Controller
public class WithpetController {
	@Autowired
	private WithpetService withpetService;
	
	//위드펫 조회
	@RequestMapping("/getWithpetList.do")
	public String getWithpetList(WithpetVO vo, Model model, HttpServletRequest request) {
		//페이징 처리
		KnowhowPaging p = new KnowhowPaging();
		//1. 총 게시글 수 구하기
		int total = withpetService.getWithpetCount(vo);
		p.setTotalRecord(total);
		System.out.println("총 게시글 수 : " + total);
		//2. 총 페이지 수 구하기
		int tPage = 0;
		if (total % p.getNumPerPage() > 0) {
			tPage = total/p.getNumPerPage() + 1;
		} else if (total % p.getNumPerPage() == 0) {
			tPage = total/p.getNumPerPage();
		}
		p.setTotalPage(tPage);
		
		System.out.println("총 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		System.out.println("현재 페이지 : " + p.getNowPage());
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setBegin(12 * (p.getNowPage()-1));
		//p.setEnd(p.getNowPage() * p.getNumPerPage());
		
		//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() + 1;
		System.out.println("beginPage : " + beginPage);
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() * p.getPagePerBlock());
		
		//4-1 endPage가 전체페이지 수(totalPage) 보다 크면
		//끝 페이지 수를 전체페이지 수로 변경
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		System.out.println("getWithpetList vo : " + vo);
		List<WithpetVO> list = null;
		if (vo.getPlacetype() == 0) {
			list = withpetService.getWithpetList(vo);
		} else if (vo.getPlacetype() != 0) {
			list = withpetService.getWithpetListType(vo);
		}
		
		model.addAttribute("withpetList", list);
		model.addAttribute("pvo", p);
		model.addAttribute("type", vo.getPlacetype());
		
		return "getWithpetList.jsp";
	}
	
	//위드펫 입력
	@RequestMapping("/insertWithpet.do")
	public String insertWithpet(WithpetVO vo) {
		System.out.println("들어온 withpetVO vo : " + vo);
		vo.setTotalAddress(vo.getPostcode(), vo.getAddress(), vo.getDetailAddress(), vo.getExtraAddress());
		System.out.println("나가는 withpetVO vo : " + vo);
		
		withpetService.insertWithpet(vo);
		
		return "getWithpetList.do?placetype=0";
	}
	
	//위드펫 수정
	@RequestMapping("/updateWithpet.do")
	public String updateWithpet(WithpetVO vo, Model model) {
		WithpetVO withpet = withpetService.getWithpet(vo);
		model.addAttribute("withpet", withpet);
		
		return "updateWithpet.jsp";
	}
	
	//수정한 위드펫 데이터베이스에 저장
	@RequestMapping("/updateWithpetOk.do")
	public String updateWithpetOk(WithpetVO vo) {
		System.out.println("updateOk withpetVO vo : " + vo);
		vo.setTotalAddress(vo.getPostcode(), vo.getAddress(), vo.getDetailAddress(), vo.getExtraAddress());
		withpetService.updateWithpet(vo);
		
		return "getWithpet.do?widx="+vo.getWidx();
	}
	
	//위드펫 삭제
	@RequestMapping("/deleteWithpet.do")
	public String deleteWithpet(WithpetVO vo) {
		System.out.println("deleteWithpetVO vo : " + vo);
		withpetService.deleteWithpet(vo);
		
		return "getWithpetList.do";
	}
	
	//위드펫 상세 보기
	@RequestMapping("/getWithpet.do")
	public String getWithpet(WithpetVO vo, Model model) {
		WithpetVO withpet = withpetService.getWithpet(vo);
		model.addAttribute("withpet", withpet);
		
		return "getWithpet.jsp";
	}
}
