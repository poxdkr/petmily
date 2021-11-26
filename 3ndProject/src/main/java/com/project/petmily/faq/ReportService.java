package com.project.petmily.faq;

import java.util.List;

public interface ReportService {

	List<ReportDetailVO> reportList();
	int getTotalCount();
	ReportDetailVO reportBoard(ReportDetailVO vo);
	ReportDetailVO reportBoardReply(ReportDetailVO vo);
	ReportDetailVO reportCount(ReportDetailVO vo);
	List<ReportDetailVO> getReportContent(ReportDetailVO vo);
	void boardReportDelete(ReportDetailVO vo);
	void replyReportDelete(ReportDetailVO vo);
	void ReportDelete(ReportDetailVO vo);
	
	
}
