package com.project.petmily.member.impl;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.project.petmily.member.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sst;
	
	public MemberVO getMember(MemberVO mvo) {		
		return sst.selectOne("member.getMember",mvo);
	}

	public List<MemberVO> getMemberList() {
		return sst.selectList("member.getMemberList");
	}

}
