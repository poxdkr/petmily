<%@page import="com.project.petmily.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	MemberVO mvo = (MemberVO)session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>노하우 게시글 상세보기 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
</head>
<style>
	#type {
		font-weight: bold;
		color: #67E2A6;
	}
	.wpcmsdev-accordion {
		border: none;
	}
	#pbtn { /* 수정 삭제 목록 부분*/
		position: relative;
		left: 80%;
		margin-top: 20px;
	}
	#commentTable {  /* 댓글 테이블*/
		position: relative;
		width: 900px;
		left: 50%;
		transform: translate(-50%);
	}
	#commentDiv { /* 댓글 입력창을 감싸고 있는 div */
		position: relative;
		left: 170px;
		margin-bottom: 20px;
	}
	#commentInput {  /* 댓글 입력창 */
		width: 400px;
		border-radius: 5px;
		height: 35px;
	}
	#commentBtn {  /* 댓글 입력 버튼 */
		border-radius: 5px;
		background-color: #ffbb00;
		border: none;
	}
	#commentTable tr{
		border: none;
	}
	#knowContent {  /* 노하우 게시판 내용을 감싸고 있는 div */
		border: 1px solid #ffbb00;
		border-radius: 7px;
		height: 500px;
		padding: 10px;
		overflow: auto;
	}
	#optionDiv {  /* 좋아요 즐겨찾기 신고 버튼 감싸고 있는 div */
		margin-top: 20px;
		text-align: right;
		color: black;
	}
	#optionDiv img {  /* 이미지 */
		width: 20px;
	}
	#optionDiv img:hover {
		cursor: pointer;
	}
	#likeCnt {
		margin-right: 50px;
	}
	#favBtn {
		margin-right: 50px;
	}
	#reportSpace {
	margin: auto;
	text-align: center;
	border: 1px solid orange;
	display: none;
	position: absolute;
	top: 500px;
	left: 900px;
	background-color: white;
	border-radius: 15px;
	padding: 10px;
	z-index: 999;
	}
	#bregdate {
		position: relative;
		color: black;
		text-align: right;
		font-weight: normal;
	}
	.hiddenBtn {  /* 수정, 삭제 버튼 */
		visibility: hidden;
	}
	.x:hover {
		cursor: pointer;
	}
	.x {
		color: red;
		font-weight: bold;
	}
	#writerDiv {
		position:relative;
		text-align: right;
		color: black;
	}
	#hiddenSpan .small_img {  /* 작성자 옆에 홈, 메세지 이미지 */
		width: 17px;
	}
	#hiddenSpan {  /* 작성자 옆에 홈, 이미지 */
		margin-right: 80px;	
	}
	.small_img:hover{
		cursor: pointer;
	}
