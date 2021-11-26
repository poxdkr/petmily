<%@page import="com.project.petmily.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO user = (MemberVO)session.getAttribute("user");
	if(user == null){
	MemberVO mvo = new MemberVO();
	mvo.setMidx(-1);
	session.setAttribute("user",mvo);
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

<!-- 폰트용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Batang&family=Gowun+Dodum&family=Gugi&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">

<!-- 슬라이드 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<style>
	.animalType {
		color: #4AC96D;
		font-weight: bold;
	}
	.thumbnail_img {  /* 썸네일 이미지 */
		width: 230px;
		height: 230px;
		border-radius: 15px;
	}
	.thumbnail_img:hover {
		transform: scale(1.05);
		transition: all 0.2s ease-in-out;
	}
	.best3 {  /* 베스트 노하우 를 감싸고 있는 div*/
		display: inline-block;
		margin-right: 60px;
		margin-left: 30px;
		margin-top: 30px;
		position: relative;
	}
	.totalBox {  /* 베스트 게시물을 감싸고 있는 div */
		margin-bottom: 150px;
		background-color : #F9F9F9;
		border-radius: 8px;
	}
	.totalBox h3 {
		margin-left: 30px;
	}
	.medal_img {
		width: 30px;
		position: absolute;
		right: 30px;
	}
	.best3 .animalType2 {  /* 강아지, 고양이 카테고리 분류 */
		position: relative;
		color: #65EFA3;
		font-weight: bold;
	}
	#firstBox {  /* 네비게이션 바 부분 */
		position: relative;
		left: 50%;
		transform: translate(-38%);
	}
	#site-navigation {  /* 네비게이션 바 부분*/
		width: 960px;
	}
	#introduce_know {  /* 펫밀리에서 가장 인기있는 노하우 소개 */
		position: absolute;
		display: inline-block;
		width: 150px;
		margin-left: 20px;
	}
	#introduce_board {  /* 펫밀리에서 가장 인기있는 게시글 소개 */
		display: inline-block;
		width: 150px;
		margin-left: 20px;
	}
	#knowhowBest {  /* 베스트 노하우 리스트를 가장 바깥쪽에서 감싸고 있는 div */
		height: 350px;
		position: relative;
		width: 1000px;
		left: 200px;
	}
	#boardBest {  /* 베스트 게시글 리스트를 가장 바깥쪽에서 감싸고 있는 div */
		height: 350px;
		position: relative;
		width: 1000px;
		left: 200px;
		bottom: 130px;
	}
	#board_none {
		position: absolute;
		left: 50%;
		transform: translate(-50%);
		top: 30%;
	}
	#Board {
		position: relative;
		height: 405px;
	}
	#knowhowBoard {
		margin-top: 50px;
		position: relative;
		height: 405px;
	}
	.entry-title {  /* 제목 부분 */
		width: 230px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	#knowhowBoard h3{
		font-family: 'Gowun Dodum', sans-serif;
	}
	#knowhowBoard h4{
		font-family: 'Gowun Dodum', sans-serif;
	}
	#Board h3{
		font-family: 'Gowun Dodum', sans-serif;
	}
	#Board h4{
		font-family: 'Gowun Dodum', sans-serif;
	}
	/* 슬라이더 1 시작 */
	.slider-1 {
	    height:340px;
	    position:relative;
	}
	
	/* 슬라이더 1 - 페이지 버튼 */
	.slider-1 > .page-btns {
	    text-align:center;
	    position:absolute;
	    bottom:20px;
	    left:0;
	    width:100%;
	}
	
	.slider-1 > .page-btns > div {
	    width:20px;
	    height:20px;
	    background-color:#F6F0CE;
	    border-radius:4px;
	    display:inline-block;
	    cursor:pointer;
	}
	
	.slider-1 > .page-btns > div.active {
	    background-color: #ffbb00;
	}
	
	/* 슬라이더 1 - 슬라이드 */
	
	.slider-1 > .slides > div {
	    position:absolute;
	    top:0;
	    left:0;
	    right:0;
	    bottom:0;
	    opacity:0;
	    transition: opacity 0.3s;
	    background-position:center;
	    background-size:cover;
	    background-repeat:no-repeat;
	}
	
	.slider-1 > .slides > div.active {
	    opacity:1;
	}
	/* 슬라이더 좌우 버튼 */
	.slider-1 > .side-btns > div {
	    position:absolute;
	    top:0;
	    left:80px;
	    width:120px;
	    height:100%;
	    cursor:pointer;
	}
	.slider-1 > .side-btns > div:last-child {
	    left:auto;
	    right:80px;
	}
	.slider-1 >.side-btns > div > span {
	    position:absolute;
	    top:50%;
	    left:20px;
	    transform:translatey(-50%);
	    background-color:white;
	    opacity:0.5;
	    padding:1px 13px;
	    border-radius:50px;
	    font-size:25px;
	}
	.slider-1 >.side-btns > div:last-child > span {
	    left:auto;
	    right:20px;
	}
	.slide-btns div {
		border: 1px solid;
	}
	.slides img {
		width: 860px;
		height: 260px;
	}
	.slides {
		position: relative;
		left: 50%;
		transform: translate(-34%);
	}
	/* 슬라이더 1 끝 */
</style>

