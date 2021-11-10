package com.project.petmily.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.reply.ReplyService;
import com.project.petmily.reply.ReplyVO;

@Controller
public class ReplyAjaxController {

	@Autowired
	ReplyService replyService; 
	
	@RequestMapping(value= "/getReply.do")
	@ResponseBody
	public List<ReplyVO> getReply(@RequestBody ReplyVO repVO){
		List<ReplyVO> ReplyList = replyService.getReply(repVO);
		return ReplyList;
	}
	
	@RequestMapping(value= "/getRecomment.do")
	@ResponseBody
	public List<ReplyVO> getRecomment(ReplyVO repVO){
		List<ReplyVO> ReplyList = replyService.getRecomment(repVO);
		return ReplyList;
	}
	
	@RequestMapping("/insertReply.do")
	@ResponseBody
	public void insertReply(@RequestBody ReplyVO repVO) {
		replyService.inserReply(repVO);
	}
	
	@RequestMapping("/insertRecomment.do")
	@ResponseBody
	public void insertRecomment(@RequestBody ReplyVO repVO) {
		replyService.insertRecomment(repVO);
	}
	
	@RequestMapping("/updateReply.do")
	@ResponseBody
	public void updateReply(@RequestBody ReplyVO repVO) {
		replyService.updateReply(repVO);
	}
	
	@RequestMapping("/deleteReply.do")
	public void deleteReply(@RequestBody ReplyVO repVO) {
		replyService.deleteReply(repVO);
	}
	
}
