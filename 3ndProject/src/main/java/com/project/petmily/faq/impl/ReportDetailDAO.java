package com.project.petmily.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.faq.ReportDetailVO;


@Repository
public class ReportDetailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ReportDetailDAO() {
		
	}
	
	public List<ReportDetailVO> reportList() {

		return sqlSession.selectList("reportDetailDAO.reportList");
	}
	
	public ReportDetailVO reportBoard(ReportDetailVO vo) {

		return sqlSession.selectOne("reportDetailDAO.reportBoard", vo);
	}
	
	public ReportDetailVO reportBoardReply(ReportDetailVO vo) {

		return sqlSession.selectOne("reportDetailDAO.reportBoardReply", vo);
	}

	public ReportDetailVO reportCount(ReportDetailVO vo) {
		
		return sqlSession.selectOne("reportDetailDAO.reportCount", vo);
	}

	public int getTotalCount() {
		
		return sqlSession.selectOne("reportDetailDAO.getTotalCount");
	}

	public List<ReportDetailVO> getReportContent(ReportDetailVO vo) {
		
		return sqlSession.selectList("reportDetailDAO.getReportContent", vo);
	}

	public void boardReportDelete(ReportDetailVO vo) {
		sqlSession.delete("reportDetailDAO.boardReportDelete", vo);
		
	}

	public void replyReportDelete(ReportDetailVO vo) {
		sqlSession.delete("reportDetailDAO.replyReportDelete", vo);
		
	}

	public void deleteReport(ReportDetailVO vo) {
		
		sqlSession.delete("reportDetailDAO.deleteReport", vo);
	}


}
