<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>report</title>
<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Batang&family=Gowun+Dodum&family=Gugi&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<style>
	
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
	
ol>li {
	list-style: none;
	float: left;
}

.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}

h1 {
	font-family: 'Gowun Dodum';
	
}

::selection {
	background: #ffba00;
	color: #fff;
}

li.now {
    
    background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;
    width: 30px;
    height: 29px;
    font-size: 17px;
}

ol {
    width: 200px;
   margin: auto;
    
}

#primary {
    width: 700px;
    margin: 0 auto;
}


</style>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
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
				<main id="main" class="site-main">


	<h1>신고 관리</h1>

	<table>
		<tr>
		    <th>글종류</th>
		    <th>글번호</th>
		    <th>신고횟수</th>
	  	</tr>
	
		<c:if test="${not empty reportList }">
			<c:forEach var="report" items="${reportList }" begin="${pvo.begin }" end="${pvo.begin + 9 }">
			<tr>
				<c:if test="${report.rtype == 1 }">
					<td>[게시판신고]</td>
				</c:if>	
				<c:if test="${report.rtype == 2 }">
					<td>[댓글신고]</td>
				</c:if>	
				<td>
					<c:if test="${report.rtype == 1 }">
						<a href="reportSecondBoard.do?rnum=${report.rnum }&rtype=${report.rtype }">신고된 글  ${report.rnum } 번</a>
					</c:if>	
					<c:if test="${report.rtype == 2 }">
						<a href="reportSecondReply.do?rnum=${report.rnum }&rtype=${report.rtype }&bidx=${report.bidx }">신고된 글  ${report.rnum }  번</a>
					</c:if>	
					
										
				</td>
				<td>${report.rcount}  회</td>
			</tr>
			</c:forEach>
		</c:if>	
		<c:if test="${empty reportList }">
			<tr>
				<td colspan="5" class="center">데이터가 없습니다</td>
			</tr>
		</c:if>
	</table>
	 
	<!-- 페이징 시작 부분 -->
	<div class="pageDiv">
	<ol class="pagination">
		<c:choose>
			<c:when test="${pvo.beginPage == 1 }">
				<li class="disable">&lt;</li>
			</c:when>
			<c:otherwise>
				<li>
					<a href="report.do?cPage=${pvo.beginPage-1 }">&lt;</a>
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
					<li class="others"><a href="report.do?cPage=${pageNo }">${pageNo }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pvo.endPage < pvo.totalPage}">
			<li><a href="report.do?cPage=${pvo.endPage+1 }">&gt;</a></li>
		</c:if>
		<c:if test="${pvo.endPage >= pvo.totalPage }">
			<li class="disable">&gt;</li>
		</c:if>
	</ol>
	</div>
	<!-- 페이징 끝 부분 -->
</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	<!-- .container -->
	<footer id="colophon" class="site-footer">
	<div class="container">
		<div class="site-info">
			<h1 style="font-family: 'Herr Von Muellerhoff';color: #ccc;font-weight:300;text-align: center;margin-bottom:0;margin-top:0;line-height:1.4;font-size: 46px;">Moschino</h1>
			Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a>
		</div>
	</div>	
	</footer>
	<a href="#top" class="smoothup" title="Back to top"><span class="genericon genericon-collapse"></span></a>
</div>


	
<!-- #page -->

</body>
</html>