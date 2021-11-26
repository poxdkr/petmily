<%@page import="com.project.petmily.member.MemberVO"%>
<%@page import="com.project.petmily.member.impl.MemberServiceImpl"%>
<%@page import="com.project.petmily.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardVO board = (BoardVO) request.getAttribute("board");
//말머리 찾기
String boardCate = "";
if (board.getBoardcate() == 1) {
	boardCate = "고양이";
} else if (board.getBoardcate() == 2) {
	boardCate = "강아지";
} else if (board.getBoardcate() == 3) {
	boardCate = "댕냥노하우";
} else {
	boardCate = "자유주제";
}
pageContext.setAttribute("boardCate", boardCate);

//사진 있는지 여부 확인
if (board.getBpict1() != null) {
	String bpict1 = board.getBpict1();
	String bpict2 = board.getBpict2();
	String bpict3 = board.getBpict3();
	pageContext.setAttribute("bpict1", bpict1);
	pageContext.setAttribute("bpict2", bpict2);
	pageContext.setAttribute("bpict3", bpict3);
} else {
	pageContext.setAttribute("bpict1", "nonePict.jpg");
	pageContext.setAttribute("bpict2", "nonePict.jpg");
	pageContext.setAttribute("bpict3", "nonePict.jpg");
}
%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>메인페이지</title>

<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hi+Melody&display=swap" rel="stylesheet">


<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>


////////////////////////////////////////////////
//글쓰기 시도
function tryWrite(){

	//alert("user정보 있는지 확인 후 글쓰기");
	if("${user.midx}".trim() == ""){
		alert("로그인이 필요합니다!");
		location.href="loginPage.jsp";
	}else{
		location.href="insertBoard.jsp";
	}
}

//게시글 수정하기
function updateBoard(bidx){
	let answer = confirm("게시물을 수정할까요??");
	if(answer){
		location.href="beforeUpdateBoard.do?bidx="+bidx;
	}else{
		return;
	}
}


//게시글 삭제하기
function deleteBoard(bidx){
	let answer = confirm("게시물을 삭제하려고 해요! 정말로 삭제할까요??");
	if(answer){
		location.href="deleteBoard.do?bidx="+bidx;
	}else{
		return;
	}
} 

/////////////////////////////////////////////////
//해당게시물로 넘어가기 함수
function getBoard(bidx){
	//alert("연결됨. 게시물의 bidx : " + bidx);
	location.href="getBoard.do?bidx="+bidx;
}

/////////////////////////////////////////////////
//메시지보내기 함수
function sendMessage(midx){
	if(${user.midx == board.midx }){
		alert("본인에게는 쪽지보내기를 할 수 없어요!");
		return;
	}else{
		location.href="message_send.do?recv_midx="+midx;
	}
}
/////////////////////////////////////////////////
//답글쓰기 함수
function insertRecomment(ridx){
	if(${user.midx} == 0){
		alert("로그인이 필요한 서비스입니다.");
		return;
	}
	
	if($("#recommentVal"+ridx).val().trim() == ""){
		alert("답글 내용은 반드시 들어가야 해요!");
	}else{
		let recomment={};
		recomment.bidx = ${board.bidx };
		recomment.midx = ${user.midx };
		recomment.recomment = ridx;
		recomment.rcontent = $("#recommentVal"+ridx).val();
		//alert("JSON.stringify(recomment) : " +JSON.stringify(recomment));
		
		$.ajax({
			url : "insertRecomment.do",
			type: "post",
			data: JSON.stringify(recomment),
			//dataType:"json", 
			contentType:"application/json",
			success : function(){
				alert("답글입력이 완료되었습니다!");
				history.go(0);
			}, 
			error : function(){
				 alert("페이지통신 중 오류가 발생하였습니다!");
			    }
			}); 
	}
}

