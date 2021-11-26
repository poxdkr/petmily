package com.project.petmily.message.impl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.petmily.message.MessageVO;

@Repository
public class MessageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MessageDAO() {
		System.out.println("MessageDAO() 객체 생성");
	}

	// 메시지 리스트
	public ArrayList<MessageVO> messageList(MessageVO vo) {
		String nick = vo.getNick();
		
		// 메시지 리스트에 나타낼 것들(최근메시지, 보낸사람 사진, 보낸사람닉네임) 가져오기
		ArrayList<MessageVO> list = (ArrayList) sqlSession.selectList("messageDAO.message_list", vo);
		for (MessageVO mVO : list) {
			mVO.setMidx(vo.getMidx());
			// 해당 room의 읽지 않은 메시지 가져옴
			int unread = sqlSession.selectOne("messageDAO.count_unread", mVO);
			// 상대방 profile 셋팅
			String mphoto = sqlSession.selectOne("messageDAO.get_other_profile",mVO);
			//읽지 않은 메시지 셋팅
			mVO.setUnread(unread);
			// profile 사진 셋팅
			mVO.setProfile(mphoto);
			// 상대방 닉네임 셋팅
			if (nick.equals(mVO.getSend_nick())) {
				mVO.setOther_nick(mVO.getRecv_nick());
			} else {
				mVO.setOther_nick(mVO.getSend_nick());
			}
		}

		return list;
	}


	// room 메시지 리스트
	public ArrayList<MessageVO> roomContentList(MessageVO vo) {
		
		// 메시지 리스트
		ArrayList<MessageVO> clist = (ArrayList) sqlSession.selectList("messageDAO.room_content_list", vo);
		sqlSession.update("messageDAO.message_read_chk", vo);
		return clist;
	}
	
	//메시지 보내기
	public int messageSendinList(MessageVO vo) {
		// 메시지리스트에서 보낸건지 외부에서 보낸 건지 구분
		if(vo.getRoom() == 0) {	// room이 0이라면 프로필에서 보낸 거
			int exist_chat = sqlSession.selectOne("messageDAO.exist_chat", vo);
			// 프로필에서 보냈을 경우 기존 메시지 내역이 있는지 확인
			if(exist_chat == 0) {	
				System.out.println("exist_chat!!!! : " + vo.toString());
				int max_room = sqlSession.selectOne("messageDAO.max_room", vo);
				vo.setRoom(max_room+1);
			}else {		// 메시지 내역이 있다면 해당 room 번호를 가져와서 셋팅
				int room = sqlSession.selectOne("messageDAO.select_room", vo);
				vo.setRoom(room);
			}
		}
		sqlSession.insert("messageDAO.messageSendInlist", vo);
		
		return vo.getRoom();
	}
	
	//Null 데이터 삭제
	public int deleteNull() {
		return sqlSession.delete("messageDAO.deleteNull");
	}

	//메시지 삭제
	public int deleteMessage(MessageVO vo) {
		return sqlSession.update("messageDAO.deleteMessage", vo);
	}

	//사람 검색
	public int search(MessageVO vo) {
		return sqlSession.selectOne("messageDAO.search", vo);
	}

	//외부에서 보낼 경우 읽음 처리용 
	public int readChk(MessageVO vo) {
		return sqlSession.update("messageDAO.message_read_chk", vo);
	}
	public int messageAlarm(MessageVO vo) {
		return sqlSession.selectOne("messageDAO.count_unread", vo);
	}
}