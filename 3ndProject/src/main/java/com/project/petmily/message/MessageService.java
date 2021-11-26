package com.project.petmily.message;
import java.util.List;

public interface MessageService {
	void sendMessage(MessageVO vo);
	void deleteRoom(MessageVO vo);
	int readChk(MessageVO vo);
	int deleteNull();
	int deleteMessage(MessageVO vo);
	
	List<MessageVO> messageList(MessageVO vo);
	List<MessageVO> roomContentList(MessageVO vo);
	int messageSendinList(MessageVO vo);
	int serach(MessageVO vo);
	int messageAlarm(MessageVO vo);
}