/////////////////////////////////////////////////
//답글보기/작성 클릭시 나올 파트
	function getRecomment(ridx){
		//답글보기 지워줌
		$("#a"+ridx).html("");
		
		//alert("대댓글 보기 함수 ridx = " + ridx);
		let recommentHtml = "";
		recommentHtml += "<tr>";
		recommentHtml += "<td id=\"repNo"+ridx+"\" colspan=\"2\" style='border:none;'><a href=\"javascript:closeRecomment("+ridx+")\"><small><u>답글 닫기</u></small></a></td>";
		recommentHtml += "</tr>"
		recommentHtml += "<tr>";
		recommentHtml += "<td id=\"inputRecommentSpace\" colspan=\"2\">";
		recommentHtml += "<input type=\"text\" id=\"recommentVal"+ridx+"\" placeholder=\"서로에게 따뜻한 말을 남겨주세요!\">";
		recommentHtml += "<button type = \"button\" id=\"recommentSubmit\" onclick=\"javascript:insertRecomment("+ridx+")\">답글입력</button>";
		recommentHtml += "</td>";
		recommentHtml += "</tr>"
		$("#recNo"+ridx).append (recommentHtml);
		$.ajax({
			url : "getRecomment.do",
			data : "ridx="+ridx,
			dataType : "json",
			//contentType : "application/json",
			type:"post",
			async: false,
			success : function(data){//해당 게시글에 댓글이 있는 경우 모두 불러옴
				//alert("작성자가 맞고 대댓글인 ajax 연결 성공.");
				
				if(data.length<=0){	
					//추가할 행을 tr id="recNo + ridx에 append함
					recommentHtml = "";
					recommentHtml += "<tr>";
					recommentHtml += "<td id=\"repNo"+ridx+"\" colspan=\"2\"><small>현재 등록된 답글이 없네요.....</td>";
					recommentHtml += "</tr>"
					$("#recNo"+ridx).append (recommentHtml);
				}else{	
				
					//alert("data : " + JSON.stringify(data));
					//불러온 대댓글 리스트 모두 불러와서 each 돌림
					$.each(data,function(index, item){
						//날짜 처리 
						const date = new Date(+this.rregdate + 3240 * 10000).toISOString().split("T")[0];
						//불러온 리스트 each로 getMember 해야됨.
						let recoRidx=this.ridx;
						let userMidx = this.midx;
						let userNickname ="";
						let rcontent = this.rcontent;
						//alert("this.recomment, ridx : " + this.recomment + " : "+ this.ridx);
						$.ajax({
							url : "getAjaxMember.do",
							type: "post",
							data: "midx="+userMidx,
							//data : JSON.stringify(mvo),
							//contentType:"application/json",
							dataType:"json",
							async : false,
							success : function(data){
								
								//alert("reply -> member ajax 연결");
								console.log(data);
								let midx = data.midx;
								let mid = data.mid;
								let pwd = data.pwd;
								let mname = data.mname;
								let mphone = data.mphone;
								mnickname = data.mnickname;
								let mphoto = data.mphoto;
								
								//추가할 행을 tr id="recNo + ridx에 append함
								recommentHtml = "";
								recommentHtml += "<tr>";
								recommentHtml += "<td id=\"repNo"+ridx+"\" style=\"color:black;\" colspan=\"2\"><small>ㄴ> (답글)";  
								recommentHtml += "<input type=\"checkbox\" id='recommentMenuBtn"+recoRidx+"'>";
								recommentHtml += "<label for='recommentMenuBtn"+recoRidx+"' class=\"labelBtn\" onclick=''>"+mnickname+"</label>";
								recommentHtml += "<ul class='recommentSubmenu"+recoRidx+"'>";
								recommentHtml += "<li><a href='myPage.do?midx="+midx+"'>작성자의 Mypage</a></li>";
								recommentHtml += "<li><a href='javascript:sendMessage("+midx+")'>작성자에게 쪽지 보내기</a></li>";
								recommentHtml += "</ul>   [ "+date+" ]</small></td>";
								recommentHtml += "</tr>"
								recommentHtml += "<tr>";
								recommentHtml += "<td id=\"repNo"+ridx+"\" style=\"padding : 0px 10px; \"  colspan=\"2\"><small>&nbsp;&nbsp;&nbsp;&nbsp;(답글내용)  "+rcontent+" </small></td>";
								recommentHtml += "</tr>"
								
								
								$("#recNo"+ridx).append (recommentHtml);
								
							}, error : function(data){
								alert("ajax 실패");
							}
						}); 
					});
				}	
			},error:function(data){
				alert("작성자가 맞고 대댓글인 ajax 연결 실패.");
			}
		});
	}
	///////////////////////////////////////////////////
	//답글 닫기 기능
	function closeRecomment(ridx){
		$("#recNo"+ridx+" td").remove();
		$("#a"+ridx).html("<a href=\"javascript:getRecomment("+ridx+")\" id=\"a"+ridx+"\">답글보기/작성 </a>|</span>");
	}
	
	///////////////////////////////////////////////////
	//댓글 신고하기 기능
	function replyReport(ridx){
		//alert("신고하기 함수 ridx = " + ridx);
	///////////////////////////////////////
	// 게시물의 신고정보 불러오기
			let rvoReply ={};
			rvoReply.rfrom = ${user.midx };
			rvoReply.rtype = 2;
			rvoReply.rnum = ridx;
			
			let replyRepoChecked = false;
			//alert("JSON.stringify(rvoReply) : " + JSON.stringify(rvoReply));
			
			$.ajax({
				url : "getReportReply.do",
				data : JSON.stringify(rvoReply),
				dataType : "json",
				contentType : "application/json",
				type:"post",
				success : function(data){
					if(data != null){ //이미 신고가 되어있는 경우
					replyRepoChecked = true;
					//alert("repoChecked : " + replyRepoChecked);
					alert("< 이미 신고된 댓글입니다 >");
					}
				},error : function(){ //신고를 아직 하지 않은 경우
				//리턴되는 데이터가 null일 경우 실패된다.
					replyRepoChecked = false;
					//alert("repoChecked : " + replyRepoChecked);
					let confirmReport = confirm("< 해당 댓글을 신고하시겠습니까? (허위신고시 제제될 수 있습니다!) >");
					if(confirmReport){
						//신고사유 rvo에 삽입
						rvoReply.rcontent = "댓글 내용에 대한 신고내용";
						
						$.ajax({
							url : "insertReport.do",
							type: "post",
							data: JSON.stringify(rvoReply),
							//dataType:"json", //리턴값이 없으니 dataType을 쓰면 안됨.
							contentType:"application/json",
							success : function(){
								alert("댓글 신고가 완료되었습니다!");
							}, 
							error : function(){
								 alert("페이지통신 중 오류가 발생하였습니다!");
							    }
							}); 
					}else{
						return;
					}
				}
			});
	}
	////////////////////////////////////////////////////////////////////
	//댓글 삭제하기 기능 (실제로는 내용을 "삭제된 댓글입니다"로 바꿔줌)
	function replyDelete(ridx){
		let answerDelete = confirm("댓글을 정말로 삭제하시겠습니까?");
		if(answerDelete){
			
			let replyDel = {};
			replyDel.rcontent = "삭제된 댓글입니다.";
			replyDel.ridx = ridx;
			
			$.ajax({
				url : "updateReply.do",
				type: "post",
				data: JSON.stringify(replyDel),
				//dataType:"json", //리턴값이 없으니 dataType을 쓰면 안됨.
				contentType:"application/json",
				success : function(){
					alert("댓글이 삭제되었습니다!");
					history.go(0);
				}, 
				error : function(){
					 alert("페이지통신 중 오류가 발생하였습니다!");
				    }
				}); 
		}else{ //삭제를 취소할 경우 그대로 리턴
			return;
		}
	}
	//////////////////////////////////////////////////////////////////////////////////
	// 광고클릭시 Cnt 상승
	function goAdLink(aLink,adNo){
		//Cnt 상승을 위한 ajax 처리
		//alert("aLink, adNo : " + aLink+ ":"+adNo);
		
		$.ajax({
			url : "plusCntAd.do",
			type : "post",
			data : "aidx="+adNo,
			//contentType : "application/json",
			success : function(){
				//alert("plusCnt 성공");
			},error : function(){
				//alert("plusCnt 실패");
			}
		});
		var newWindow = window.open("about:blank");
		newWindow.location.href=aLink; 
	}
	
	