</style>
<body>
<script>
	$(function(){
		//좋아요 정보 불러오기
		$.ajax({
			url : "getBoardLike.do",
			type: "post",
			data: "bidx=${knowhow.bidx}",
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
				$("#likeBtn").html("<img src='resources/images/like2.jpg'>");
				}
			}, 
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		
		let lvo = {};
		lvo.bidx = ${knowhow.bidx };
		lvo.midx = ${user.midx };
		lvo.boardcate = ${knowhow.boardcate };
		
		//좋아요 버튼 눌렀을 때 반응하는 메서드
		$("#likeBtn").click(function(){
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
		
		// 즐겨찾기 정보 ajax로 불러오기
		let fvo ={};
		fvo.midx = ${user.midx };
		fvo.bidx = ${knowhow.bidx };
		fvo.boardcate = ${knowhow.boardcate };
		
		var favChecked = false;
		
		$.ajax({
			url : "getFavoriteCheck.do",
			data : JSON.stringify(fvo),
			dataType : "json",
			contentType : "application/json",
			type:"post",
			success : function(data){
				if(data != null){ //즐찾이 되어있는 경우
					favChecked = true;
					$("#favBtn").html("<img src='resources/images/favorite2.jpg'>");
				}
			},error : function(){
		   
			}
		});
	
	
		//즐겨찾기 버튼 눌렀을 때 반응하는 메서드
		$("#favBtn").click(function(){
				//아직 안누른 상태일 경우 (좋아요 설정)
				if(favChecked==false){
				$.ajax({
					url : "insertFavorite.do",
					type: "post",
					data: JSON.stringify(fvo),
					contentType:"application/json",
					success : function(){
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
						history.go(0);
					}, 
					error : function(){
					    alert("페이지통신 중 오류가 발생하였습니다!");
					    }
					});
				}
			});
		
		
		//게시물의 신고정보 불러오기
		let rvoBoard ={};
		rvoBoard.rfrom = ${user.midx };
		rvoBoard.rto = ${knowhow.midx };
		rvoBoard.rtype = 1;
		rvoBoard.rnum = ${knowhow.bidx };
		
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
		
		//신고하기 버튼을 클릭할시
		$("#reportBtn").click(function(){
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
		
		//로그인하지 않거나 해당 유저가 아니면 수정, 삭제 버튼 안보이게
		if (${knowhow.midx == user.midx}) {
			$('.hiddenBtn').removeClass('hiddenBtn');
		}
		
		//로그인하지 않으면 좋아요, 즐겨찾기, 신고부분 뜨지 않게 하기
		if (${user.midx != -1}) {
			$('#optionDiv').removeClass('hiddenBtn');
		}
	});
	
	//댓글달기
	function comment_insert(check) {
		
		let comment = document.getElementById("commentInput");
		
		if (window.event.keyCode == 13) {
			if (comment.value.trim() == "") {
				alert("입력된 댓글이 없습니다.");
				comment.focus();
				return false;
			}
			$.ajax("insertComment.do", {
				type : 'get',
				dataType : "json",
				data : {bidx : ${knowhow.bidx}, midx : ${user.midx}, rcontent : comment.value},
				success : function(data) {
					console.log(data);
					document.getElementById("commentInput").value = "";
					
					var tbody = "";
					//var list = data.list;
					$.each(data, function() {
						tbody += "<tr>";
						tbody += "<td>" + this.mnickname + "</td>";
						tbody += "<td>" + this.rcontent + "</td>";
						tbody += "<td>" + this.rregdate + "</td>";
						if (<%=mvo.getMidx() %> == this.midx ){
							tbody += "<td class='x' onclick='deleteComment_go("+this.ridx+")'> x </td>";
						}
						tbody += "</tr>";
					});
					$('#tbody').html(tbody);
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
				}
			});
		}
		
		if (check == 1) {
			if (comment.value.trim() == "") {
				alert("입력된 댓글이 없습니다.");
				comment.focus();
				return false;
			}
			$.ajax("insertComment.do", {
				type : 'get',
				dataType : "json",
				data : {bidx : ${knowhow.bidx}, midx : ${user.midx}, rcontent : comment.value},
				success : function(data) {
					console.log(data);
					document.getElementById("commentInput").value = "";
					
					var tbody = "";
					//var list = data.list;
					$.each(data, function() {
						tbody += "<tr>";
						tbody += "<td>" + this.mnickname + "</td>";
						tbody += "<td>" + this.rcontent + "</td>";
						tbody += "<td>" + this.rregdate + "</td>";
						if (<%=mvo.getMidx() %> == this.midx ){
							tbody += "<td class='x' onclick='deleteComment_go("+this.ridx+")'> x </td>";
						}
						tbody += "</tr>";
					});
					$('#tbody').html(tbody);
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
				}
			});
		}
		
		
		
		
	}
	
	//댓글 삭제
	function deleteComment_go(ridx) {
		let check = confirm('정말 삭제하시겠습니까?');
		if (check == true) {
			$.ajax("deleteComment.do", {
				type : 'get',
				dataType : "json",
				data : {ridx : ridx, bidx : ${knowhow.bidx}},
				success : function(data) {
					console.log(data);
					document.getElementById("commentInput").value = "";
					
					var tbody = "";
					//var list = data.list;
					$.each(data, function() {
						tbody += "<tr>";
						tbody += "<td>" + this.mnickname + "</td>";
						tbody += "<td>" + this.rcontent + "</td>";
						tbody += "<td>" + this.rregdate + "</td>";
						if (<%=mvo.getMidx() %> == this.midx ){
							tbody += "<td class='x' onclick='deleteComment_go("+this.ridx+")'> x </td>";
						}
						tbody += "</tr>";
					});
					$('#tbody').html(tbody);
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
				}
		  
			});
		}
	}
	
	//노하우 게시글 삭제
	function delete_go() {
		let check = confirm("정말 삭제하시겠습니까?");
		if (check) {
			location.href = "deleteKnowhow.do?bidx=${knowhow.bidx }";
		}
	}
	
	//작성자 페이지로 가기
	function myPage_go() {
		location.href = "myPage.do?midx=${knowhow.midx}";
	}
	
	//메세지 보내기
	function message_go() {
		location.href = "message_send.do?recv_midx=${knowhow.midx}";
	}
</script>

<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<%@include file = "header.jsp"%>
		</div>
		</header>
		
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<article id="post-37" class="post-37 page type-page status-publish hentry">
				<header class="entry-header">
				<div id="type">
					<c:if test="${knowhow.boardcate == 4 }">
					<div>강아지</div>
					</c:if>
					<c:if test="${knowhow.boardcate == 5 }">
					<div>고양이</div>
					</c:if>
					<div id="writerDiv">
						작성자 : <span id="writer" onclick="user_click()">${knowhow.mnickname}</span>
						<span id="hiddenSpan">
							<img id="home_img" class="small_img" src="resources/images/home.png" onclick="myPage_go()">
							<img id="message_img" class="small_img" src="resources/images/message.png" onclick="message_go()">
						</span>
						<span>${knowhow.bregdate }</span>
					</div>
					
					<div id="optionDiv" class="hiddenBtn">
						<span id="likeBtn"><img src="resources/images/like1.jpg"></span><span id="likeCnt"></span> 
						<span id="favBtn"><img src="resources/images/favorite1.jpg"></span>
						신고<span id="reportBtn"><img src="resources/images/siren.jpg"></span>
					</div>
					
					<!-- 신고하기 -->
					<div id="reportSpace">
					<form id="reportForm" method="post">
						<input type="hidden" name="rfrom" value="${user.midx }"> <input
							type="hidden" name="rto" value="${knowhow.midx }"> <input
							type="hidden" name="rtype" value="1"> <input
							type="hidden" name="rnum" value="${knowhow.bidx }">
							
						<table id="reportTable">
							<tr>
								<td colspan="2"><h2>신고하기</h2></td>
							</tr>
							<tr>
								<td colspan="2"><textarea id="rcontent" cols="30" rows="20"
										placeholder="해당 게시물의 신고사유를 기재해주세요. 허위 신고시 제재될 수 있습니다!"></textarea></td>
							</tr>
							<tr>
								<td><button type="button" id="submitBtn" class="reportBtn">신고완료</button></td>
								<td><button type="button" id="cancelBtn" class="reportBtn">신고취소</button></td>
							</tr>
						</table>
					</form>
					</div>
				</div>
				</header>
				</article>
				<!-- .entry-header -->
				<!-- 제목 부분 -->
				<div class="entry-content">
					<h1>${knowhow.btitle }</h1>
				</div>
				
				<!-- 내용 부분 -->
				<div id="knowContent">
					${knowhow.btext }
				</div>	
				
				</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	<!-- .container -->
	<p id="pbtn">
		<a class="hiddenBtn" href="updateKnowhow.do?bidx=${knowhow.bidx }">수정</a>
		<a class="hiddenBtn" onclick="delete_go()">삭제</a>
		<a href="getKnowhowList.do">목록</a>
	</p>
	
	<!-- -------댓글부분-------- -->
	<table id="commentTable">
		<colgroup>
			<col width="100">
			<col width="300">
			<col width="100">
			<col width="50">
		</colgroup>
		<tbody id="tbody">
			<c:if test="${empty commentList}">
				<tr>
					<td colspan="4">등록된 댓글이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty commentList }">
				<c:forEach var="comment" items="${commentList }">
					<tr class="tableTr" onclick="recomment_go(${comment.ridx})">
						<td>${comment.mnickname }</td>
						<td>${comment.rcontent }</td>
						<td>${comment.rregdate }</td>
						<c:if test="${comment.midx == user.midx }">
							<td class='x' onclick='deleteComment_go(${comment.ridx})'>x</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<form id="commentForm">
	<div id="commentDiv">
		댓글 : <input id="commentInput" type="text" name="rcontent" onkeyup="comment_insert()"> 
		<input type="hidden" name="bidx" value="${knowhow.bidx }">
		<input type="hidden" name="midx" value="${user.midx }">
		<input id="commentBtn" type="button" value="저장" onclick="comment_insert(1)">
	</div>
	</form>
	
	<!-- -------댓글부분 끝------- -->
	
	<%@ include file="footer.jsp" %>
</div>

<script>

	
</script>
<!-- #page -->
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/accordion.js'></script>
<script src='resources/js/tabs.js'></script>
<script src='resources/js/toggle.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>