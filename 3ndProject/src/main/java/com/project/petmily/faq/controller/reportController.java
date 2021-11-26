package com.project.petmily.faq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.petmily.faq.ReportDetailVO;
import com.project.petmily.faq.ReportService;
import com.project.petmily.util.ReportPaging;

@Controller
public class reportController {
	
	@Autowired
	private ReportService reportService;
	
	@RequestMapping("/report.do")
	public String reportList(ReportDetailVO vo, Model model, HttpServletRequest request) {
		ReportPaging p = new ReportPaging();
		System.out.println(">>> 신고글 전체목록보기");
		System.out.println(":: reportList vo : " + vo);
		List<ReportDetailVO> reportList = reportService.reportList();
		
		
		// 총게시글수
		int total = reportList.size();
		int totalPage = 0;
		if(total % p.getNumPerPage() > 0) {
			totalPage = total/p.getNumPerPage() + 1;
		} else if(total % p.getNumPerPage() == 0) {
			totalPage = total/p.getNumPerPage();
		}
		p.setTotalPage(totalPage);
		
		//현재페이지 
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setBegin(10 * (p.getNowPage()-1));
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
				
		
		
		System.out.println("reportList : " + reportList);
		model.addAttribute("reportList", reportList);
		p.setTotalPage(totalPage);
		model.addAttribute("pvo", p);
		return "report.jsp";
		
	}
	
	@RequestMapping("/reportSecondBoard.do")
	public String reportDetail1(ReportDetailVO vo, Model model) {
		
		System.out.println(">>> 신고글상세보기");
		System.out.println(":: reportDetail1 vo : " + vo);
		ReportDetailVO reportBoard = reportService.reportBoard(vo);
		ReportDetailVO reportCount = reportService.reportCount(vo);
		List<ReportDetailVO> getReportList = reportService.getReportContent(vo);
		System.out.println("reportBoard : " + reportBoard);
		model.addAttribute("reportBoard", reportBoard);
		model.addAttribute("reportCount", reportCount);
		model.addAttribute("getReportList", getReportList);
		
		return "reportSecond.jsp";
	}
	@RequestMapping("/reportSecondReply.do")
	public String reportDetail2(ReportDetailVO vo, Model model) {
		
		System.out.println(">>> 신고글상세보기");
		System.out.println(":: reportDetail2 vo : " + vo);
		ReportDetailVO reportBoardReply = reportService.reportBoardReply(vo);
		ReportDetailVO reportCount = reportService.reportCount(vo);
		List<ReportDetailVO> getReportList = reportService.getReportContent(vo);
		System.out.println("reportBoardReply : " + reportBoardReply);
		System.out.println("reportCount : " + reportCount);
		model.addAttribute("reportBoardReply", reportBoardReply);
		model.addAttribute("reportCount", reportCount);
		model.addAttribute("getReportList", getReportList);
		
		return "reportSecond.jsp";
	}
	
	@RequestMapping("/boardReportDelete.do")
	public String boardReportDelete(ReportDetailVO vo) {
		System.out.println(">>신고당한 게시글 삭제하기");
		reportService.boardReportDelete(vo);
		reportService.ReportDelete(vo);
		System.out.println(":: boardReportDelete : " + vo);
		return "report.do";
	}
	@RequestMapping("/replyReportDelete.do")
	public String replyReportDelete(ReportDetailVO vo) {
		System.out.println(">>신고당한 게시글 삭제하기");
		reportService.replyReportDelete(vo);
		reportService.ReportDelete(vo);
		
		return "report.do";
	}
	@RequestMapping("/onlyReportDelete.do")
	public String onlyReportDelete(ReportDetailVO vo) {
		reportService.ReportDelete(vo);
		
		return "report.do";
	}
	
	

}