//Jquery 시작////////////////////////////////////////////////////////////////////////	
$(function(){
	
	let likeChecked = false;
	let mnickname ="";
	//1. 작성자의 정보 ajax로 불러오기
	$.ajax({
		url : "getAjaxMember.do",
		type: "post",
		data: "midx=${board.midx}",
		//data : JSON.stringify(mvo),
		//contentType:"application/json",
		dataType:"json",
		success : function(data){
			//alert("ajax 연결");
			console.log(data);
			let midx = data.midx;
			let mid = data.mid;
			let pwd = data.pwd;
			let mname = data.mname;
			let mphone = data.mphone;
			mnickname = data.mnickname;
			let mphoto = data.mphoto;
			
			let detailNickname ="";
			
			detailNickname += "<input type=\"checkbox\" id=\"userMenuBtn\">";
			detailNickname += "<label for=\"userMenuBtn\" class=\"labelBtn\" onclick=\"\"><img width='25px' src='"+mphoto+"' style='border:1px solid lightgrey; border-radius:50%;'>&nbsp;&nbsp;<b><small id='nicknameText'>"+mnickname+"</small></b></a>&nbsp;</label>";
			detailNickname += "<ul class=\"userSubmenu\">";
			detailNickname += "<li><a href='myPage.do?midx="+midx+"'>작성자의 Mypage</a></li>";
			detailNickname += "<li><a href='javascript:sendMessage("+midx+")'>작성자에게 쪽지 보내기</a></li>";
			detailNickname += "</ul>";

				$("#userInfo").append(detailNickname);
			
			
			
		}, error : function(data){
			alert("ajax 실패");
		}
	});
	////////////////////////////////////////
	//2.게시물의 Like정보 ajax로 불러오기
		$.ajax({
		url : "getBoardLike.do",
		type: "post",
		data: "bidx=${board.bidx}",
		dataType:"json",
		success : function(data){
			//해당 게시글의 LIKE 정보를 미리 가공
			//해당 게시글의 LIKE갯수
			let likeCnt =0;
			//유저가 눌렀는지 여부
			likeChecked = false;
			
			$.each(data,function(index, item){
				//해당 게시글의 LIKE갯수 계산
				likeCnt += 1;
				if(this.midx == ${user.midx }){
					likeChecked=true;
				}
			});
			
			//좋아요 숫자 붙이기
			$("#likeCnt").html("("+likeCnt+")");
			
			if(likeChecked == true){
			//좋아요 그림변경
			$("#likeControll").html("<img src=\"./images/like2.jpg\" width =\"15px;\">좋아요");
			}
		}, 
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
	
	///////////////////////////////////////
	//3.게시물의 즐겨찾기 정보 ajax로 불러오기
		let fvo ={};
		fvo.midx = ${user.midx };
		fvo.bidx = ${board.bidx };
		fvo.boardcate = ${board.boardcate};
		let favChecked = false;
		
		$.ajax({
			url : "getFavoriteCheck.do",
			data : JSON.stringify(fvo),
			dataType : "json",
			contentType : "application/json",
			type:"post",
			success : function(data){
				if(data != null){ //즐찾이 되어있는 경우
					favChecked = true;
					$("#favControll").html("<img src=\"./images/favorite2.jpg\" width =\"18px;\">즐겨찾기");
				}
			},error : function(){
		   
			}
		});
	
	///////////////////////////////////////
	//4. 게시물의 신고정보 불러오기
		let rvoBoard ={};
		rvoBoard.rfrom = ${user.midx };
		rvoBoard.rto = ${board.midx };
		rvoBoard.rtype = 1;
		rvoBoard.rnum = ${board.bidx };
		
		let repoChecked = false;
		//alert("JSON.stringify(rvoBoard) : " + JSON.stringify(rvoBoard));
		
		$.ajax({
			url : "getReportBoard.do",
			data : JSON.stringify(rvoBoard),
			dataType : "json",
			contentType : "application/json",
			type:"post",
			success : function(data){
				if(data != null){ //이미 신고가 되어있는 경우
				repoChecked = true;
				//alert("repoChecked : " + repoChecked);
				}
			},error : function(){ //신고를 아직 하지 않은 경우
			//리턴되는 데이터가 null일 경우 실패된다.
				repoChecked = false;
				//alert("repoChecked : " + repoChecked);
			}
		});
	///////////////////////////////////////
	//5. 게시물의 댓글정보 불러오기
		
		//게시물의 번호를 JSON방식으로 전달
		let repvo ={};
 		repvo.bidx = ${board.bidx }
 		
 		//추후 작성될 댓글의 HTMl 정보 선언
		let replyHtml ="";
		
		//댓글관련 AJAX 시작
 		$.ajax({
			url : "getReply.do",
			data : JSON.stringify(repvo),
			dataType : "json",
			contentType : "application/json",
			type:"post",
			async: false,
			success : function(data){//해당 게시글에 댓글이 있는 경우 모두 불러옴
				
				if(data.length == 0){ //댓글이 없는 경우
					replyHtml += "<tr>";
					replyHtml += "<td colspan =\"2\" style=\"text-align:center; color:orange; font-weight:bold;\">아직 등록된 댓글이 없어요.....</td>";
					replyHtml += "</tr>";
					$("#replyTable").append(replyHtml);
					replyHtml ="";
				}else{
				
					$.each(data,function(index, item){
					const date = new Date(+this.rregdate + 3240 * 10000).toISOString().split("T")[0];
					let rcontent = this.rcontent;
					let ridx = this.ridx;
					let recomment = this.recomment;
						//댓글에 대한 유저 정보를 불러오기위한 AJAX 시작
						let userNickname ="";
						$.ajax({
							url : "getAjaxMember.do",
							type: "post",
							data: "midx="+this.midx,
							dataType:"json",
							async: false,
							success : function(data){
								userNickname = data.mnickname;
								let midx = data.midx;
								replyHtml += "<tr>";
								//1. 게시글 작성자 본인인 경우
								if(${board.midx } == data.midx){
									if(recomment == 0){ //1-1. 대댓글이 아닌 경우
									
										if(rcontent == "삭제된 댓글입니다."){
											replyHtml += "<td id=\"repNo"+ridx+"\" class='writerWrap'>";
											replyHtml += "<input type=\"checkbox\" id='replyMenuBtn"+ridx+"'>";
											replyHtml += "<label for='replyMenuBtn"+ridx+"' class=\"labelBtn\" onclick=''>삭제된 댓글의 작성자</label></td>";
											replyHtml += "</tr>";	
											replyHtml += "<tr>";                                                                     
											replyHtml += "<td colspan =\"2\" id= \"replyContent\" style=\"text-align:left\">"+rcontent+"</td>";
											replyHtml += "</tr>";
										}else{
											replyHtml += "<td id=\"repNo"+ridx+"\" style=\"color:#ffbb00;\" class=\"writerWrap\">";
											replyHtml += "<input type=\"checkbox\" id='replyMenuBtn"+ridx+"'>";
											replyHtml += "<label for='replyMenuBtn"+ridx+"' class=\"labelBtn\" onclick=''>"+userNickname+"</label>";
											replyHtml += "<ul class='replySubmenu"+ridx+"'>";
											replyHtml += "<li><a href='myPage.do?midx="+midx+"'>작성자의 Mypage</a></li>";
											replyHtml += "<li><a href='javascript:sendMessage("+midx+")'>작성자에게 쪽지 보내기</a></li>";
											replyHtml += "</ul><small>(작성자) [ "+date+" ]</small> </td>";
											replyHtml += "</tr>";	
											replyHtml += "<tr>";
											replyHtml += "<td colspan =\"2\" id= \"replyContent\" style=\"text-align:left\">"+rcontent+"</td>";
											replyHtml += "</tr>";
											replyHtml += "<tr>";
										replyHtml += "<td  colspan=\"2\" id =\"replyControll\"><span id=\"recomment"+ridx+"\"><a href=\"javascript:getRecomment("+ridx+")\" id=a"+ridx+">답글보기/작성 </a>|</span> ";
										replyHtml += "<span id=\"reportReply\"><a href=\"javascript:replyReport("+ridx+")\">신고하기 | </a>";
										//로그인 유저가 동일인물이면 삭제 기능 있음
										if(data.midx == ${user.midx }){
										replyHtml += "<span id=\"deleteReply\"><a href=\"javascript:replyDelete("+ridx+")\">삭제하기</a>";
										replyHtml += "</td>";
										}else{//아니면 그대로 닫음
										replyHtml += "</td>";
										}
										}
										replyHtml += "<tr id=\"recNo"+ridx+"\">";
										replyHtml += "</tr>"; 
										
									}else{ //1-2. 대댓글이 맞는 경우
									}
								//2. 게시글 작성자가 아닌 일반 유저인 경우	
								
								}else{
									if(recomment == 0){ //2-1. 대댓글이 아닌 경우
										
										if(rcontent == "삭제된 댓글입니다."){
											replyHtml += "<td id=\"repNo"+ridx+"\">";
											replyHtml += "<input type=\"checkbox\" id='replyMenuBtn"+ridx+"'>";
											replyHtml += "<label for='replyMenuBtn"+ridx+"' class=\"labelBtn\" onclick=''>삭제된 댓글의 작성자</label></td>";
											replyHtml += "</tr>";	
											replyHtml += "<tr>";
											replyHtml += "<td colspan =\"2\" id= \"replyContent\" style=\"text-align:left\">"+rcontent+"</td>";
											replyHtml += "</tr>";
										}else{
										replyHtml += "<td id=\"repNo"+ridx+"\" class=\"writerWrap\">";
										replyHtml += "<input type=\"checkbox\" id='replyMenuBtn"+ridx+"'>";
										replyHtml += "<label for='replyMenuBtn"+ridx+"' class=\"labelBtn\" onclick=''>"+userNickname+"</label>";
										replyHtml += "<ul class='replySubmenu"+ridx+"'>";
										replyHtml += "<li><a href='myPage.do?midx="+midx+"'>작성자의 Mypage</a></li>";
										replyHtml += "<li><a href='javascript:sendMessage("+midx+")'>작성자에게 쪽지 보내기</a></li>";
										replyHtml += "</ul><small>   [ "+date+" ]</small></td>";
										replyHtml += "</tr>";	
										replyHtml += "<tr>";
										replyHtml += "<td colspan =\"2\" id= \"replyContent\" style=\"text-align:left\">"+rcontent+"</td>";
										replyHtml += "</tr>";
										replyHtml += "<tr>";
										replyHtml += "<td  colspan=\"2\" id =\"replyControll\"><span id=\"recomment"+ridx+"\"><a href=\"javascript:getRecomment("+ridx+")\" id=a"+ridx+">답글보기/작성 </a>|</span>  <span id=\"reportReply\"><a href=\"javascript:replyReport("+ridx+")\">신고하기</a></td>";
										replyHtml += "<tr id=\"recNo"+ridx+"\">";
										replyHtml += "</tr>";
										}
									}else{ //2-2. 대댓글이 맞는 경우
									 //일단 아무것도 불러오지 않겠음.	
									}
									
								}
								
								replyHtml += "</tr>";
								//html Push
								$("#replyTable").append(replyHtml);
								replyHtml ="";
							}, error : function(data){
								alert("ajax 실패");
							}
						});//getMemberAjax 끝
	
					//}조건문 끝
				});
			}
					<!-- 여기까지 반복 끝 -->
			},error : function(data){//해당게시글에 댓글이 없는 경우
				alert("페이지 통신중 에러가 발생하였습니다!");
		    }
		}); 
 		///////////////////////////////////////////////////////////////////
 		//6. 광고정보 불러오기
 		
 		//6-1. 모든 광고리스트를 불러오고 총 몇개의 리스트가 있는지 볼것.
 		let adLength = 0;
 		let adNo = null;
 		
 			$.ajax({
 			url : "getAdvertiseListNo.do",
 			type: "post",
 			dataType:"json",
 			success : function(data){
 				$.each(data,function(index, item){
 					adLength += 1;
 				});
 				
 				//6-2. 길이 내의 난수를 하나 지정하여 광고정보를 가져오도록 할 것
				//등록된 광고의 length내에서의 난수 생성
 				adNo = Math.floor(Math.random() * adLength) + 1;
 				//alert('adNo:' + adNo);
 				
 				$.ajax({
 					url : "getAdvertiseAjax.do",
 					data : "aidx="+adNo,
 					dataType : "json",
 					type:"post",
 					success : function(data){
 						//6-3. 광고정보를 광고판에 띄우도록 할 것 (acontent와 apict만 불러와도 충분하다.)
 						let aContent = data.acontent;
 						let aLink = data.alink;
 						let aPict = data.apicture;
 						///성공한 정보를 광고창 쪽 HTML로 append해준다.
 						adHtml ="<a href=\"javascript:goAdLink('"+aLink+"',"+adNo+")\">";
 						adHtml += "<img src=\"/upload/"+aPict+"\" width = '200px'></a><br>";
 						adHtml += "<span id=\"adText\" style='margin:auto;'>"+aContent+"</span>"; 
 						$("#adSpace").html(adHtml);
 						
 					},error : function(data){ //신고를 아직 하지 않은 경우
 						alert("광고정보 불러오기에 실패하였습니다.");
 					}
 				});
 				
 			}, 
 			error:function(request,status,error){
 				alert("광고불러오기 실패?");
 			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			    }
 			});
 		
		
 		///////////////////////////////////////////////////////////////////
 		//7. 게시글 더보기를 위해 최상단 게시물의 정보를 불러옴(5개까지 띄우도록 함)
 		$.ajax({
 		url : "getBoardListAjax.do",
 		type : "post",
 		dataType : "json",
 		success : function(data){
 			let boardCnt =0;
 			//alert("게시글 더보기 정보 불러오기 성공");
 			$.each(data,function(index, item){
 				
 				let bidx = this.bidx;
 				let btitle = this.btitle;
 				btitle = btitle.substring(0,6) + "....";
 				let bpict1 = this.bpict1;
 				
				//게시물의 등록된 사진이 없을 경우
 				if(bpict1 == null){
					bpict1 = "nonePict.jpg";
				}
				//현재 보는 게시물과 동일할 경우
 				if(bidx == ${board.bidx }){
 					
 				}else{
	 				if(boardCnt < 5){
	 				boardHtml ="";
	 				boardHtml += "<div id=\"boardBox"+bidx+"\" onclick=\"javascript:getBoard("+bidx+")\">";
	 				boardHtml += "<table id=\"boardTable\">";
	 				boardHtml += "<tr>";
	 				boardHtml += "<td id=\"boardImage"+bidx+"\"><img src=\"/upload/"+bpict1+"\" width=\"150px;\" height=\"150px;\"></td>";
	 				boardHtml += "</tr>";
	 				boardHtml += "<tr>";
	 				boardHtml += "<td id=\"boardTitle\">"+btitle+"</p>";
	 				boardHtml += "</tr>";
	 				boardHtml += "</table>";
	 				boardHtml += "</div>";
	 				$("#footSpace").append(boardHtml);
	 				}
	 				boardCnt++;
	 				//alert("boardCnt" + boardCnt);
 				}
 			});
 			
 		},error : function(data){
 			alert("게시글 더보기 정보 불러오기 실패");
 		}
 		});
 		
 		
 		///////////////////////////////////////////////////////////////////
 		//게시물의 작성자가 페이지를 확인하면 ALARM 정보 초기화
 		
		///////////////////////////////////////////////////////////////////
		//pict객체 DOM 컨트롤
		let pict1 ="<img src =\"/upload/${bpict1 }\">";
		let pict2 ="<img src =\"/upload/${bpict2 }\">";
		let pict3 ="<img src =\"/upload/${bpict3 }\">";
		
		//시작시에는 pict1 출력
		$("#mainPict").html("<img src =\"/upload/${bpict1 }\">")
		
		$("#pict1").click(function(){ //1번째 사진 누를 경우
			$("#mainPict").html(pict1);
		});
		$("#pict2").click(function(){ //2번째 사진 누를 경우
			$("#mainPict").html(pict2);
		});
		$("#pict3").click(function(){ //3번째 사진 누를 경우
			$("#mainPict").html(pict3);
		});	
		///////////////////////////////////////////////////////////////
		//좋아요를 누를경우의 DOM컨트롤
		let lvo = {};
		lvo.bidx = ${board.bidx };
		lvo.midx = ${user.midx };
		lvo.boardcate = ${board.boardcate };
		
		$("#likeControll").click(function(){

			//alert("좋아요 버튼 연결");
			//alert("likeChecked : " + likeChecked);
			//alert("JSON.stringify(lvo) : " + JSON.stringify(lvo));
			//아직 안누른 상태일 경우 (좋아요 설정)
			if(likeChecked==false){
			$.ajax({
				url : "insertLike.do",
				type: "post",
				data: JSON.stringify(lvo),
				contentType:"application/json",
				success : function(){
					//alert("ajax연결");
					history.go(0);
				}, 
				error : function(){
					 alert("페이지통신 중 오류가 발생하였습니다!");
				    }
				});
			}
			else{
			//이미 눌려있는 경우 (좋아요 해제)
			$.ajax({
				url : "deleteLike.do",
				type: "post",
				data: JSON.stringify(lvo),
				contentType:"application/json",
				success : function(){
					//alert("ajax연결");
					history.go(0);
				}, 
				error : function(){
				    alert("페이지통신 중 오류가 발생하였습니다!");
				    }
				});
			}
		});
		///////////////////////////////////////////////////////////////////////
		$("#favControll").click(function(){
			//alert("즐겨찾기 버튼 연결");
			//아직 안누른 상태일 경우 (좋아요 설정)
			if(favChecked==false){
			$.ajax({
				url : "insertFavorite.do",
				type: "post",
				data: JSON.stringify(fvo),
				//dataType:"json",
				contentType:"application/json",
				success : function(){
					//alert("ajax연결");
					history.go(0);
				}, 
				error : function(){
					 alert("페이지통신 중 오류가 발생하였습니다!");
				    }
				});
			}
			else{
			//이미 눌려있는 경우 (즐겨찾기 해제)
			$.ajax({
				url : "deleteFavorite.do",
				type: "post",
				data: JSON.stringify(fvo),
				contentType:"application/json",
				//dataType:"json",
				success : function(){
					//alert("ajax연결");
					history.go(0);
				}, 
				error : function(){
				    alert("페이지통신 중 오류가 발생하였습니다!");
				    }
				});
			}
		});
		//////////////////////////////////////////////////////////////////////
		//신고하기 버튼을 클릭할시
		$("#reportControll").click(function(){
			//alert("신고하기 버튼 연결");
			if(repoChecked){
				alert("이미 신고하셨습니다!");
			}else{
				 $("#reportSpace").css("display","block");
			}
		});
		
		$("#cancelBtn").click(function(){ //취소하기 버튼을 클릭할 시
			$("#reportSpace").css("display","none");
		});
		
		//신고완료 버튼을 클릭할 시
		$("#submitBtn").click(function(){
		
			//신고사유 rvo에 삽입
			rvoBoard.rcontent = $("#rcontent").val();
			
			if($("#rcontent").val().trim() == ""){
				alert("신고에 대한 사유는 반드시 기재해야합니다!!");
				$("#rcontent").focus();
				return;
			}
			
			$.ajax({
				url : "insertReport.do",
				type: "post",
				data: JSON.stringify(rvoBoard),
				//dataType:"json", //리턴값이 없으니 dataType을 쓰면 안됨.
				contentType:"application/json",
				success : function(){
					alert("신고 접수가 완료되었습니다!");
					 $("#reportSpace").css("display","none");
					 history.go(0);
				}, 
				error : function(){
					 alert("페이지통신 중 오류가 발생하였습니다!");
				    }
				}); 
		});
		/////////////////////////////////////////////////////////////////
		//댓글 입력을 클릭할 시!
		$("#replySubmit").click(function(){
			if(${user.midx } == 0){
				alert("로그인이 필요한 서비스입니다.");
				return;
			}
			if($("#replyVal").val().trim() == ""){
				alert("댓글의 내용을 꼭 입력해주세요!");
				$("#replyVal").focus();
				return;
			}
			let reply={};
			reply.bidx = ${board.bidx };
			reply.midx = ${user.midx };
			reply.rcontent = $("#replyVal").val();
			//alert("reply : " + JSON.stringify(reply));
			
			$.ajax({
				url : "insertReply.do",
				type: "post",
				data: JSON.stringify(reply),
				//dataType:"json", 
				contentType:"application/json",
				success : function(){
					alert("댓글입력이 완료되었습니다!");
					//////// -> 댓글이 입력되면 Alarm 하나  상승
					 $.ajax({
					url : "updateBoardAlarm.do",
					type: "post",
					data: "bidx="+${board.bidx },
					//dataType:"json", 
					//contentType:"application/json",
					success : function(data){
						//alert("alarm갯수가 올라갔음!");
					}, 
					error : function(data){
						//alert("알람 실패");
					    }
					});
					//////////////////////////////////////
					history.go(0);
				}, 
				error : function(){
					 alert("페이지통신 중 오류가 발생하였습니다!");
				    }
				}); 
			
		});
	//////////////////////////////////////////////////////
	///게시판 더보기 클릭시
	$("#moreBoard").click(function(){
		$("#footSpace").css("display","block");
		$("#closebox").css("display","block");
	});
	
	$("#closebox").click(function(){
		$("#footSpace").css("display","none");
	});
	
	/////////////////////////////////////////////////////
	//게시글 작성자가 글을 확인 했을때 알람 초기화
	if(${board.midx == user.midx}){
		$.ajax({
			url : "resetBoardAlarm.do",
			type: "post",
			data: "bidx="+${board.bidx },
			//dataType:"json", 
			//contentType:"application/json",
			success : function(data){
				//alert("알람 리셋 성공");
			},	
			error : function(data){
				//alert("알람 리셋 실패");
			}
		});
	}
}); //Jquery 종료
	

</script>

</head>

	
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<%@ include file="header.jsp" %>
		</div>
		<style>
	
table td{
padding : 10px 0px ;
border : none; 
text-align: center;
}

table{
border-collapse: inherit;
border-top:none;
border-bottom:none;
}

li>a{
color:grey;
}
	.hamburger-wrap {  /* 메뉴부분을 감싸고 있는 div */
		position: absolute;
		padding-right: 10px;
		padding-left: 10px;
		border: 1px solid white;
	}
	
	.hamburger>span {
		display: block;
		width: 40px;
		height: 5px;
		margin-top: 10px;
		margin-bottom: 10px;
		background-color: white;
		transition: transform 0.5s, opacity 0.5s;
	}
	.hamburger-wrap.active span:nth-child(1) {
		transform: translateY(15px) rotate(45deg);
	}
	.hamburger-wrap.active span:nth-child(2) {
		opacity:0;
	}
	.hamburger-wrap.active span:nth-child(3) {
		transform:translateY(-15px) rotate(-45deg);
	}
	
	

#container_Box {
	margin: 0 auto;
	width: 75%;
	display: block;
}

.titleSpace {
	width: 90%;
	padding: 0px 30px;
	display: inline-block;
}

#titleContainer {
	float: left;
}

