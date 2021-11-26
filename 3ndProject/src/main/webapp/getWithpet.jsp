<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>위드펫</title>

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
	#commentTable {
		position: relative;
		width: 900px;
		left: 50%;
		transform: translate(-50%);
	}
	#commentDiv {
		position: relative;
		left: 170px;
	}
	#commentInput {
		width: 400px;
	}
	#deleteBtn:hover {
		cursor: pointer;
	}
	#map {
		display: inline-block;
	}
	#thumbnail_img {
		width: 300px;
		height: 300px;
		margin-top: 35px;
		border-radius: 7px;
	}
	#thumbnail_div {
		position: relative;
		display: inline-block;
		text-align: center;
		width: 470px;
		height: 370px;
		bottom: 35px;
		border: 1px solid;
		border-radius: 7px;
		border-color: #ffbb00;
	}
</style>
<body>
<script>
	function delete_go() {
		let check = confirm("정말 삭제하시겠습니까?");
		if (check == true) {
			location.href = "deleteWithpet.do?widx=${withpet.widx}";
		}
	}
</script>

<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<%@ include file="header.jsp" %>
		</div>
		</header>
		
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main" role="main">
				<article id="post-37" class="post-37 page type-page status-publish hentry">
				<header class="entry-header">
				<div id="type">
					<c:if test="${withpet.placetype == 1 }">
						음식점
					</c:if>
					<c:if test="${withpet.placetype == 2 }">
						카페
					</c:if>
					<c:if test="${withpet.placetype == 3 }">
						호텔
					</c:if>
					<c:if test="${withpet.placetype == 4 }">
						동물병원(24시)
					</c:if>
				</div>
				</header>
				</article>
				<!-- .entry-header -->
				<div class="entry-content">
					<h1>${withpet.placename }</h1>
					<div id="map" style="width:470px;height:370px;"></div>
					<div id="thumbnail_div">
						<img id="thumbnail_img" src="/upload/${withpet.thumbnail }">
					</div>
					<br>
					
					<p>${withpet.totalAddress }</p>
					<br>
					
					<a href="${withpet.link }">${withpet.link }</a>
					<div class="wpcmsdev-accordion">
						${withpet.content }						
					</div>
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
		<a href="updateWithpet.do?widx=${withpet.widx }">수정</a>
		<a id="deleteBtn" onclick="delete_go()">삭제</a>
		<a href="getWithpetList.do">목록</a>
	</p>
	
	
	<%@ include file="footer.jsp" %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fba2eacfb1eb7f4b878efc2410ea16be"></script>
<script>
	window.onload = function() {
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${withpet.location}),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${withpet.location}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);  
		
		if(${user.mlevel == 1 || user.mlevel == 2}) {
			$('.master_li').removeClass('master_li');
		}
		
		if (${user.midx} > 0) {
			document.getElementById("logReg").style.display="none";
			document.getElementById("hiddenBox").style.display="block";
		}
	}
	
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