<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function(){
		//베스트 노하우 3개
		$.ajax("getKnowhowListTop.do", {
			type : 'get',
			dataType : "json",
			success : function(data) {
				console.log(data);
				var content = "";
				if (($.trim(data)).length != 0) {
				$.each(data, function(index, value) {
					content += "<div class='best3'>";
					content += "<a href='getKnowhow.do?bidx="+this.bidx+"'><img class='thumbnail_img' src='/upload/"+this.bpict1+"'></a>";
					content += "<img class='medal_img' src='resources/images/medal"+(index+1)+".png'>";
					if (this.boardcate == 4) {
						content += "<div class='animalType2'>강아지</div>";
					} else if (this.boardcate == 5) {
						content += "<div class='animalType2'>고양이</div>";
					}
					content += "<h4 class='entry-title'><a href='getKnowhow.do?bidx="+this.bidx+"'>"+this.btitle+"</a></h4>";
					content += "</div>";
				});
					$('#knowhowBest').html(content);
				} else {
					content += "<div id='knowhow_none'><h5>좋아요를 받은 노하우 게시글이 존재하지 않습니다.</h5>";
					$('#knowhowBest').html(content);
				}
				
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
					+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n"
					+ "errorThrown : " + errorThrown);
			}
		});
		
		//베스트 게시글 3개
		$.ajax("getBoardListTop.do", {
			type : 'get',
			dataType : "json",
			success : function(data) {
				console.log(data);
				var content = "";
				if (($.trim(data)).length == 0) {
					content += "<div id='board_none'><h5>좋아요를 받은 게시글이 존재하지 않습니다.</h5></div>";
				} else {
					$.each(data, function(index, value) {
						content += "<div class='best3'>";
						content += "<a href='getBoard.do?bidx="+this.bidx+"'><img class='thumbnail_img' src='/upload/"+this.bpict1+"'></a>";
						content += "<img class='medal_img' src='resources/images/medal"+(index+1)+".png'>";
						if (this.boardcate == 1) {
							content += "<div class='animalType2'>고양이</div>";
						} else if (this.boardcate == 2) {
							content += "<div class='animalType2'>강아지</div>";
						} else if (this.boardcate == 3) {
							content += "<div class='animalType2'>이야기</div>";
						}
						content += "<h4 class='entry-title'><a href='getBoard.do?bidx="+this.bidx+"'>"+this.btitle+"</a></h4>";
						content += "</div>";
					});
				}
				$('#boardBest').html(content);
			},
			error : function(jqXHR, textStatus, errorThrown){
				alert("Ajax 처리 실패 : \n"
					+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n"
					+ "errorThrown : " + errorThrown);
			}
		});
		
	});
</script>

<div id="page">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<%@ include file="header.jsp" %>
		</div>
		</header>
		
		<!-- 배너 구간(시작) -->
		<div class="slider-1">
		    <div class="slides">
		       	<!-- <div class="active"><img class="img_link" src="resources/images/우리동생후원배너.jpg" onclick="link_go(1)"></div>
				<div><img src="resources/images/banner2.jpg" onclick="link_go(2)"></div>
				<div><img src="resources/images/banner3.jpg" onclick="link_go(3)"></div> -->
				<div class="active"><img class="img_link" src="resources/images/우리동생후원배너.jpg"></div>
				<div><img src="resources/images/banner2.jpg"></div>
				<div><img src="resources/images/banner3.jpg" ></div>
		    </div>
		    <div class="page-btns">
		        <div class="active"></div>
		        <div></div>
		        <div></div>
		    </div>
		    <div class="side-btns">
		        <div>
		            <span><i class="fas fa-angle-left"></i></span>
		        </div>
		        <div>
		            <span><i class="fas fa-angle-right"></i></span>
		        </div>
		    </div>
		</div>
		<!-- 배너 구간 (끝) -->
		
			<div id="knowhowBoard" class="totalBox">
				<h3>BEST 노하우</h3>
				<div id="introduce_know">
					<h4>펫밀리에서<br>가장 인기있는<br>노하우 소개</h4>
				</div>
				<div id="knowhowBest" class="bestBox">
					
				</div>
			</div>
			
			<div id="Board" class="totalBox">
				<h3>BEST 게시글</h3>
				<div id="introduce_board">
					<h4>펫밀리에서<br>가장 인기있는<br>게시글 소개</h4>
				</div>
				<div id="boardBest" class="bestBox">
					
				</div>
			</div>
	<%@ include file="footer.jsp" %>
</div>
<!-- #page -->

<script>
	//기존 버튼형 슬라이더
	$('.slider-1 > .page-btns > div').click(function(){
	    var $this = $(this);
	    var index = $this.index();
	    
	    $this.addClass('active');
	    $this.siblings('.active').removeClass('active');
	    
	    var $slider = $this.parent().parent();
	    
	    var $current = $slider.find(' > .slides > div.active');
	    
	    var $post = $slider.find(' > .slides > div').eq(index);
	    
	    $current.removeClass('active');
	    $post.addClass('active');
	});
	
	// 좌/우 버튼 추가 슬라이더
	$('.slider-1 > .side-btns > div').click(function(){
	    var $this = $(this);
	    var $slider = $this.closest('.slider-1');
	    
	    var index = $this.index();
	    var isLeft = index == 0;
	    
	    var $current = $slider.find(' > .page-btns > div.active');
	    var $post;
	    
	    if ( isLeft ){
	        $post = $current.prev();
	    }
	    else {
	        $post = $current.next();
	    };
	    
	    if ( $post.length == 0 ){
	        if ( isLeft ){
	            $post = $slider.find(' > .page-btns > div:last-child');
	        }
	        else {
	            $post = $slider.find(' > .page-btns > div:first-child');
	        }
	    };
	    
	    $post.click();
	});

	setInterval(function(){
	    $('.slider-1 > .side-btns > div').eq(1).click();
	}, 3000);
	
	//link 타고 페이지 이동
	/* function link_go(number) {
		alert("number : " + number);
		if (number == 1) {
			location.href = "http://mapowithpet.com/wordpress/?page_id=21627";
		}
	} */
	
	
</script>

<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>