#detailNickname {
	float: right;
}

#detailNickname a:hover {
	text-decoration: underline;
}

.pictureSpace {
	text-align: center;
	width: 400px;
	height: 550px;
	float: left;
}

#pictureTable {
	margin: 0 auto;
	border: 1px solid grey;
	border-radius: 10px;
	padding: 2px;
	/* height: 720px; */
}

#mainPict {
text-align:center;
	height: 300px;
	overflow: hidden;
	padding : 9px;
	border-bottom: none;
}

#mainPict img {
	width: 290px;
	height : 290px;
}

#pict1 {
	text-align : center;
	padding : 5px;
	margin : auto;
	opacity: 70%;
	transition: 0.5s;
	overflow: hidden;
}

#pict1:hover {
	opacity: 100%;
	cursor: pointer;
}

#pict1 img, #pict2 img, #pict3 img {
	width: 100px;
	
}

#pict1, #pict2, #pict3 {
	border-top: none;
	
}

#pict2 {
	text-align : center;
	padding : 5px;
	margin : auto;
	opacity: 70%;
	transition: 0.5s;
	overflow: hidden;
}

#pict2:hover {
	opacity: 100%;
	cursor: pointer;
}

#pict3 {
	text-align : center;
	padding : 5px;
	margin : auto;
	opacity: 70%;
	transition: 0.5s;
	overflow: hidden;
}

