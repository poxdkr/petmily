package com.project.petmily.report.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.report.ReportVO;

@Repository
public class ReportDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public ReportVO getReportBoard(ReportVO rvo) {
		return sst.selectOne("report.getReportBoard",rvo);
	}
	
	public ReportVO getReportReply(ReportVO rvo) {
		return sst.selectOne("report.getReportReply",rvo);
	}

	public List<ReportVO> getReportToList(ReportVO rvo) {
		return sst.selectList("report.getReportToList",rvo);
	}

	public List<ReportVO> getReportFromList(ReportVO rvo) {
		return sst.selectList("report.getReportFromList",rvo);
	}

	public void insertReport(ReportVO rvo) {
		sst.insert("report.insertReport",rvo);
	}


}
