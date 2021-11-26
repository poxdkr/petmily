package com.project.petmily.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.petmily.faq.FaqVO;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public FaqDAO() {
		// 지우기
		System.out.println("FaqDAO객체생성");
	}

	// FAQ글 입력
	public void insertFaq(FaqVO vo) {

		sqlSession.insert("faqDAO.insertFaq", vo);

	}

	public void updateFaq(FaqVO vo) {

		sqlSession.update("faqDAO.updateFaq", vo);

	}

	public void deleteFaq(FaqVO vo) {
		sqlSession.delete("faqDAO.deleteFaq", vo);

	}

	public FaqVO getFaqBoard(FaqVO vo) {

		return sqlSession.selectOne("faqDAO.getFaqBoard", vo);
	}

	public List<FaqVO> getFaqBoardList() {

		return sqlSession.selectList("faqDAO.getFaqBoardList");
	}

	public List<FaqVO> faqSearchList(FaqVO vo) {

		return sqlSession.selectList("faqDAO.faqSearchList", vo);
	}

	public List<FaqVO> buttonFaqList(FaqVO vo) {

		return sqlSession.selectList("faqDAO.buttonFaqList", vo);
	}

}