#pict3:hover {
	opacity: 100%;
	cursor: pointer;
}

a {
	text-decoration: none;
	color: grey;
}

#reportSpace {
	margin: auto;
	text-align: center;
	border: 1px solid #ffbb00;
	display: none;
	position: absolute;
	top: 80%;
	left: 60%;
	background-color: white;
	border-radius: 15px;
	padding: 10px;
}

#reportTable {
	margin: 0 auto;
}

h2 {
	margin : auto;
	color: darkgrey;
	font-size: 1.4em;
}

.reportBtn {
	margin-left : 10px;
	border-radius: 5px;
	width: 100px;
	height: 40px;
	font-size: 15px;
	font-weight: bold;
}

#likeControll, #favControll, #reportControll {
	cursor: pointer;
}

.reportBtn:hover {
	background-color: #ffbb00;
	color: white;
	transition: 0.5s;
	opacity: 100%;
}

#recommentSubmit {
	margin-left : 10px;
	border: none;
	border-radius: 5px;
	width: 70px;
	height: 20px;
	font-size: 8px;
	font-weight: bold;
}

input[id^=recommentVal] {
	width: 300px;
	padding: 5px 0px;
	font-size: 6px;
	border: 1px solid grey;
	border-radius: 5px;
}

#recommentSubmit:hover {
	background-color: darkred;
	color: white;
	transition: 0.5s;
}

