package com.project.petmily.board.controller;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.petmily.board.BoardService;
import com.project.petmily.board.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO bvo, Model model) {
		List<BoardVO> boardList = boardService.getBoardList();
		model.addAttribute("boardList",boardList);
		return "getBoardList.jsp";
	}
	
	@RequestMapping("/getBoardListAjax.do")
	@ResponseBody
	public List<BoardVO> getBoardListAjax() {
		return boardService.getBoardList();
	}
	
		
	@RequestMapping("/getBoardListByKeyword.do")
	public String getBoardListByKeyword(BoardVO bvo, Model model) {
		//searchCondition별 boardCate 지정
		//System.out.println("bvo.getSearchCondition >>> " + bvo.getSearchCondition());
		if(bvo.getSearchCondition().equals("고양이")) {
			bvo.setBoardcate(1);
		}else if(bvo.getSearchCondition().equals("강아지")) {
			bvo.setBoardcate(2);
		}else if(bvo.getSearchCondition().equals("댕냥노하우")) {
			bvo.setBoardcate(3);
		}else if(bvo.getSearchCondition().equals("자유주제")) {
			bvo.setBoardcate(4);
		}
		
		//System.out.println("bvo.getSearchKeyword >>> " + bvo.getSearchKeyword());
		//System.out.println("bvo 전체  : " + bvo);
		List<BoardVO> boardList = boardService.getBoardListByKeyword(bvo);
		//System.out.println("boardListByKeyword : "  +boardList);
		model.addAttribute("boardListByKeyword",boardList);
		return "getBoardList.jsp";
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO bvo, Model model) {
		bvo = boardService.getBoard(bvo);
		model.addAttribute("board",bvo);
		return "boardDetails.jsp";
	}
	
	@RequestMapping(value="/beforeUpdateBoard.do")
	public String beforeUpdateBoard (BoardVO bvo, Model model) {
		bvo = boardService.getBoard(bvo);
		model.addAttribute("board",bvo);
		return "updateBoard.jsp";
	}
		
	@RequestMapping(value="insertBoard.do", method=RequestMethod.POST)
	public String insertBoard(BoardVO bvo, @RequestParam("bpict") MultipartFile[] files) throws IllegalStateException, IOException {
		
		//System.out.println("insertBoard.do 연결됨");

		System.out.println(" > files : " + files);
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.DAY_OF_MONTH)+1;
		int date = cal.get(Calendar.DATE);
		int mSecond = cal.get(Calendar.MILLISECOND);
		String dateInfo = year+"_"+month+"_"+date+"_"+mSecond;
		
		if(!(files[0].isEmpty())) {
			String fileName = files[0].getOriginalFilename();//업로드 당시 원래 파일의 이름 
			files[0].transferTo(new File("C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\" +dateInfo+ fileName)); //업로드될 위치 경로와 파일의 이름까지 필요 }
			bvo.setBpict1(dateInfo+ fileName);
		}else {
			bvo.setBpict1("nonePict.jpg");
		}
		if(!(files[1].isEmpty())) {
			String fileName = files[1].getOriginalFilename();//업로드 당시 원래 파일의 이름 
			files[1].transferTo(new File("C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\" +dateInfo+ fileName)); //업로드될 위치 경로와 파일의 이름까지 필요 }
			bvo.setBpict2(dateInfo+ fileName);
		}else {
			bvo.setBpict2("nonePict.jpg");
		}
		if(!(files[2].isEmpty())) {
			String fileName = files[2].getOriginalFilename();//업로드 당시 원래 파일의 이름 
			files[2].transferTo(new File("C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\" +dateInfo+ fileName)); //업로드될 위치 경로와 파일의 이름까지 필요 }
			bvo.setBpict3(dateInfo+ fileName);
		}else {
			bvo.setBpict3("nonePict.jpg");
		}
		
		//System.out.println("bvo : "+bvo);
		
		//insert 작업
		boardService.insertBoard(bvo);
		
		//전체 보드리스트의 갯수를 확인 최대갯수의 파라미터를 넘겨줌.
		List<BoardVO> blist = boardService.getBoardList(); 
		int bMaxIndex = 0;
		for(BoardVO board : blist) {
			bMaxIndex++;
		}
		return "getBoard.do?bidx="+bMaxIndex+"";
	}
					
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO bvo) {
	  
	  //먼저 게시물의 모든 정보를 가져와야 함.
	  bvo = boardService.getBoard(bvo);
		
	  boardService.deleteBoard(bvo);
	  
	  String fileName1 = bvo.getBpict1();
	  String fileName2 = bvo.getBpict2();
	  String fileName3 = bvo.getBpict3();
	  
	  String delPath1 = "C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\"+ fileName1; 
	  String delPath2 = "C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\"+ fileName2; 
	  String delPath3 = "C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\"+ fileName3;
	  
	  //해당 위치에 파일이 있는지 확인하고 있다면 삭제 처리
	  File file1 = new File(delPath1);
			if(file1.exists() == true){
			file1.delete();
		}
	  File file2 = new File(delPath2);
				if(file2.exists() == true){
				file2.delete();
			}
	  File file3 = new File(delPath3);
				if(file3.exists() == true){
				file3.delete();
				}
				
		return "start.jsp";
	} 
	
	@RequestMapping(value="updateBoardAlarm.do",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public void updateBoardAlarm(BoardVO bvo) {
		//System.out.println("bvo (알람을 확인) : " + bvo);
		boardService.updateBoardAlarm(bvo);
		return;
	}
	
	@RequestMapping(value="resetBoardAlarm.do",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public void resetBoardAlarm(BoardVO bvo) {
		System.out.println("bvo (알람을 확인) : " + bvo);
		boardService.resetBoardAlarm(bvo);
	}
	/////////////////////////////////////////////////////////////////////////////////////////////

	@RequestMapping(value="updateBoard.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String updateBoard(BoardVO bvo, @RequestParam("bpict") MultipartFile[] files,
			@RequestParam("oriPict1") String oriPict1,
			@RequestParam("oriPict2") String oriPict2,
			@RequestParam("oriPict3") String oriPict3
			) throws IllegalStateException, IOException {
		
		System.out.println("updateBoard.do 연결됨");

		System.out.println(" > files : " + files);
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.DAY_OF_MONTH)+1;
		int date = cal.get(Calendar.DATE);
		int mSecond = cal.get(Calendar.MILLISECOND);
		String dateInfo = year+"_"+month+"_"+date+"_"+mSecond;
		
		
		if(!(files[0].isEmpty())) {
			String fileName = files[0].getOriginalFilename();//업로드 당시 원래 파일의 이름 
			files[0].transferTo(new File("C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\" +dateInfo+ fileName)); //업로드될 위치 경로와 파일의 이름까지 필요 }
			bvo.setBpict1(dateInfo+ fileName);
		}else {
			bvo.setBpict1(oriPict1);
		}
		if(!(files[1].isEmpty())) {
			String fileName = files[1].getOriginalFilename();//업로드 당시 원래 파일의 이름 
			files[1].transferTo(new File("C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\" +dateInfo+ fileName)); //업로드될 위치 경로와 파일의 이름까지 필요 }
			bvo.setBpict2(dateInfo+ fileName);
		}else {
			bvo.setBpict2(oriPict2);
		}
		if(!(files[2].isEmpty())) {
			String fileName = files[2].getOriginalFilename();//업로드 당시 원래 파일의 이름 
			files[2].transferTo(new File("C:\\Users\\k\\git\\petmily\\3ndProject\\src\\main\\webapp\\images\\" +dateInfo+ fileName)); //업로드될 위치 경로와 파일의 이름까지 필요 }
			bvo.setBpict3(dateInfo+ fileName);
		}else {
			bvo.setBpict3(oriPict3);
		}
		
		System.out.println("bvo : "+bvo);
		
		//update 작업
		boardService.updateBoard(bvo);
		
		//수정된 bidx로 이동
		return "getBoard.do?bidx="+bvo.getBidx()+"";
	}
	
	
}
