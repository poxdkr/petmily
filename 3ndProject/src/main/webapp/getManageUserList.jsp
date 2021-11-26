<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


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
  
  $(".move1").on("click", function(e) {

		e.preventDefault();
		actionForm
			.append("<input type='hidden' name='midx' value='"
				+$(this).attr("href") + "'>");
		actionForm.attr("action", "getMember.do");
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

// 카테고리
function filterUser1() {
	location.href = "filterUser1.do";
	
}

function filterUser2() {
	location.href = "filterUser2.do";
	
}
function getMemberList() {
	location.href = "getMemberList.do";
}

</script>
<style>


table th, td{
	padding: 5px 10px;
	text-align: center;
}

button {
	border-radius: 3px;
	background: #ffba00;
	border-color: #ffba00;
	color: white;
}
.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}

button:hover {
	background: #ffba00;
	
}
a:hover { 
	color: #ffba00;
}

table tr th {
	font-size: 18px;
}
.page_div {
	margin: 0 auto; 
	width: 50%;
}

.pagination {
	margin: 0 auto;
	margin-bottom: 40px;
	padding: 0px;
	text-align: center;
	
}
.pagination a{
	background: #ffba00;
	font-family: 'Gowun Dodum';
}


h2{
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
</head>
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
						<h2>회원 관리</h2>
					</div>
					<div>
						
						<div>
							<span><button onclick="getMemberList()">전체</button></span>
							<span><button onclick="filterUser1()">일반회원</button></span>
							<span><button onclick="filterUser2()">탈퇴예정회원</button></span>
							<div class="btn">
								<div class="search_area" style="position: relative; left: 445px;">
									<span><input type="text" name="keyword" value="${pageMaker.cri.keyword }" style="border-radius: 5px; width: 150px;"></span>
									<span><button style="font-size: 15px;">검색</button></span>
								</div>
							</div>
						</div>
						
						<table>
							<colgroup>
								<col style="width: 20%">
								<col style="width: 20%">
								<col style="width: 40%">
								<col style="width: 20%">
							</colgroup>
							<!-- <thead> -->
								<tr>
									<th>회원번호</th>
									<th>닉네임</th>
									<th>이메일</th>
									<th>회원타입</th>
									
								</tr>	
							<!-- </thead> -->
							<tbody>
								<c:if test="${not empty memberList }">
								<c:forEach var="vo" items="${memberList }">
								<tr class="move2">
									<td>${vo.midx }</td>
										
									<td><a class="move1" href="${vo.midx }">${vo.mnickname }</a></td>
									
									<td>${vo.memail }</td>
									<td>
										<c:if test="${vo.mlevel eq 1 }">관리자</c:if>
										<c:if test="${vo.mlevel eq 2 }">직원</c:if>
										<c:if test="${vo.mlevel eq 3 }">일반회원</c:if>
										<c:if test="${vo.mlevel eq 4 }">탈퇴예정회원</c:if>
									</td>
									
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${empty memberList }">
								<tr>
									<td colspan="5">등록된 데이터가 없습니다.</td>
								</tr>
								</c:if>				
							</tbody>
						</table>
						
						<!-- Paging ------------------------->
						<div class="page_div">
						    <ul class="pagination">
						        <c:if test="${pageMaker.prev }">
						            <li class="page-item previous">
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
							<form id='actionForm' action="getMemberList.do" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
								
								
							</form>
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
	<%@ include file="footer.jsp" %>
</div>


	
<!-- #page -->
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>