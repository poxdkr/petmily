package com.project.petmily.faq;

import java.util.List;

public interface Faq {
	
	void insertFaq(FaqVO vo);
	void updateFaq(FaqVO vo);
	void deleteFaq(FaqVO vo);
	FaqVO getFaqBoard(FaqVO vo);
	List<FaqVO> getFaqBoardList();
	List<FaqVO> faqSearchList(FaqVO vo);
	List<FaqVO> buttonFaqList(FaqVO vo);
	
	

}


