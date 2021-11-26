package com.project.petmily.knowhow.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.petmily.comment.CommentService;
import com.project.petmily.comment.CommentVO;
import com.project.petmily.common.KnowhowPaging;
import com.project.petmily.knowhow.KnowhowService;
import com.project.petmily.knowhow.KnowhowVO;
import com.project.petmily.like.LikeService;
import com.project.petmily.like.LikeVO;

@Controller
//@SessionAttributes("board") // board 라는 이름의 Model 있으면 session에 저장
public class KnowhowController {
	@Autowired
	private KnowhowService knowhowService;
	@Autowired
	private CommentService commentService;
	
	public KnowhowController() {
		System.out.println("--->> KnowhowController() 객체생성");
	}
	
	// 메소드에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// 뷰에 전달될 때 설정된 명칭(예: conditionMap)
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		System.out.println("--->> Map searchConditionMap() 실행");
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}

	// 리턴타입 : ModelAndView -> String
	// 전달할 데이터 저장 : ModelAndView -> Model
	@RequestMapping("/getKnowhow.do")
	public String getBoard(KnowhowVO vo, Model model) {
		//게시글 상세 보여주기
		System.out.println(">>> 게시글 상세 보여주기");
		KnowhowVO knowhow = knowhowService.getKnowhow(vo);
		System.out.println(":: getKnowhow knowhow : " + knowhow);
		
		//해당 게시글의 댓글 리스트 추출
		CommentVO cvo = new CommentVO();
		cvo.setBidx(knowhow.getBidx());
		
		List<CommentVO> list = commentService.getCommentList(cvo);
		System.out.println("commetList : " + list);
		
		
		model.addAttribute("knowhow", knowhow); //Model 객체 사용 View로 데이터 전달
		model.addAttribute("commentList", list);
		
		return "getKnowhow.jsp";
	}
	
	//노하우 게시글 전체 목록 보여주기
	@RequestMapping("/getKnowhowList.do")
	public String getKnowhowList(KnowhowVO vo, Model model, HttpServletRequest request) {
		//페이징 처리 객체
		KnowhowPaging p = new KnowhowPaging();
		//임시 KnowhowVO 객체
		KnowhowVO kvo = new KnowhowVO();
		//카테고리별 게시글 수를 저장하는 객체
		Map<String, Integer> map = new HashMap<>();
		
		//전체, 강아지, 고양이 게시글 변수
		int total = 0;
		int total2 = 0;
		int total3 = 0;
		
		if (vo.getBoardcate() == 0) {
			//카테고리가 전체일 때
			//총 게시글 수 구하기
			total = knowhowService.getKnowhowCount(vo);
			p.setTotalRecord(total);
			//강아지 게시글 수 구하기
			kvo.setBoardcate(4);
			total2 = knowhowService.getKnowhowCount(kvo);
			//고양이 게시글 수 구하기
			kvo.setBoardcate(5);
			total3 = knowhowService.getKnowhowCount(kvo);
		} else if (vo.getBoardcate() == 4) {
			//카테고리가 강아지일 때
			//총 게시글 수 구하기
			kvo.setBoardcate(0);
			total = knowhowService.getKnowhowCount(kvo);
			//강아지 총 게시글 수 구하기
			total2 = knowhowService.getKnowhowCount(vo);
			p.setTotalRecord(total2);
			//고양이 총 게시글 수 구하기
			kvo.setBoardcate(5);
			total3 = knowhowService.getKnowhowCount(kvo);
		} else if (vo.getBoardcate() == 5) {
			//카테고리가 강아지일 때
			//총 게시글 수 구하기
			kvo.setBoardcate(0);
			total = knowhowService.getKnowhowCount(kvo);
			//강아지 총 게시글 수 구하기
			kvo.setBoardcate(4);
			total2 = knowhowService.getKnowhowCount(kvo);
			//고양이 총 게시글 수 구하기
			total3 = knowhowService.getKnowhowCount(vo);
			p.setTotalRecord(total3);
		}
			map.put("total", total);
			map.put("total2", total2);
			map.put("total3", total3);
			
		//2. 총 페이지 수 구하기
		int tPage = 0;
		if (vo.getBoardcate() == 4) {
			total = total2;
		} else if (vo.getBoardcate() == 5) {
			total = total3;
		}
		if (total % p.getNumPerPage() > 0) {
			tPage = total/p.getNumPerPage() + 1;
		} else if (total % p.getNumPerPage() == 0) {
			tPage = total/p.getNumPerPage();
		}
		p.setTotalPage(tPage);
		
		System.out.println("총 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		System.out.println("cPage : " + cPage);
		System.out.println("현재 페이지 : " + p.getNowPage());
		
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setBegin(12 * (p.getNowPage()-1));
		//p.setEnd(p.getNowPage() * p.getNumPerPage());
		
		//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 사용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() + 1;
		System.out.println("beginPage : " + beginPage);
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() * p.getPagePerBlock());
		
		//4-1 endPage가 전체페이지 수(totalPage) 보다 크면
		//끝 페이지 수를 전체페이지 수로 변경
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		
		System.out.println(">>> 게시글 전체목록 보여주기");
		System.out.println(":: getKnowhowList() vo : " + vo);
		
		List<KnowhowVO> knowhowList = null;
		if (vo.getBoardcate() == 0) {
			knowhowList = knowhowService.getKnowhowList(vo);
		} else if (vo.getBoardcate() != 0) {
			knowhowList = knowhowService.getKnowhowListType(vo);
		}
		
		
		model.addAttribute("knowhowList", knowhowList);
		model.addAttribute("pvo", p);
		model.addAttribute("type", vo.getBoardcate());
		model.addAttribute("map", map);
		
		return "getKnowhowList.jsp";
	}	
	
	//노하우 게시글 입력
	@RequestMapping("/insertKnowhow.do")
	public String insertKnowhow(KnowhowVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 게시글 입력");
		System.out.println("insert vo : " + vo);
		
		knowhowService.insertKnowhow(vo);
		return "getKnowhowList.do?boardcate=0";
	}	
	
	//수정할 페이지로 이동
	@RequestMapping("/updateKnowhow.do")
	public String updateBoard(KnowhowVO vo, Model model) {
		System.out.println(">>> 게시글 수정");
		System.out.println("update vo : " + vo);
		KnowhowVO knowhow = knowhowService.getKnowhow(vo);
		System.out.println("knowhow vo : " + vo);
		
		model.addAttribute("knowhow", knowhow);
		return "updateKnowhow.jsp";
	}
	
	//노하우 수정
	@RequestMapping("/updateKnowhowOk.do")
	public String updateBoardOk(KnowhowVO vo) {
		System.out.println(">>> 게시글 수정");
		System.out.println("updateKnowhowOk vo : " + vo);
		knowhowService.updateKnowhow(vo);
		
		System.out.println("knowhow vo : " + vo);
		
		return "getKnowhow.do?bidx="+vo.getBidx();
	}
	
	//노하우 게시글 삭제
	@RequestMapping("/deleteKnowhow.do")
	public String deleteBoard(KnowhowVO vo) {
		System.out.println(">>> 게시글 삭제");
		System.out.println("deleteVO vo : " + vo);
		knowhowService.deleteKnowhow(vo);
		return "getKnowhowList.do";
	}
	
	//노하우 게시글 top3
	@ResponseBody
	@RequestMapping("/getKnowhowListTop.do")
	public List<KnowhowVO> getKnowhowListTop() {
		List<KnowhowVO> list = knowhowService.getKnowhowListTop();
		return list;
	}
	
	//게시글 top3
	@ResponseBody
	@RequestMapping("/getBoardListTop.do")
	public List<KnowhowVO> getBoardListTop() {
		List<KnowhowVO> list = knowhowService.getBoardListTop();
		return list;
	}
}
