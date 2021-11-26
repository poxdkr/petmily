<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 상품 목록</title>
<!-- include libraries(jQuery, bootstrap) -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

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


<script>
$(function() {

  var actionForm = $("#actionForm");

  $(".page-item a").on("click", function(e) {
	e.preventDefault();  //전송을 막음
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
  });
  
  $(".move").on("click", function(e) {
		
		e.preventDefault();
		actionForm
			.append("<input type='hidden' name='aidx' value='"
				+ $(this).attr("href") + "'>");
		actionForm
			.append()
		actionForm.attr("action", "getAdvertise.do");
		actionForm.submit();
		
	});
  
  $(".search_area button").on("click", function(e){
      e.preventDefault();
      let val = $("input[name='keyword']").val();
      actionForm.find("input[name='keyword']").val(val);
      actionForm.find("input[name='pageNum']").val(1);
      actionForm.submit();
  });
});

</script>

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


.search_area {
	position: relative;
	left: 678px;
}

.insert_button{
	text-align: right;
	margin-right: 3px;
}
table {
	margin: 0px 0px 20px;
	
	border-top: 1px solid #ffba00;
    border-bottom: 1px solid #ffba00;
}

table tr th{
	text-align: center;
	font-family: 'Gowun Dodum';
}

table tr td{
	padding: 20px;
	font-family: 'Gowun Dodum';
}
a:hover {
	color: #ffba00;
}

.pagination {
	margin: 0 auto;
	margin-bottom: 40px;
	padding: 0px;
	text-align: center;
	
}

.page_position {
	margin: 0 auto;
	text-align: center;
}

h2 {
	font-family: 'Gowun Dodum';
	font-size: 30px;
	margin: 20px 0px 10px;
}

button {
	
	background: #ffba00;
	border: #ffba00;
	color: white;
}
.pagination a{
	background: #ffba00;
	font-family: 'Gowun Dodum';
	border: 1px solid #ffba00;
}
.pagination a:hover {
		
}

.site-content {
	color: black;
	font-family: 'Gowun Dodum';
	
}

::selection {
	background: #ffba00;
	color: #fff;
}

.move2:hover {
	cursor: pointer;
	color: #ffba00;
	transform:scale(1.01, 1.1);
	
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
					<div>
					<h2>광고 상품 관리</h2>
					</div>
						<div class="btn">
							<div class="search_area">
								<span><input type="search" name="keyword" placeholder="광고 통합 검색" value="${pageMaker.cri.keyword }" style="width: 170px; border-radius: 5px; font-family: 'Gowun Dodum', sans-serif;"></span>
								<span><button style="font-size: 15px; border-radius: 3px; margin-right: 10px;">
									검색
								</button></span>
							</div>
						</div>
						<table>
							<tr>
				           		<th>썸네일</th>
				           		<th>광고</th>
				           		<th>등록일</th>
				           		<th>클릭수</th>
				           	</tr>
					 	<colgroup>
				            <col style="width: 15%;">
				            <col style="width: 45%;">
				            <col style="width: 20%;">
				            <col style="width: 20%;">
				        </colgroup>
						<c:if test="${not empty advertiseList }">
						<c:forEach var="list" items="${advertiseList }" >
							<tr class="move2" >
								<td><img class="img" src="/upload/${list.apicture }" alt=""></td>
								<td style="text-align: center;"><a class="move" href="${list.aidx }">${list.atitle }</a></td>
								<td style="text-align: center;">${list.aregdate }</td>
								<td style="text-align: center;">${list.acount }</td>
								
							</tr>
						
						</c:forEach>
						</c:if>
						
						<c:if test="${empty advertiseList }">
							<tr>
								<td colspan="3">등록된 데이터가 없습니다.</td>
							</tr>
						</c:if>
						</table>
					<div class="insert_button">
						<button onclick="location.href='insertAdvertise.jsp'" style="font-size: 14px; border-radius: 3px; font-family: 'Gowun Dodum'; margin-right: 10px;">등 록</button>
					</div>
					<!-- Paging ------------------------->
						<div class="page_position" style="width: 550px;">
						    <ul class="pagination">
						        <c:if test="${pageMaker.prev }">
						            <li class="page-item prev">
						                <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
						            </li>
						        </c:if>
						        
						        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						            <li class="page-item">
						                <a class="page-link" href="${num }">${num }</a>
						            </li>
						        </c:forEach>
						        
						        <c:if test="${pageMaker.next }">
						            <li class="page-item next">
						                <a class="page-link" href="${pageMaker.endPage +1 }">Next</a>
						            </li>
						        </c:if>
						    </ul>
						</div>
						<!-- Paging End -->
						<div>
							<form id='actionForm' action="getAdvertiseList.do" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
							</form>
						</div>

					</main>
				<!-- #main -->
			</div>
			<!-- #primary -->
		</div>
		<!-- #content -->
	</div>
	<!-- .container -->
	<%@ include file="footer.jsp" %>
</div>

<!-- #page -->
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>

</body>
</html>