.contentTextSpace {
	width: 40%;
	float: left;
	margin-left: 5px;
	padding: 10px
}

#textSpace {
	width : 100%;
	padding: 20px;
	height: 450px;
	font-weight: bold;
}

.moreConfig {
	font-weight: bold;
	float: right;
}

.configBoard {
	border : 1px solid lightgrey;
	border-radius : 10px;
	padding : 15px;
	margin-top : 20px;
	margin-bottom : 20px;
	margin-left: 40px;
	font-weight: bold;
	color: grey;
	float: right;
}

.midSpace {
	width: 100%;
	margin: 0 auto;
	float: right;
	text-align: center;
	font-weight: bold;
}

#adSpace {
	width: 200px;
	height: 450px;
	position : absolute;
	top : 70%;
	right : 5%;
	font-weight: bold;
	text-align: center;
}

#replyTable {
	margin: 40px auto;
	padding: 10px;
	border: 0.1px solid grey;
	background-color: white;
	border-radius: 10px;
	width: 700px;
}

#reportReply, #recomment, #replyControll {
	font-size: 0.7em;
	color: grey;
	text-align: right;
}

.writerWrap {
	border-top: 1px solid black;
}

#replyControll {
	/* border-bottom: 1px solid lightgrey; */
	
}

td[id^=repNo], #replyReg {
	color: grey;
	font-weight: bold;
	font-size: 0.8em;
	padding: 5px;
	text-align: left;
}

