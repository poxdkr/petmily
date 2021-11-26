package com.project.petmily.withpet;

import java.util.List;

public interface WithpetService {
	void insertWithpet(WithpetVO vo);
	void updateWithpet(WithpetVO vo);
	void deleteWithpet(WithpetVO vo);
	WithpetVO getWithpet(WithpetVO vo);
	List<WithpetVO> getWithpetList(WithpetVO vo);
	List<WithpetVO> getWithpetListType(WithpetVO vo);
	int getWithpetCount(WithpetVO vo);
}
