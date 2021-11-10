package com.project.petmily.report;

import java.util.List;

public interface ReportService {

	//게시물을 이미 신고했는지 확인
	ReportVO getReportBoard(ReportVO rvo);
	
	//댓글을 이미 신고했는지 확인
	ReportVO getReportReply(ReportVO rvo);
	
	//해당 유저로 등록된 신고목록 (피신고자)
	List<ReportVO> getReportToList(ReportVO rvo);
	
	//해당 유저가 신고한 목록 (신고자)
	List<ReportVO> getReportFromList(ReportVO rvo);
	
	//신고하기 (프로필, 게시판, 댓글 3가지 유형이나 컨트롤러에서 값을 확인후 나누기로 함)
	void insertReport(ReportVO rvo);
	
	//신고는 취소가 불가능하도록 설계.
	
	
	
	
}
