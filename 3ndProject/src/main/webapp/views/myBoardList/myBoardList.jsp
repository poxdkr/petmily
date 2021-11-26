<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PETMILY : 마이페이지</title>

<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all' />
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all' />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hi+Melody&display=swap" rel="stylesheet">


<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//리스트 출력
function list(category) {
	location.href = "myBoardListPaging.do?boardcate=" + category;
}

//무한 스크롤 처리용
const GetList = function(currentPage){
    $.ajax({
        url:"myBoardListPagingR.do",
        method:"GET",
        data:"pageNum="+currentPage+"&boardcate="+${myBoardListCategory },
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
        if(currentPage == ${myBoardListTotalPageCount } || isLoading || ${myBoardListTotalPageCount } == 0){
            return; 
        }
        isLoading=true;
        $(".back-drop").show(); // 로딩바용
        currentPage++;
        GetList(currentPage);
    }; 
});

</script>
<style>
.hamburger-wrap { /* 메뉴부분을 감싸고 있는 div */
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
	opacity: 0;
}

.hamburger-wrap.active span:nth-child(3) {
	transform: translateY(-15px) rotate(-45deg);
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

a {
	text-decoration: none;
	color: grey;
}

#closebox {
	padding: 0px;
	text-align: center;
	color: darkgrey;
	font-size: 0.8em;
	cursor: pointer;
}

#closebox p:hover, #moreBoard p:hover {
	text-decoration: underline;
}

#titleSpace, #titleinputSpace, #imageInputSpace, #contentInputSpace,
	#bottomSpace {
	width: 100%;
	float: left;
	text-align: center;
}

#titleSpace h1 {
	color: darkgrey;
	font-weight: bold;
}

#imageInputSpace {
	padding: 20px;
}

#titleInput select, #titleInput input {
	height: 50px;
	border: 1px solid darkgrey;
	border-radius: 10px;
	font-weight: bold;
	font-size: 1.2em;
}

#titleInput input {
	width: 400px;
}

#subTitleSpace {
	font-size: 1.2em;
	font-weight: bold;
}

#imageUploadTable {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

div[id^=uploadForm]>input {
	font-size: 0.8em;
	background-color: lightyellow;
	font-weight: bold;
	margin: auto;
}


h4, h1, h2, span, button {
	font-family: Hi Melody, "Malgun Gothic", serif;
	font-weight: bold;
}

#container_Box {
	width: 100%;
	margin-top: 40px;
	margin-bottom: 150px;
}

#titleText {
	text-align: center;

}
#titleText span {
	font-family: 'Gowun Dodum', "Malgun Gothic", serif;
	font-weight: bold;
	font-size : 3em;
}

#menuBar {
   text-align: center;
   border-bottom : 1px solid darkgrey;
   padding-bottom: 15px;
}
#menuBar span {
	font-family: 'Gowun Dodum',"Malgun Gothic", serif;
	font-size : 2em;
	margin-left : 20px;
	border : none;
	border-radius: 30px 0;
	padding : 10px;
}
#menuBar span:hover {
	background-color: #ffbb00;
	transition:0.5s;
	color:white;
	cursor: pointer;
}




<!-- =========================== -->						
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
	font-family: 'Black Han Sans', sans-serif;
	font-size: 40px;
}
						
						
						
</style>
</head>

<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<%@ include file="/header.jsp"%>
				</div>
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main">
					
						<!--============================================================================  -->
						<!--============================================================================  -->
						<!--============================================================================  -->
						
						<div id="container_Box">
							<!-- 컨테이너 시작  -->
							<div id="titleText">
								<span id="userWho" style="color:#ffbb00">[ ${targetMember.mnickname } ]</span>
								<span>님의 페이지</span>
                           <hr>
							</div>
							<div id="menuBar">
									<span id="profileBtn">프로필</span> <span id="viewPetBtn">반려동물</span> <span id="myBoardList">작성게시물</span>
							</div>

							<div class="main-content show-list">
								<div class="categoryBtn-content">
									<div class="categoryBtn-item N active" onclick="list(0)">
										<img src="./resources/images/all.png" alt="">
										<h2>전체</h2>
										<p>
											[<span>${myBoardListCnt.allcnt }</span>]
										</p>
									</div>
								<div class="categoryBtn-item II" onclick="list(2)">
									<img src="./resources/images/dog.png" alt="">
									<h2>강아지</h2>
									<p>
										[<span>${myBoardListCnt.dogcnt }</span>]
									</p>
								</div>
								<div class="categoryBtn-item I" onclick="list(1)">
									<img src="./resources/images/cat.png" alt="">
									<h2>고양이</h2>
									<p>
										[<span>${myBoardListCnt.catcnt }</span>]
									</p>
								</div>
								<div class="categoryBtn-item IV" onclick="list(4)">
									<img src="./resources/images/knowhow.png" alt=>
									<h2>댕냥노하우</h2>
									<p>
										[<span>${myBoardListCnt.knowcnt }</span>]
									</p>
								</div>
	
								<div class="categoryBtn-item III" onclick="list(3)">
									<img src="./resources/images/free.png" alt="">
									<h2>이야기</h2>
									<p>
										[<span>${myBoardListCnt.freecnt }</span>]
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
							<!-- 컨테이너 끝 -->
						</div>
					</main>
					<!-- #main -->
				</div>
				<!-- #primary -->
			</div>
			<!-- #content -->
		</div>
		<!-- .container -->
		<%@ include file="/footer.jsp"%>
	<script>
// 카테고리 선택 관련 처리용
$(document).ready(function() {
	//////////////////////////
	if(${user.midx == targetMember.midx }){
		$("#profileContainer").show();
		$("#petInfoContainer").hide();
		$("#profileBtn").show();
	}else{
		$("#profileContainer").hide();
		$("#petInfoContainer").show();
		$("#profileBtn").hide();
	}
	
	//프로필을 누르면
	$("#profileBtn").click(function(){
		location.href="myPage.do?midx="+${targetMember.midx};
	});
	
	//반려동물을 누르면
	$("#viewPetBtn").click(function(){
		location.href="myPage.do?midx="+${targetMember.midx};
	});
	
	/////////////////////////
	
	var category = ${myBoardListCategory };
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


	<!-- #page -->
	<script src='./resources/js/jquery.js'></script>
	<script src='./resources/js/plugins.js'></script>
	<script src='./resources/js/scripts.js'></script>
	<script src='./resources/js/masonry.pkgd.min.js'></script>
</body>
</html>