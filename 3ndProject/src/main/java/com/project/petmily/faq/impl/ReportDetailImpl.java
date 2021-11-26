package com.project.petmily.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.faq.ReportDetailVO;
import com.project.petmily.faq.ReportService;


@Service
public class ReportDetailImpl implements ReportService {
	
	@Autowired
	private ReportDetailDAO reportDetailDAO;

	@Override
	public List<ReportDetailVO> reportList() {
		
		return reportDetailDAO.reportList();
	}

	@Override
	public ReportDetailVO reportBoard(ReportDetailVO vo) {
		
		return reportDetailDAO.reportBoard(vo);
	}

	@Override
	public ReportDetailVO reportBoardReply(ReportDetailVO vo) {
		
		return reportDetailDAO.reportBoardReply(vo);
	}

	@Override
	public ReportDetailVO reportCount(ReportDetailVO vo) {
		
		return reportDetailDAO.reportCount(vo);
	}

	@Override
	public int getTotalCount() {
		
		return reportDetailDAO.getTotalCount();
	}

	@Override
	public List<ReportDetailVO> getReportContent(ReportDetailVO vo) {
		
		return reportDetailDAO.getReportContent(vo);
	}

	@Override
	public void boardReportDelete(ReportDetailVO vo) {
		reportDetailDAO.boardReportDelete(vo);
		
	}

	@Override
	public void replyReportDelete(ReportDetailVO vo) {
		reportDetailDAO.replyReportDelete(vo);
		
	}

	@Override
	public void ReportDelete(ReportDetailVO vo) {
		reportDetailDAO.deleteReport(vo);
		
	}
	


}
