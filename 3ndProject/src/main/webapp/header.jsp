<%@page import="com.project.petmily.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- 폰트용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Batang&family=Gowun+Dodum&family=Gugi&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">

</head>
<style>
	html {
		border: none;
	}
	#headImg {  /* 상단 로고 이미지 */
		width: 200px;
		height: 200px;
	}	
	.site-description {  /* 웹사이트 이름 */
		font-size: 40px;
		padding-top: 0;
	}
	#logReg {  /* 로그인/회원가입  부분  */
		position: absolute;
		right: 230px;
		top: 50px;
	}
	.menu1 {  /* 메뉴 버튼 부분 (클릭 전) */
		background: url(resources/images/menu.png);
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
		width: 25px;
		height: 25px;
		cursor: pointer;
		transition: 0.3s;
		position: absolute;
		top: 30px;
		right: 90px;
		z-index: 999;
	}
	.menu1.active {  /* 메뉴 버튼 부분 (클릭 후) */
		background: url(resources/images/cancel.png);
		background-size: cover;
		background-position: center;
		background-repeat: no-repeat;
		width: 25px;
		height: 25px;
		cursor: pointer;
		transition: 0.3s;
		position: absolute;
		top: 30px;
		right: 90px;
		z-index: 999;
	}
	#sideMenu a {
		text-decoration: none;
		color: black;
	}
	li {
		list-style: none;
	}
	#main_nav {
		display: none;
		position: absolute;
		top: 60px;
		right: 50px;
		text-align: left;
	}
	#menu3 {
		display: none;
	}
	#menu3:checked + #main_nav {
		display: block;
	}
	#hiddenBox {  /* 로그인을 하지 않으면 상단에 메뉴가 보이지 않는다 */
		display: none;
	}
	#topBox {  /* 상단 즐겨찾기, 메세지, 알람 버튼 */
		position: absolute;
		top: 20px;
		right: 120px;
	}
	#message_img {
		width: 40px;
	}
	#favorite_img {
		width: 25px;
		margin-bottom: 5px;
	}
	.top_img {
		margin-right: 20px;
	}
	
	#site-navigation{  /* 네비게이션 바 부분 */
		position: relative;
		left: 50%;
		transform: translate(-50%);
	}
	#menu-menu-1 li:hover{
		text-decoration : underline;
		color: #ffbb00;
	}
	#menu-menu-1 .master_li {  /* 관리자 전용 네비게이션 바 */
		display: none;
	}
	#menu-menu-1 {
		font-family: 'Gowun Dodum', sans-serif;
	}
</style>
<body>
	<a href="index.jsp">
		<img src="resources/images/petmily.png" id="headImg">
	</a>
	<div id="btnDiv">
		<a href="loginPage.jsp"><span id="logReg">로그인</span></a>
		
		<!-- 로그인이 되어있지 않으면 보이지 않는다. -->		
		<div id="hiddenBox">
			<!-- 메세지, 즐겨찾기 부분 -->
			<div id="topBox">
				<a href="javascript:location.href='message_list.do'"><img id="message_img" class="top_img" src="./resources/images/message.png"></a>
				<a href="javascript:location.href='favoriteListPaging.do'"><img id="favorite_img" class="top_img" src="./resources/images/favorite.png"></a>
				<a href="#"><img id="alarm_img" class="top_img" src="./resources/images/alarm.png"></a>
			</div>
			
			<!-- 메뉴 버튼 -->
			<label class="menu1" for="menu3"></label>
			<input id="menu3" type="checkbox" onclick="sideMenu()">
			<nav id="main_nav">
				<ul>
					<li class="sideMenu"><a href="myPage.do?midx=${user.midx }">내 정보</a></li>
					<li class="sideMenu"><a href="logout.jsp">로그아웃</a></li>
				</ul>
			</nav>
		</div>
		<nav id="site-navigation" class="main-navigation">
			<button class="menu-toggle">Menu</button>
			<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
			<div class="menu-menu-1-container">
				<ul id="menu-menu-1" class="menu" style="font-family: 'Gowun Dodum', 'Malgun Gothic', serif;">
					<li><a href="getKnowhowList.do">노하우</a></li>
					<li><a href="getBoardList.do">일상/유머공유</a></li>
					<li><a href="getWithpetList.do">위드펫</a>
					<li><a href="faqList.jsp">고객센터</a></li>
					<li id="" class="master_li"><a href="report.do">신고관리</a></li>
					<li id="" class="master_li"><a href="getAdvertiseList.do">광고상품관리</a></li>
					<li id="" class="master_li"><a href="getMemberList.do">회원관리</a></li>
				</ul>
			</div>
		</nav>
		
	</div>
<script>
	function sideMenu() {
		let menu = document.querySelector(".menu1");
		menu.classList.toggle("active");
	}
	window.onload = function(){
		if (${user.midx} > 0) {
			document.getElementById("logReg").style.display="none";
			document.getElementById("hiddenBox").style.display="block";
		}
	}
	
</script>
<script>
	$(function(){
		var yn = $(location).attr('href').includes('message');
		if(${user.midx} > 0 && yn == false){
			$.ajax({
				url:"message_alarm.do",
				method:"GET",
				data:{
					midx : ${user.midx}
				},
				success:function(data){
					if(data > 0){
						var content = '<a href="javascript:location.href=\'message_list.do\'"><img id="message_img" class="top_img" src="resources/images/message_alarm.png"></a>';
						content += '<a href="javascript:location.href=\'favoriteListPaging.do\'"><img id="favorite_img" class="top_img" src="resources/images/favorite.png"></a>';
						content += '<a href="#"><img id="alarm_img" class="top_img" src="resources/images/alarm.png"></a>';
						$('#topBox').html(content);
					}
				},
				error: function(request, status, error) {
					alert("ajax 오류!");
					alert("code = " + request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
		
		if(${user.mlevel == 1 || user.mlevel == 2}) {
			$('.master_li').removeClass('master_li');
		}
		
	});
</script>
</body>
</html>