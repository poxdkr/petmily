<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.project.petmily.member.MemberVO" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>즐겨찾기</title>

<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all' />
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all' />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 폰트용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Batang&family=Gowun+Dodum&family=Gugi&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
	<script>
	//리스트 출력
	function list(category) {
		location.href = "favoriteListPaging.do?boardcate=" + category;
	}
	
	//무한 스크롤 처리용
	const GetList = function(currentPage){
	    $.ajax({
	        url:"favoriteListPagingR.do",
	        method:"GET",
	        data:"pageNum="+currentPage+"&boardcate="+${favoriteListCategory},
	        success:function(data){
	            $(".block-list").append(data);
	            $(".back-drop").hide();
	            isLoading=false; // 로딩 표시 x
	            },
	            error: function(request, status, error) {
					alert("ajax 오류!");
					alert("code = " + request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		}
	let currentPage=1;
	let isLoading=false;

	//스크롤 위치 관련
	$(window).on("scroll",function(){
	    let scrollTop=$(window).scrollTop();
	    let windowHeight=$(window).height();
	    let documentHeight=$(document).height();
	    let isBottom=scrollTop+windowHeight + 10 >= documentHeight; // 최하단값 
	
	   
	    if(isBottom){ //최하단 도착시 처리 진행 관련
	        if(currentPage == ${totalPageCount} || isLoading || ${totalPageCount} == 0){
	            return; 
	        }
	        isLoading=true;
	        $(".back-drop").show(); // 로딩바용
	        currentPage++;
	        GetList(currentPage);
	    }; 
	});
</script>
</head>
<style>
.center {
	text-align: center;
}

.img-item {
	width: 100%;
	height: 100%;
	background-size: cover;
}

.imgItem{
	margin-top: 15px;
 	width: 250px;
	height: 250px;
}

.categoryBtn-item {
	cursor: pointer;
	float: left;
	padding: 40px 0;
	width: 20%;
	text-align: center;
	border: 1px solid #fff;
	position: relative;
	display: inline-block;
	float: left;
}

.categoryBtn-item:hover {
	border: 1px solid #e4e4e4;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
}

.categoryBtn-item.active {
	opacity: 1;
	border: 1px solid #e4e4e4;
	box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
}
.categoryBtn-content{
	margin-top: 40px;
	text-align: center;
}

.block-list {
	margin-top: 15px;
}

.content-body .container-wrapper.news-container .main-content .block-wrapper .block-list .block-item {
	width: auto;
	height: auto;
	margin-right: 34px;
	content: "";
	float: left;
	display: block;
	clear: both;
}
 
.block-item{
	display: inline-block;
	overflow: hidden;
	backgorund: gray;
}

.item-title h4{
	text-overflow: ellipsis;
	width: 250px;
	white-space: nowrap;
	word-wrap: normal;
	overflow: hidden;
}
.block-item:hover {
	cursor: pointer;
	-webkit-transform: scale(1.05);
	    -ms-transform: scale(1.05);
	        transform: scale(1.05);
	transition: .3s;
}

.categoryBtn-item h2
	{
	color: #48484d;
	font-size: 25px;
	font-weight: 500;
	line-height: 37px;
	text-align: center;
}

.scraped-contents {
	text-align: center;
}

.ptag{
	color: #83868B;
	font-family: 'Hi Melody', cursive;
	font-size : 2em;
}

.list-title{
}

.title-text{
	font-family: 'Gowun Dodum', sans-serif;
	font-weight: bold;
	font-size : 2.5em;
	text-align: center;
	height: 100px;
}

</style>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">

	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<%@ include file="/header.jsp"%>
				</div>
			</header>

			<div class="content-body">
				<div class="container-wrapper scraped-container">
					<div class="list-title">
							<div class="title-text">
								<span>즐겨찾기</span>
								<hr>
							</div>
					</div>
					<!-- show-list 클래스 제거시 none-list 등장 -->
					<div class="main-content show-list">
						<div class="categoryBtn-content">
							<div class="categoryBtn-item N active" onclick="list(0)">
								<img src="./resources/images/all.png" alt="">
								<h2>전체</h2>
								<p>
									[<span>${favoriteListCnt.allcnt }</span>]
								</p>
							</div>
							<div class="categoryBtn-item II" onclick="list(2)">
								<img src="./resources/images/dog.png" alt="">
								<h2>강아지</h2>
								<p>
									[<span>${favoriteListCnt.dogcnt }</span>]
								</p>
							</div>
							<div class="categoryBtn-item I" onclick="list(1)">
								<img src="./resources/images/cat.png" alt="">
								<h2>고양이</h2>
								<p>
									[<span>${favoriteListCnt.catcnt }</span>]
								</p>
							</div>
							<div class="categoryBtn-item IV" onclick="list(4)">
								<img src="./resources/images/knowhow.png" alt="이미지 테스트">
								<h2>댕냥노하우</h2>
								<p>
									[<span>${favoriteListCnt.knowcnt }</span>]
								</p>
							</div>

							<div class="categoryBtn-item III" onclick="list(3)">
								<img src="./resources/images/free.png" alt="">
								<h2>이야기</h2>
								<p>
									[<span>${favoriteListCnt.freecnt }</span>]
								</p>
							</div>
						</div>
						<br>
						
						
						<section id="card-list" class="card-list">
    						<div class="container">
        					<div class="row card-list-container thumbnails"></div>
								<div class="scraped-contents">
									<div class="active-list">
										<div class="block-list">
											<!-- 리스트 출력 -->
										</div>
									</div>
								</div>
    						</div>
						</section>
						
						<div class="back-drop">
						    <img src="./resources/images/spinner-solid.svg"/> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
// 카테고리 선택 관련 처리용
$(document).ready(function() {
	var category = ${favoriteListCategory };
	switch(category){
	case 1:
		$('.categoryBtn-item').removeClass('active');
		$('.I').addClass('active');
		break;
	case 2:
		$('.categoryBtn-item').removeClass('active');
		$('.II').addClass('active');
		break;
	case 3:
		$('.categoryBtn-item').removeClass('active');
		$('.III').addClass('active');
		break;
	case 4:
		$('.categoryBtn-item').removeClass('active');
		$('.IV').addClass('active');
	default:
		break;
	}
		GetList(1);	

});
</script>
		<!-- .container -->
		<%@ include file="/footer.jsp"%>
		<!-- #page -->
		<script src='resources/js/jquery.js'></script>
		<script src='resources/js/plugins.js'></script>
		<script src='resources/js/scripts.js'></script>
		<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>