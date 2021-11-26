package com.project.petmily.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.faq.Faq;
import com.project.petmily.faq.FaqVO;

@Service
public class FaqImpl implements Faq {

	@Autowired
	private FaqDAO faqDAO;

	public FaqImpl() {
		// 지우기
		System.out.println("FaqImpl객체생성");
	}

	@Override
	public void insertFaq(FaqVO vo) {
		faqDAO.insertFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
		faqDAO.updateFaq(vo);

	}

	@Override
	public void deleteFaq(FaqVO vo) {
		faqDAO.deleteFaq(vo);

	}

	@Override
	public FaqVO getFaqBoard(FaqVO vo) {

		return faqDAO.getFaqBoard(vo);
	}

	@Override
	public List<FaqVO> getFaqBoardList() {

		return faqDAO.getFaqBoardList();
	}

	@Override
	public List<FaqVO> faqSearchList(FaqVO vo) {

		return faqDAO.faqSearchList(vo);
	}

	@Override
	public List<FaqVO> buttonFaqList(FaqVO vo) {

		return faqDAO.buttonFaqList(vo);
	}

}
