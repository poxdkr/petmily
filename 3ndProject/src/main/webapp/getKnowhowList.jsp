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
	.thumbnail_img { /* 이미지들 */
		width: 282px;
		height: 282px;
	}
	.titleController {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		width: 282px;
		margin: 0;
	}
	.center {
		text-align: center;
	}
	#typeBtn {  /* 강아지/고양이를 덮고 있는 div */
		margin-top: 15px;
		margin-bottom: 15px;
	}
	#typeBtn input {
		border-radius: 5px;
		margin-right: 10px;
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
	#knowhowBoard {  /* 게시글을 가장 바깥에서 감싸고 있는 div */
		margin-top: 50px;
	}
	#knowhowBoard .knowhow {  /* 각각의 게시글을 감싸고 있는 div */
		display: inline-block;
		margin-right: 10px;
		margin-left: 15px;
		margin-bottom: 40px;
	}
	.bpage {  /* 페이지를 감싸고 있는 ol태그*/
		float: right;
		position: relative;
		list-style: none;
		margin-bottom: 30px;
		right: 45%;
		bottom: 30px;
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
	#typeBtn .nowType {
		background-color: #ECD26D;
		border: none;
	}
	#typeBtn .otherType {
		background-color: #ffbb00;
		border: none;
	}
	.categoryBtn-item { /* 카테고리 이미지 */
		display: inline-block;
		width: 180px;
	}
	.categoryBtn-item:hover {
		cursor: pointer;
	}
	.categoryBtn-item.active {
		opacity: 1;
		border: 1px solid #e4e4e4;
		box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16);
	}
	#category {
		text-align: center;
		margin-top: 30px;
		margin-bottom: 70px;
	}
	#category h2 {
		text-align: center;
	}
	.animalType {
		color: #4AC96D;
		font-weight: bold;
	}
	#topDiv {  /* 카테고리 버튼 + 입력바 부분 */
		position: relative;
		background-color: #F4F4F5;
	}
	#firstBox {  /* 네비게이션 바 부분 */
		position: relative;
		left: 50%;
		transform: translate(-38%);
	}
	#site-navigation {  /* 네비게이션 바 부분 */
		width: 960px;
	}
	#boardType {  /* 노하우 게시판 */
		margin-left: 150px;
		margin-top: 0;
	}
	.input-group {  /* 검색창과 검색버튼 */
		margin-left: 150px;
		position: relative;
		bottom: 20px;
	}
	#masthead {
		padding-bottom: 0;
	}
	#insertBtn {  /* 글쓰기 버튼 */
		margin-bottom: 60px;
		position: relative;
		left: 85%;
	}
	#insertBtn button {
		background-color: #ffbb00;
		border: none;
		border-radius: 5px;
		color: white;
	}
	.likeCnt {
		position: relative;
		left: 180px;
	}
	.heart_img {
		width: 15px;
	}
	.cnt {
		margin-left: 5px;
		font-size: 17px;
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
			$(".N").addClass("active");
		} else if (${type == 4}) {
			$(".II").addClass("active");
		} else if (${type == 5}) {
			$(".I").addClass("active");
		}
		
		if (${user.midx} != -1) {
			$('#insertBtn').removeClass('hiddenBtn');
		}
	});
	
	//강아지/고양이 선택해서 출력
	function typeList_go(boardcate) {
		
		location.href = "getKnowhowList.do?boardcate="+boardcate;
	}
	//전체 리스트 출력
	function list_go() {
		location.href = "getKnowhowList.do";
	}
	//검색 실행
	function enterkey(check) {
		let search = document.getElementById("inputSearch").value;
		if (window.event.keyCode == 13) {
			location.href="getKnowhowList.do?searchKeyword="+search;
		}
		if (check == 1) {
			location.href="getKnowhowList.do?searchKeyword="+search;
		}
	}
	
	//노하우 게시글 등록
	function insert_go() {
		location.href =  "insertKnowhow.jsp";
	}
	
