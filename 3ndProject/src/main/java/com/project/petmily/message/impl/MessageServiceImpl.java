package com.project.petmily.message.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.petmily.message.MessageService;
import com.project.petmily.message.MessageVO;

@Service("messageService")
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDAO messageDAO;
	
	public MessageServiceImpl() {
		System.out.println("MessageServiceImpl() 객체 생성");
	}
	
	@Override
	public void sendMessage(MessageVO vo) {
		
	}

	@Override
	public void deleteRoom(MessageVO vo) {
		
	}

	@Override
	public ArrayList<MessageVO> messageList(MessageVO vo) {
		return messageDAO.messageList(vo);
	}

	@Override
	public ArrayList<MessageVO> roomContentList(MessageVO vo) {
		return messageDAO.roomContentList(vo);
	}

	@Override
	public int messageSendinList(MessageVO vo) {
		return messageDAO.messageSendinList(vo);
	}

	@Override
	public int deleteNull() {
		return messageDAO.deleteNull();
	}

	@Override
	public int deleteMessage(MessageVO vo) {
		return messageDAO.deleteMessage(vo);
	}

	@Override
	public int serach(MessageVO vo) {
		return messageDAO.search(vo);
	}

	@Override
	public int readChk(MessageVO vo) {
		return messageDAO.readChk(vo);
	}
	@Override
	public int messageAlarm(MessageVO vo) {
		return messageDAO.messageAlarm(vo);
	}
	


}
