package com.project.petmily.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.report.ReportService;
import com.project.petmily.report.ReportVO;

@Controller
public class ReportAjaxController {

	@Autowired
	ReportService reportService;
	
	@RequestMapping("getReportBoard.do")
	@ResponseBody
	public ReportVO getReportBoard(@RequestBody ReportVO rvo) {
		//System.out.println("Controller rvo : " + rvo);
		//System.out.println("reportService.getReportBoard(rvo); : " + reportService.getReportBoard(rvo));
		return reportService.getReportBoard(rvo); 
	}
	
	@RequestMapping("getReportReply.do")
	@ResponseBody
	public ReportVO getReportReply(@RequestBody ReportVO rvo) {
		return reportService.getReportReply(rvo);
	}
	
	
	@RequestMapping("/insertReport.do")
	@ResponseBody
	public void insertReport(@RequestBody ReportVO rvo) {
		System.out.println("rvo :" + rvo);
		reportService.insertReport(rvo);
		return;
	}
	
	
	
}
