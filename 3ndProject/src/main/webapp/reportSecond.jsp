<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reportDetail</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

 function reportBack() {
	 history.back();
 }
 
 function reportReset(data) {
	 
	 var rnum = data;
	 
		var confirmFaqDelete = confirm("해당 글에 대한 신고를 모두 삭제하시겠습니까?")
		if(confirmFaqDelete == true) {
			
			alert("삭제되었습니다.");
			location.href="onlyReportDelete.do?rnum=" + rnum;
		}else if(confirmFaqDelete == false) {
			
		}
 }
	
</script>

<link rel='stylesheet' href='resources/css/woocommerce-layout.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css'
	type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' href='resources/css/woocommerce.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/font-awesome.min.css'
	type='text/css' media='all' />
<link rel='stylesheet' href='resources/style.css' type='text/css'
	media='all' />
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700'
	type='text/css' media='all' />
<link rel='stylesheet'
	href='resources/css/easy-responsive-shortcodes.css' type='text/css'
	media='all' />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gowun+Batang&family=Gowun+Dodum&family=Gugi&family=Hi+Melody&family=Jua&display=swap" rel="stylesheet">
</head>
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
.reportDetailbuttons {
	background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;
}

::selection {
	background: #ffba00;
	color: #fff;
}

.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}

h1 {
	font-family: 'Gowun Dodum';
	
	
}
h4 {
	font-family: 'Gowun Dodum';
}

.reportDetailbuttonsDiv {
    
    margin-bottom: 30px;
    text-align: center;
}
.reportImg {
    margin-left: 90px;
}
.reportbtext {
    text-align: center;
}
</style>
<body
	class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<%@ include file="header.jsp"%>
				</div>
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main">
					<h1>신고정보</h1>
					
						<c:if test="${reportBoard.btitle != null}">
							<h4>작성자 Nickname :&nbsp&nbsp ${reportBoard.rtnick }&nbsp&nbsp&nbsp&nbsp&nbsp신고횟수 : &nbsp&nbsp${reportCount.rcount }&nbsp&nbsp회</h4>
						</c:if>
						<c:if test="${reportBoard.btitle == null}">
							<h4>작성자 Nickname :&nbsp&nbsp ${reportBoardReply.rtnick }&nbsp&nbsp&nbsp&nbsp&nbsp신고횟수 : &nbsp&nbsp${reportCount.rcount }&nbsp&nbsp회</h4>
						</c:if>
						

						<table>
							<tr>
								<c:if test="${reportBoard.btitle != null}">
								<th>${reportBoard.btitle }</th>
								</c:if>
							</tr>
							<c:if test="${reportBoard.btitle != null}">
								<tr>
								
									<td><img src="/upload/${reportBoard.bpict1 }" width="150" class="reportImg">
									<img src="/upload/${reportBoard.bpict2 }" width="150" class="reportImg">
									<img src="/upload/${reportBoard.bpict2 }" width="150" class="reportImg"></td>
								
								</tr>
							</c:if>
							
							<tr>
							<c:if test="${reportBoard.btitle != null}">
								<td style="text-align:center;">${reportBoard.btext }</td>
							</c:if>
							<c:if test="${reportBoard.btitle == null}">
								<td class="td1">${reportBoardReply.rcontent }</td>
							</c:if>
								
							</tr>
						</table>

						<table>
							<tr>
								<th>번호</th>
								<th>신고 내용</th>
								<th>신고자  Nickname</th>
								<th>신고 날짜</th>
								
							</tr>
							<c:forEach var="getReport" items="${getReportList }">
								
								<tr>
									<td>${getReport.ridx }</td>
									<td>${getReport.rcontent }</td>
									<td>${getReport.rfnick }</td>
									<td>${getReport.rregdate }</td>
								</tr>
							</c:forEach>
						</table>

						<div class="reportDetailbuttonsDiv">
						<c:if test="${reportBoard.btitle != null}">
							<input style="background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;" type="button"
								onclick="location.href='boardReportDelete.do?bidx=${reportBoard.bidx }&rnum=${getReportList[0].rnum }'"
								value="글삭제">
						</c:if>
						<c:if test="${reportBoard.btitle == null}">
							<input style="background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;" type="button"
								onclick="location.href='replyReportDelete.do?ridx1=${reportBoardReply.ridx1 }&rnum=${getReportList[0].rnum }'"
								value="글삭제">
						</c:if>

						<input style="background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;" type="button"
							onclick="reportReset(${getReportList[0].rnum })" value="신고 reset">
						<button style="background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;" onclick="reportBack()">돌아가기</button>
							
						</div>


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
					<h1
						style="font-family: 'Herr Von Muellerhoff'; color: #ccc; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">Moschino</h1>
					Shared by <i class="fa fa-love"></i><a
						href="https://bootstrapthemes.co">BootstrapThemes</a>

				</div>
			</div>
		</footer>
		<a href="#top" class="smoothup" title="Back to top"><span
			class="genericon genericon-collapse"></span></a>
	</div>



	<!-- #page -->
	<script src='resources/js/jquery.js'></script>
	<script src='resources/js/plugins.js'></script>
	<script src='resources/js/scripts.js'></script>
	<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>