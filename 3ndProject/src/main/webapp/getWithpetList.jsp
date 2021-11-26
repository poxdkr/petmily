<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>노하우 리스트 페이지</title>

<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
</head>
<style>
	.center {
		text-align: center;
	}
	#typeBtn {  /* 카테고리 버튼 */
		margin-top: 15px;
		margin-bottom: 40px;
	}
	#typeBtn input {
		border-radius: 5px;
		margin-right: 10px;
	}
	.thumbnailImg {  /* 썸네일 이미지 */
		width: 200px;
		height: 200px;
	}
	.bpage {  /* 페이지를 감싸고 있는 ol태그*/
		float: right;
		position: relative;
		list-style: none;
		bottom: 20px;
		right: 50%;
		transform: translate(50%);
	}
	.bpage li {  /* 페이지 버튼 부분 */
		float: left;
		margin-right: 20px;
		background-color: #ffbb00;
		width: 20px;
		text-align: center;
		border-radius: 5px;
	}
	.bpage li:hover {
		cursor: pointer;
	}
	.bpage .now {
		background-color: #ECD26D;
	}
	#knowTable td {  /* 테이블 */
		padding-left: 40px;
	}
	#inputSearch {  /* 검색어 입력창 */
		width: 500px;
		border-radius: 8px;
	}	
	#searchBtn {  /* 검색버튼 */
		color: white;
		border-radius: 8px;
		border: none;
		background-color: #ffbb00;
		height: 40px;
	}
	#typeBtn .nowType {  /* 현재 카테고리 */
		background-color: #ECD26D;
		border: none;
	}
	#typeBtn .otherType {  /* 다른 카테고리 */
		background-color: #ffbb00;
		border: none;
	}
	.withpetList {  /* 각 게시글의 행을 덮고있는 div */
		display: inline-block;
		margin-bottom: 40px;
		margin-right: 10px;
		margin-left: 25px;
	}
	#rowDiv h4 {
		margin: 0;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		width: 200px;
		margin: 0;
	}
	.withpetList .type {
		color: #4AC96D;
		font-weight: bold;
	}
	#newReg {
		margin: 30px 20px;
	}
	.hiddenBtn {
		visibility: hidden;
	}
</style>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	//동적으로 카테고리 표시
	$(function(){
		if (${type == 0}) {
			$("#allBtn").removeClass("otherType");
			$("#allBtn").addClass("nowType");
		} else if (${type == 1}) {
			$("#foodBtn").removeClass("otherType");
			$("#foodBtn").addClass("nowType");
		} else if (${type == 2}) {
			$("#cafeBtn").removeClass("otherType");
			$("#cafeBtn").addClass("nowType");
		} else if (${type == 3}) {
			$("#hotelBtn").removeClass("otherType");
			$("#hotelBtn").addClass("nowType");
		} else if (${type == 4}) {
			$("#hosBtn").removeClass("otherType");
			$("#hosBtn").addClass("nowType");
		}
		
		if (${user.mlevel == 1 || user.mlevel == 2}) {
			$('#newReg').removeClass("hiddenBtn");
		}
	});
	
	//강아지/고양이 선택해서 출력
	function typeList_go(placetype) {
		location.href = "getWithpetList.do?placetype="+placetype;
	}
	//전체 리스트 출력
	function list_go() {
		location.href = "getWithpetList.do";
	}
	//검색 실행
	function enterkey(check) {
		let search = document.getElementById("inputSearch").value;
		if (window.event.keyCode == 13) {
			location.href="getWithpetList.do?searchKeyword="+search;
		}
		if (check == 1) {
			location.href="getWithpetList.do?searchKeyword="+search;
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
		
		<!-- 검색바 -->
	    <div>
	      <input type="text" name="searchKeyword" placeholder="검색할 내용을 입력해주세요." onkeyup="enterkey()" id="inputSearch">
	      <span>
	        <button id="searchBtn" type="button" onclick="enterkey(1)">검색</button>
	      </span>
	    </div>
	    
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<h3>위드펫</h3>
				<div id="typeBtn">
					<input id="allBtn" class="otherType" type="button" value="전체" onclick="list_go()">
					<input id="foodBtn" class="otherType" type="button" value="음식점" onclick="typeList_go(1)">
					<input id="cafeBtn" class="otherType" type="button" value="카페" onclick="typeList_go(2)">
					<input id="hotelBtn" class="otherType" type="button" value="호텔" onclick="typeList_go(3)">
					<input id="hosBtn" class="otherType" type="button" value="동물병원(24시)" onclick="typeList_go(4)">
				</div>	
					<c:if test="${not empty withpetList }">
						<c:forEach begin="${pvo.begin }" end="${pvo.begin + 8 }" step="4" varStatus="status">
							<div id="rowDiv">
								<c:forEach var="withpet" items="${withpetList }" begin="${status.index }" end="${status.index+3 }">
									<div class="withpetList">
										<a href="getWithpet.do?widx=${withpet.widx }"><img src="/upload/${withpet.thumbnail }" class="thumbnailImg"/></a>
										<h4><a href="getWithpet.do?widx=${withpet.widx }">${withpet.placename }</a></h4>
										<c:if test="${withpet.placetype == 1 }">
											<a class='type' href='getWithpetListType.do?placetype=${withpet.placetype }'>음식점</a>
										</c:if>
										<c:if test="${withpet.placetype == 2 }">
											<a class='type' href='getWithpetListType.do?placetype=${withpet.placetype }'>카페</a>
										</c:if>
										<c:if test="${withpet.placetype == 3 }">
											<a class='type' href='getWithpetListType.do?placetype=${withpet.placetype }'>호텔</a>
										</c:if>
										<c:if test="${withpet.placetype == 4 }">
											<a class='type' href='getWithpetListType.do?placetype=${withpet.placetype }'>동물병원(24시)</a>
										</c:if>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty withpetList }">
						<div class="center">등록된 게시글이 없습니다.</div>
					</c:if>
				<!-- 데이터 표시 영역 끝 -->
				
				<div id="newReg" class="hiddenBtn"><a href="insertWithpet.jsp">새글등록</a></div>
				
				<!-- 페이징 시작 부분 -->
				<ol class="bpage">
					<c:choose>
						<c:when test="${pvo.beginPage == 1 }">
							<li class="disable">&lt;</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="getWithpetList.do?cPage=${pvo.beginPage-1 }&placetype=${type}">&lt;</a>
							</li>
						</c:otherwise>
					</c:choose>
					<%-- 블록 내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
						<c:choose>
							<c:when test="${pageNo == pvo.nowPage }">
								<li class="now">${pageNo }</li>
							</c:when>
							<c:otherwise>
								<li class="others"><a href="getWithpetList.do?cPage=${pageNo }&placetype=${type}">${pageNo }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pvo.endPage < pvo.totalPage}">
						<li><a href="getWithpetList.do?cPage=${pvo.endPage+1 }&placetype=${type}">&gt;</a></li>
					</c:if>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">&gt;</li>
					</c:if>
				</ol>
				<!-- 페이징 끝 부분 -->
				
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	<!-- .container -->
	<%@include file="footer.jsp" %>
</div>
<!-- #page -->
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>