#replyTable tr:nth-child(3n) {
	background-color: white;
}

#replyVal {
	padding: 5px;
	width: 500px;
	height: 35px;
	font-family: sans-serif;
	/* border: 2px solid grey; */
	border-radius: 10px;
}

#replyContent {
	font-size: 0.8em;
	padding: 5px 20px;
}

#moreBoard{
	padding : 10px; 0px;
	float:left;
	width : 100%;
	text-align: center;
	font-weight: bold;
	font-size:1.2em;
	color : darkgrey;
	cursor: pointer;
	border-top: 1px solid darkgrey;
	border-bottom : 1.5px solid darkgrey;
	margin : 30px auto;
}

#footSpace{
	margin : 0 auto;
	float:left;
	width : 100%;
	display:none;
}

#footSpace img {
width : 120px;
height : 120px;
}


#footSpace table {
width : 100%;
  border-spacing: 15px;
  border-collapse: separate;
  	color : black;
}


#closebox {
	padding : 0px;
	text-align: center;
	color : darkgrey;
	font-size : 0.8em;
	cursor: pointer;
}
#closebox p:hover, #moreBoard p:hover{
	text-decoration: underline;
}

#stickTool{
	text-align : center;
	position : fixed;
	top : 95%;
	left : 75%;
	width : 250px;
	z-index: 8;
}

div[id^=boardBox] {
	width:20%;
	float:left;
	text-align : center;
	margin-left : auto;
	cursor: pointer;
	font-weight: bold;
	color : darkgrey;
	opacity: 60%;
}

div[id^=boardBox]:hover {
	background-color: ghostwhite;
	transition : 0.5s;
	opacity: 100%;
}

#boardTable{
	width : 95%;
	margin : auto;
}

#stickTool{
	text-align : center;
	position : fixed;
	top : 80%;
	right : 0px;
}

#writeBtn, #backBtn{
	margin-left : 20px;
	float:left;
	width : 90px;
	height : 90px;
	border-radius : 50%;
	border : none;
	font-weight : bold;
	font-size: 1.1em;
}


#writeBtn:hover {
	width : 90px;
	height : 90px;
	background-color: #ffbb00;
	color : white;
	transition : 0.5s;
	opacity : 100%
}

#backBtn:hover {
	width : 90px;
	height : 90px;
	background-color: #ffbb00;
	color : white;
	transition : 0.5s;
	opacity : 100%
}

#titleSpace, #titleinputSpace,#imageInputSpace,#contentInputSpace,#bottomSpace{
	width : 100%;
	float:left;
	text-align: center;
}

#titleSpace h1{
	color : darkgrey;
	font-weight:bold;
}

#imageInputSpace{
	padding : 20px;
	
}

#titleInput select,#titleInput input {
	height : 50px;
	border : 1px solid darkgrey;
	border-radius: 10px;
	font-weight : bold;
	font-size : 1.2em;
} 


#titleInput input {
	width : 400px;
}
#subTitleSpace{
	font-size: 1.2em;
	font-weight: bold;
}

#imageUploadTable{
	width : 100%;
	margin : 0 auto;
	text-align:center;
}

div[id^=uploadForm]>input {
	font-size : 0.8em;
	background-color: lightyellow;
	font-weight : bold;
	margin : auto;
}

div[id^=uploadForm] {
	text-align:center;
	margin: auto;
	display:none;
    width : 600px;
    height : 200px;
    border : 5px solid black;
    border-radius : 5px;
    font-size: 0.8em;
    font-weight : bold;
    background-color: white;
    border-radius: 15px;
    padding: 5px;
}


#imageUploadTable div[id^=uploadBpict]{
	margin : auto;
	width : 150px;
	height : 150px;
	border : 5px solid lightgrey;
	opacity:80%;
	border-radius: 10px;
	background-color: 	#FFFFE0;
	color : lightgrey;
	font-size : 1.5em;
	font-weight : bold;
	overflow: hidden;
}


#uploadBpict2, #uploadBpict3 {
	display: none;
}


#imageUploadTable div[id^=uploadBpict]:hover {
	opacity:100%;
	border : 5px solid black;
	color : black;
	cursor:pointer;
}

#delPict{
	margin-top:20px;
	border: none;
	border-radius: 5px;
	width: 200px;
	height: 50px;
	font-size: 20px;
	font-weight: bold;
}

#delPict:hover{
	background-color: darkgrey;
	color:white;
	transition : 0.5s;
}

/* 작성자의 마이페이지 및 쪽지보내기 탭 컨트롤 */
li {
    padding: 5px;
    list-style-type: none;
}

.userSubmenu a {
    color:grey;
}

.userSubmenu a:hover {
    color:lightgrey;
}


input[id^=replyMenuBtn] ,input[id^=userMenuBtn], input[id^=recommentMenuBtn]{
   position: fixed;
    left: -9999px;
}

#nicknameText:hover{
text-decoration: underline;
}

label {
    cursor: pointer;
}


.userSubmenu {
    display:none;
    position : absolute;
    width : 200px;
    border : 1px solid darkgrey;
    border-radius : 5px;
    font-size: 0.8em;
    font-weight : bold;
    background-color: white;
}

#userMenuBtn:checked ~ .userSubmenu {
    display: block;
}


ul[class^=replySubmenu] {
    display:none;
    position : absolute;
    width : 200px;
    border : 1px solid darkgrey;
    border-radius : 5px;
    font-size: 0.8em;
    font-weight : bold;
    background-color: white;
}