</script>

		<header id="masthead" class="site-header">
		<div class="site-branding">
			<%@ include file="header.jsp" %>
		</div>
		</header>
	<div id="totalDiv">		
		<div id="topDiv">
			<h3 id="boardType">노하우 게시판</h3>
		    <!-- 카테고리 -->
		    <div id="category">
			    <div class="categoryBtn-item N" onclick="list_go()">
					<img src="resources/images/all.png" alt="">
					<h2>전체</h2>
					<p>[${map.total }]</p>
				</div>
				<div class="categoryBtn-item II" onclick="typeList_go(4)">
					<img src="resources/images/dog.png" alt="">
					<h2>강아지</h2>
					<p>[${map.total2 }]</p>
				</div>
				<div class="categoryBtn-item I" onclick="typeList_go(5)">
					<img src="resources/images/cat.png" alt="">
					<h2>고양이</h2>
					<p>[${map.total3 }]</p>
				</div>
			</div>
			<!-- #masthead -->
			
			<!-- 검색바 -->
		    <div class="input-group">
		      <input type="text" name="searchKeyword" placeholder="검색할 내용을 입력해주세요." onkeyup="enterkey()" id="inputSearch">
		      <span>
		        <button id="searchBtn" type="button" onclick="enterkey(1)">검색</button>
		      </span>
		    </div>
	    </div>
	    <!-- topDiv -->
		
		<div id="knowhowBoard">
		<c:if test="${not empty knowhowList }">
			<c:forEach begin="${pvo.begin }" end="${pvo.begin + 8 }" step="4" varStatus="status">
				<div class="rowDiv">
					<c:forEach var="knowhow" items="${knowhowList }" begin="${status.index }" end="${status.index+3 }">
						<div class="knowhow">
						<a href="getKnowhow.do?bidx=${knowhow.bidx }"><img class="thumbnail_img" src="/upload/${knowhow.bpict1 }"/></a>
						<c:if test="${knowhow.boardcate == 4 }">
							<div>
								<a class='animalType' href='getKnowhowListType.do?boardcate=${knowhow.boardcate }'>강아지</a>
								<span class="likeCnt">
								<img class="heart_img" src="resources/images/like1.jpg"><span class="cnt">${knowhow.likecnt }</span>
								</span>
							</div>
						</c:if>
						<c:if test="${knowhow.boardcate == 5 }">
							<div>
								<a class='animalType' href='getKnowhowListType.do?boardcate=${knowhow.boardcate }'>고양이</a>
								<span class="likeCnt">
								<img class="heart_img" src="resources/images/like1.jpg"><span class="cnt">${knowhow.likecnt }</span>
								</span>
							</div>
						</c:if>
						<h4 class="titleController"><a class="knowhowTitle" href="getKnowhow.do?bidx=${knowhow.bidx }">${knowhow.btitle }</a></h4>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${empty knowhowList }">
			<div class="center">등록된 게시글이 없습니다.</div>
		</c:if>
		</div>
		<!-- 데이터 표시 영역 끝 knowhowBoard -->
		
		<div id="insertBtn" class="hiddenBtn"><button onclick="insert_go()">글등록</button></div>		
				
		<!-- 페이징 시작 부분 -->
		<ol class="bpage">
			<c:choose>
				<c:when test="${pvo.beginPage == 1 }">
					<li class="disable">&lt;</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="getKnowhowList.do?cPage=${pvo.beginPage-1 }&boardcate=${type}">&lt;</a>
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
						<li class="others"><a href="getKnowhowList.do?cPage=${pageNo }&boardcate=${type}">${pageNo }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pvo.endPage < pvo.totalPage}">
				<li><a href="getKnowhowList.do?cPage=${pvo.endPage+1 }&boardcate=${type}">&gt;</a></li>
			</c:if>
			<c:if test="${pvo.endPage >= pvo.totalPage }">
				<li class="disable">&gt;</li>
			</c:if>
		</ol>
		<!-- 페이징 끝 부분 -->
	</div>			
	<%@ include file="footer.jsp" %>
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>