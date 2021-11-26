package com.project.petmily.view.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.member.MemberVO;
import com.project.petmily.message.MessageService;
import com.project.petmily.message.MessageVO;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	// 메시지 목록
	@RequestMapping(value = "/message_list.do")
	public String message_list(MessageVO vo, Model model, HttpSession session) {

		//첫 진입시 전에 사용했던 세션값 및 DB null 처리 데이터 삭제
		messageService.deleteNull();
		session.setAttribute("gRoom", null);
		session.setAttribute("recv_midx", null);
		
		MemberVO login = (MemberVO) session.getAttribute("user");
		String nick = login.getMnickname();
		int midx = login.getMidx();
		vo.setNick(nick);
		vo.setMidx(midx);

		// 메시지 리스트
		ArrayList<MessageVO> list = (ArrayList) messageService.messageList(vo);
		model.addAttribute("list", list);
		return "/views/message/message_list.jsp";
	}

	// 메시지 목록
	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(Model model, HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("user");
		String nick = login.getMnickname();
		int midx = login.getMidx();
		
		MessageVO vo = new MessageVO();
		vo.setNick(nick);
		vo.setMidx(midx);

		// 메시지 리스트
		ArrayList<MessageVO> list = (ArrayList) messageService.messageList(vo);
		model.addAttribute("list", list);
		
		return "/views/message/message_ajax_list.jsp";
	}
	
	@RequestMapping(value = "/message_ajax_list_r.do")
	public String message_ajax_list_r(HttpServletRequest request, HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("user");
		String nick = login.getMnickname();
		int midx = login.getMidx();

		MessageVO vo = new MessageVO();
		vo.setNick(nick);
		vo.setMidx(midx);

		// 메시지 리스트
		ArrayList<MessageVO> list = (ArrayList) messageService.messageList(vo);
		boolean read_chk = false;

		for(int i = 0; i < list.size(); i++) {
			if(midx == list.get(i).getRecv_midx() && 0 == list.get(i).getRead_chk()) {
				read_chk = true;
				break;
			 }
		 }
		 
		if(read_chk == false) {
			return "/views/message/messageEmpty.jsp";
		}else{
			request.setAttribute("list", list);
			return "/views/message/message_ajax_list.jsp";
		}
						
	}

	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(MessageVO vo, Model model, HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("user");
		vo.setNick(login.getMnickname());
		vo.setMidx(login.getMidx());
		ArrayList<MessageVO> clist = (ArrayList) messageService.roomContentList(vo);

		model.addAttribute("clist", clist);

		return "/views/message/message_content_list.jsp";
	}

	// 메시지 리스트에서 메시지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(MessageVO vo, HttpSession session) {
		MemberVO login = (MemberVO) session.getAttribute("user");
		vo.setSend_midx(login.getMidx());
		int flag = messageService.messageSendinList(vo);
		return flag;
	}
	
	// 개별 메시지 보내기
	@RequestMapping(value = "/message_send.do")
	public String send_message(MessageVO vo, HttpSession session) {
		//null 데이터 삭제 처리용
		messageService.deleteNull();
		MemberVO login = (MemberVO) session.getAttribute("user");
		vo.setSend_midx(login.getMidx());
		vo.setMidx(login.getMidx());
		
		//방 번호 
		int gRoom = messageService.messageSendinList(vo);
		vo.setRoom(gRoom);
		
		//메시지 읽음 처리
		messageService.readChk(vo);

		//gRoom 셋팅
		session.setAttribute("gRoom", gRoom);
		session.setAttribute("recv_midx", vo.getRecv_midx());
		return "/views/message/message_list.jsp";
	}
	
	// 개별 메시지 삭제 
	@RequestMapping(value = "/message_delete.do")
	public String delete_message(MessageVO vo, HttpSession session) {
		int temp = messageService.deleteMessage(vo);
		return "message_content_list.do";
	}
	
	@RequestMapping(value = "/search.do")
	@ResponseBody
	public String search(MessageVO vo) {
      String result = String.valueOf(messageService.serach(vo));
      return result;
   }
	
	//헤더 알람 확인용
   @RequestMapping(value = "/message_alarm.do")
   @ResponseBody
   public String message_alarm(MessageVO vo) {
      return String.valueOf(messageService.messageAlarm(vo));
   }
}