input[id^=replyMenuBtn]:checked ~ ul[class^=replySubmenu] {
    display: block;
}


ul[class^=recommentSubmenu] {
    display:none;
    position : absolute;
    width : 200px;
    border : 1px solid darkgrey;
    border-radius : 5px;
    font-size: 0.8em;
    font-weight : bold;
    background-color: white;
}


input[id^=recommentMenuBtn]:checked ~ ul[class^=recommentSubmenu] {
    display: block;
}


p[id^=popClose]:hover {
	text-decoration: underline;
	cursor: pointer;
}


#registerTable{
	display : none;
	position:absolute;
	top : 25%;
	left : 33%;
	border : 2px solid orange;
	text-align: center;
	background-color: white;
	padding : 20px 50px;
	border-radius: 20px;
}

#registerTable td {
	padding : 10px;
	font-weight: bold;
	color : darkgrey;
}

#registerTable td input {
	padding : 5px;
	border : 2px solid darkgrey;
	border-radius : 5px;
	font-weight: bold;
	color : orange;
}

#registerTable td img{
	border : 3px solid darkgrey;
	border-radius : 5px;
}

#submitBtn {
	border: none;
	margin : 0 auto;
	border-radius: 5px;
	width: 100px;
	height: 40px;
	font-size: 15px;
	font-weight: bold;
}

#submitBtn:hover {
	background-color: #ffbb00;
	color:white;
	transition : 0.5s;
	cursor: pointer;
	opacity: 100%;
}

h4, h1,h2, span, button{
font-family: Hi Melody, "Malgun Gothic", serif;
font-weight: bold;
}

input, td, small {
font-family: 'Gowun Dodum', "Malgun Gothic", serif;
font-weight: bold;
}

</style>
		</header>
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main">
				<!--============================================================================  -->				
				<!--============================================================================  -->				
				<!--============================================================================  -->				
				<div id="container_Box">
		<!-- 타이틀 단 시작 -->
		<div class="titleSpace">
			<div id="titleContainer">
				<h4 style="color : #ffba00" >&lt;&lt;&nbsp;${boardCate }&nbsp;&nbsp;&gt;&gt;</h4>
				<h1>${board.btitle }</h1>
			</div>
			<p id="detailNickname">
				<!-- 닉네임과 작성자 사진이 오는 자리 -->
			</p>

		</div>
		<!-- 타이틀 단 종료 -->
		<div class="contentSpace">

			<div class="pictureSpace">
				<table id="pictureTable">
					<tr>
						<td colspan="3" id="mainPict">
							<!-- 클릭된 사진이 보일 자리 -->
						</td>
					</tr>
					<tr>
						<td id="pict1"><img src="/upload/${bpict1 }"></td>
						<td id="pict2"><img src="/upload/${bpict2 }"></td>
						<td id="pict3"><img src="/upload/${bpict3 }"></td>
					</tr>
				</table>
			</div>

			<div class="contentTextSpace">

				<div id="textSpace">
					<p id="userInfo">
					</p>
					<p>
						<b><small>작성일 : [${board.bregdate }]</small></b>
					</p>
					<hr>
					<div style="color : black; font-size:0.9em;">${board.btext }</div>
				</div>

					<div class="contentBotSpace">

					
					
					<div class="moreConfig">
						<span style="color: grey;" id="likeControll"> <img
							src="./images/like1.jpg" width="15px;">좋아요</span><span
							id="likeCnt"></span> <span style="color: grey;" id="favControll">
							<img src="./images/favorite1.jpg" width="18px;">
						즐겨찾기</span><span style="color: red;" id="reportControll"> <img
							src="./images/siren.jpg" width="18px;">신고하기
						</span>
					</div>
					
						<c:if test="${user.midx == board.midx }">
					<div class="configBoard">
						<span><a href="javascript:updateBoard(${board.bidx })"><img src="./images/modify.jpg"
								width="15px">수정</a> | <a
							href="javascript:deleteBoard(${board.bidx })"><img
								src="./images/delete.jpg" width="15px">삭제</a></span>
					</div>
					</c:if>
					
				</div>
			
						
						
				<div id="reportSpace">
					<form id="reportForm" method="post">
						<input type="hidden" name="rfrom" value="${user.midx }"> <input
							type="hidden" name="rto" value="${board.midx }"> <input
							type="hidden" name="rtype" value="1"> <input
							type="hidden" name="rnum" value="${board.bidx }">

						<table id="reportTable">
							<tr>
								<td colspan="2" style="color:darkgrey;"><h2 style="text-align: center;">신고하기</h2></td>
							</tr>
							<tr>
								<td colspan="2"><textarea  style="margin: 0 auto;" id="rcontent" cols="30" rows="10"
										placeholder="해당 게시물의 신고사유를 기재해주세요. 허위 신고시 제재될 수 있습니다!"></textarea></td>
							</tr>
							<tr>
								<td style="text-align: center;"><button type="button" id="submitBtn" class="reportBtn">신고완료</button></td>
								<td style="text-align: center;"><button type="button" id="cancelBtn" class="reportBtn">신고취소</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div id="adSpace"></div>
		</div>

		<div class="midSpace">
			<div id="inputReplySpace">
				<p>
					<input type="text" id="replyVal"
						placeholder="타인을 상처입히지 않는 따뜻한 댓글을 남겨주세요!">
					<button type="button" id="replySubmit" class="reportBtn">댓글입력</button>
				</p>
			</div>
			
			<table id="replyTable">
				<!-- 댓글 들어갈 곳  -->
			</table>
			
		</div>
		<div id="moreBoard">
			<p>최신게시글 더보기</p>
		</div>
		<div id="footSpace">
			<div id="closebox">
				<p>닫기</p>
			</div>

			<!-- 최신게시글 더보기 자리 -->

		</div>

		<div id="stickTool">
			<button type="button" id="writeBtn"
				onclick="tryWrite();">글쓰기</button>
			<button type="button" id="backBtn"
				onclick="javascript:history.back()">뒤로</button>
		</div>
	</div>
				
				
				<!--============================================================================  -->				
				<!--============================================================================  -->				
				<!--============================================================================  -->				
				<!--============================================================================  -->				



				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	<!-- .container -->
	<%@ include file="footer.jsp" %>
</div>

	
<!-- #page -->
<script src='./resources/js/jquery.js'></script>
<script src='./resources/js/plugins.js'></script>
<script src='./resources/js/scripts.js'></script>
<script src='./resources/js/masonry.pkgd.min.js'></script>
</body>
</html>
