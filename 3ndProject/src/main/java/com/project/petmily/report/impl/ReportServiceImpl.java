package com.project.petmily.report.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.petmily.report.ReportService;
import com.project.petmily.report.ReportVO;

@Repository("reportService")
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDAO reportDAO;
	
	@Override //이미 신고했는지 확인
	public ReportVO getReportBoard(ReportVO rvo) {
		return reportDAO.getReportBoard(rvo);
	}
	
	@Override
	public ReportVO getReportReply(ReportVO rvo) {
		// TODO Auto-generated method stub
		return reportDAO.getReportReply(rvo);
	}
	
	@Override//해당 유저로 등록된 신고목록 (피신고자)
	public List<ReportVO> getReportToList(ReportVO rvo) {
		return reportDAO.getReportToList(rvo);
	}

	@Override//해당 유저가 신고한 목록 (신고자)
	public List<ReportVO> getReportFromList(ReportVO rvo) {
		return reportDAO.getReportFromList(rvo);
	}

	@Override//신고하기 (프로필, 게시판, 댓글 3가지 유형이나 컨트롤러에서 값을 확인후 나누기로 함)
	public void insertReport(ReportVO rvo) {
		reportDAO.insertReport(rvo);
	}



	//신고는 취소가 불가능하도록 설계.
}
