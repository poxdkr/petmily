<%@page import="com.project.petmily.member.MemberVO"%>
<%@page import="com.project.petmily.member.impl.MemberServiceImpl"%>
<%@page import="com.project.petmily.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardVO board = (BoardVO)request.getAttribute("board");
//말머리 찾기
String boardCate = "";
if(board.getBoardcate() == 1){
	boardCate = "고양이";
}else if(board.getBoardcate() == 2){
	boardCate = "강아지";
}else if(board.getBoardcate() == 3){
	boardCate = "댕냥노하우";
}else {
	boardCate = "자유주제";
}
pageContext.setAttribute("boardCate", boardCate);

//사진 있는지 여부 확인
if(board.getBpict1() != null){
	String bpict1 = board.getBpict1();
	String bpict2 = board.getBpict2();
	String bpict3 = board.getBpict3();
	pageContext.setAttribute("bpict1", bpict1);
	pageContext.setAttribute("bpict2", bpict2);
	pageContext.setAttribute("bpict3", bpict3);
}else{
	pageContext.setAttribute("bpict1", "nonePict.jpg");
	pageContext.setAttribute("bpict2", "nonePict.jpg");
	pageContext.setAttribute("bpict3", "nonePict.jpg");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMILY! : 이야기 상세보기</title>
<link rel ="stylesheet" href="./style.css" type="text/css">
<script src = "http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
/////////////////////////////////////////////////
//해당게시물로 넘어가기 함수
function getBoard(bidx){
	//alert("연결됨. 게시물의 bidx : " + bidx);
	location.href="getBoard.do?bidx="+bidx;
}

/////////////////////////////////////////////////
//답글쓰기 함수
function insertRecomment(ridx){
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
		recommentHtml += "<td id=\"repNo"+ridx+"\"><a href=\"javascript:closeRecomment("+ridx+")\"><small>답글 닫기</small></a></td>";
		recommentHtml += "</tr>"
		recommentHtml += "<tr>";
		recommentHtml += "<td id=\"inputRecommentSpace\">";
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
					recommentHtml += "<td id=\"repNo"+ridx+"\"><small>현재 등록된 답글이 없네요.....</td>";
					recommentHtml += "</tr>"
					$("#recNo"+ridx).append (recommentHtml);
					
				}else{	
				
					//alert("data : " + JSON.stringify(data));
					//불러온 대댓글 리스트 모두 불러와서 each 돌림
					$.each(data,function(index, item){
						//날짜 처리 
						const date = new Date(+this.rregdate + 3240 * 10000).toISOString().split("T")[0];
						//불러온 리스트 each로 getMember 해야됨.
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
								recommentHtml += "<td id=\"repNo"+ridx+"\"><small>ㄴ> (답글)  "+mnickname+"  [ "+date+" ]</small></td>";
								recommentHtml += "</tr>"
								recommentHtml += "<tr>";
								recommentHtml += "<td id=\"repNo"+ridx+"\" style=\"color:black; padding : 0px 10px; \"><small>&nbsp;&nbsp;&nbsp;&nbsp;(답글내용)  "+rcontent+" </small></td>";
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
			let detailNickname ="<a href=\"#\"><img width='25px' src=\"./images/none.jpeg\"><b><small>"+mnickname+"</small></b></a>&nbsp;" 
								+ "<a href=\"#\"><img width='12px' src=\"./images/directMessage.jpg\" alt='작성자에게 메시지 보내기!'></a>";
				
				$("#detailNickname").html(detailNickname);
			let mphoto = data.mphoto;
			
			
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
			$("#likeControll").html("<img src=\"./images/like2.jpg\" width =\"15px;\">");
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
					$("#favControll").html("<img src=\"./images/favorite2.jpg\" width =\"18px;\">");
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
								replyHtml += "<tr>";
								//1. 게시글 작성자 본인인 경우
								if(${board.midx } == data.midx){
									if(recomment == 0){ //1-1. 대댓글이 아닌 경우
										replyHtml += "<td id=\"repNo"+ridx+"\" style=\"color:orange;\" class=\"writerWrap\">"+userNickname+" <small>(작성자) [ "+date+" ]</small> </td>";
										replyHtml += "</tr>";	
										replyHtml += "<tr>";
										replyHtml += "<td colspan =\"2\" id= \"replyContent\" style=\"text-align:left\">"+rcontent+"</td>";
										replyHtml += "</tr>";
										replyHtml += "<tr>";
										console.log("rcontent : " + rcontent);
										if(rcontent == "삭제된 댓글입니다."){
																					
										}else{
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
										replyHtml += "<td id=\"repNo"+ridx+"\" class=\"writerWrap\">"+userNickname+" <small>[ "+date+" ]</small></td>";
										replyHtml += "</tr>";	
										replyHtml += "<tr>";
										replyHtml += "<td colspan =\"2\" id= \"replyContent\" style=\"text-align:left\">"+rcontent+"</td>";
										replyHtml += "</tr>";
										replyHtml += "<tr>";
										replyHtml += "<td  colspan=\"2\" id =\"replyControll\"><span id=\"recomment"+ridx+"\"><a href=\"javascript:getRecomment("+ridx+")\" id=a"+ridx+">답글보기/작성 </a>|</span>  <span id=\"reportReply\"><a href=\"javascript:replyReport("+ridx+")\">신고하기</a></td>";
										replyHtml += "<tr id=\"recNo"+ridx+"\">";
										replyHtml += "</tr>";
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
 			url : "getAdvertiseList.do",
 			type: "post",
 			dataType:"json",
 			success : function(data){
 				$.each(data,function(index, item){
 					adLength += 1;
 				});
 				
 				//6-2. 길이 내의 난수를 하나 지정하여 광고정보를 가져오도록 할 것
				//등록된 광고의 length내에서의 난수 생성
 				adNo = Math.floor(Math.random() * adLength) + 1;
 				
 				$.ajax({
 					url : "getAdvertise.do",
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
 						adHtml += "<img src=\"./images/"+aPict+"\" width = 149px></a><br>";
 						adHtml += "<span id=\"adText\">"+aContent+"</span>"; 
 						$("#adSpace").html(adHtml);
 						
 					},error : function(data){ //신고를 아직 하지 않은 경우
 						alert("광고정보 불러오기에 실패하였습니다.");
 					}
 				});
 				
 			}, 
 			error:function(request,status,error){
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
 			//alert("게시글 더보기 정보 불러오기 성공");
 			$.each(data,function(index, item){
 				
 				let bidx = this.bidx;
 				let btitle = this.btitle;
 				let bpict1 = this.bpict1;
				//게시물의 등록된 사진이 없을 경우
 				if(bpict1 == null){
					bpict1 = "nonePict.jpg";
				}
				//현재 보는 게시물과 동일할 경우
 				if(bidx == ${board.bidx }){
 					
 				}else{
 				boardHtml ="";
 				boardHtml += "<div id=\"boardBox"+bidx+"\" onclick=\"javascript:getBoard("+bidx+")\">";
 				boardHtml += "<table id=\"boardTable\">";
 				boardHtml += "<tr>";
 				boardHtml += "<td id=\"boardImage"+bidx+"\"><img src=\"./images/"+bpict1+"\" width=\"150px;\" height=\"150px;\"></td>";
 				boardHtml += "</tr>";
 				boardHtml += "<tr>";
 				boardHtml += "<td id=\"boardTitle\">"+btitle+"</p>";
 				boardHtml += "</tr>";
 				boardHtml += "</table>";
 				boardHtml += "</div>";
 				$("#footSpace").append(boardHtml);
 				}
 			});
 			
 		},error : function(data){
 			alert("게시글 더보기 정보 불러오기 실패");
 		}
 		});
 		
 		
		///////////////////////////////////////////////////////////////////
		//pict객체 DOM 컨트롤
		let pict1 ="<img src =\"./images/${bpict1 }\">";
		let pict2 ="<img src =\"./images/${bpict2 }\">";
		let pict3 ="<img src =\"./images/${bpict3 }\">";
		
		//시작시에는 pict1 출력
		$("#mainPict").html("<img src =\"./images/${bpict1 }\">")
		
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
	
}); //Jquery 종료
	

</script>

</head>
	<body>
	<!-- 컨테이너 시작 -->
	<div id = "container">
		<!-- 타이틀 단 시작 -->
		<div class = "titleSpace">
			<div id="titleContainer">
				<h4 style="color:green;">&lt;&lt;${boardCate }&gt;&gt;</h4>
				<h1>${board.btitle }</h1>
			</div>
			<p id ="detailNickname"><!-- 닉네임과 작성자 사진이 오는 자리 --></p>
			
		</div>
		<hr>
		<!-- 타이틀 단 종료 -->
		<div class="contentSpace">
			
			<div class="pictureSpace">
				<table id="pictureTable">
					<tr>
						<td colspan = "3" id = "mainPict"><!-- 클릭된 사진이 보일 자리 --></td>
					</tr>
					<tr>
						<td id = "pict1"><img src ="./images/${bpict1 }"></td>
						<td id = "pict2"><img src ="./images/${bpict2 }"></td>
						<td id = "pict3"><img src ="./images/${bpict3 }"></td>
					</tr>
				</table>
			</div>
			
			<div class="contentTextSpace">
			
				<div id="textSpace">
					<p><b><small>작성일 : [${board.bregdate }]</small></b></p>
					<hr>
					<p>${board.btext }</p>
				</div>
				<hr>
				<div class="contentBotSpace">
					<div class="configBoard">
						<span>
						<a href="#"><img src="./images/modify.jpg" width="15px"> 수정</a> |
						<a href="#"><img src="./images/delete.jpg" width="15px">삭제</a></span>
					</div>

					<div class="moreConfig">
						<span style="color:grey;" id="likeControll"> 
						<img src="./images/like1.jpg" width ="15px;"></span>좋아요<span id="likeCnt"></span>
						
						<span style="color:grey;" id="favControll">
						<img src="./images/favorite1.jpg" width ="18px;"></span>즐겨찾기
						<span style="color:red;"  id="reportControll">
						<img src="./images/siren.jpg" width ="18px;">신고하기
						</span> 
					</div>
				</div>
				
				<div id="reportSpace">
						<form id="reportForm" method="post">	
						<input type="hidden" name="rfrom" value="${user.midx }">		
						<input type="hidden" name="rto" value="${board.midx }">		
						<input type="hidden" name="rtype" value="1">		
						<input type="hidden" name="rnum" value="${board.bidx }">
							
							<table id="reportTable">
								<tr>
									<td colspan="2"><h2>신고하기</h2></td>
								</tr>
								<tr>
									<td colspan="2"><textarea id="rcontent" cols="30" rows="20" placeholder="해당 게시물의 신고사유를 기재해주세요. 허위 신고시 제재될 수 있습니다!"></textarea></td>
								</tr>
								<tr>
									<td><button type="button" id="submitBtn" class="reportBtn">신고완료</button></td>
									<td><button type="button" id="cancelBtn" class="reportBtn">신고취소</button></td>
								</tr>
							</table>
						</form>
				</div>
			</div>
		<div id="adSpace">				
		</div>
		</div>

		<div class="midSpace">
				<div id="inputReplySpace">
					<p>
					<input type="text" id="replyVal" placeholder="타인을 상처입히지 않는 따뜻한 댓글을 남겨주세요!">
					<button type = "button" id="replySubmit" class="reportBtn">댓글입력</button>
					</p>  
				</div>
				<hr>
				<table id ="replyTable">
				<!-- 댓글 들어갈 곳  -->
				</table>
				<hr>
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
		<button type="button" id="writeBtn">글쓰기</button>
		<button type="button" id="backBtn">뒤로</button>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</body>
	
</html>