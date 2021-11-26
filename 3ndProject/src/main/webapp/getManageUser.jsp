<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 관리</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
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
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='remove']").on("click", function(e) {
			var yn = confirm("회원 정보를 삭제하시겠습니까?");
			if (yn == true){
			operForm.attr("action", "deleteMember.do");
			console.log("dddddd");
			operForm.submit();
			} else if (yn == false) {
				history.back();
			}
			
			
		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#midx").remove();
			operForm.attr("action", "getMemberList.do");
			operForm.submit();
		});

		// 수정페이지 디스플레이
		$("#updateMem").click(function(e) {

			
			e.preventDefault();
			$(".updatePage").css("display", "block");
			$(".detailPage").css("display", "none");
		});

		$("#cancel").click(function() {
			
			$(".updatePage").css("display", "none");
			$(".detailPage").css("display", "block");
		});

	});
	
	
	
</script>
<style>

/* .profile-pic {
	border: 1px solid lightgrey;
	border-radius: 50px;
	width: 100px;
	height: 100px;
	margin: 20px;
	margin-left: 30px;
} */


.detailPage {
	margin: 0 auto;
}

.updatePage {
	display: none;
}

#img {
	border: 1px solid lightgrey;
	border-radius: 5px;
	width: 180px;
	height: 180px;
	margin: 0 auto;
	
}

.btn_t {
	position: relative;
	left: 50%;
	transform: translate(-50%, -50%);
	margin-top: 50px;
	text-align: center;
}

button {
	border-radius: 3px;
	background: #ffba00;
	border: #ffba00;
	color: white;
	font-family: 'Gowun Dodum';
}

.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}

h2{
	font-family: 'Gowun Dodum';
}

::selection {
	background: #ffba00;
	color: #fff;
}

#primary {
    width: 50%;
    float: none !Important;
	margin: 0 auto;
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
					<div class="detailPage">
						<div>
							<h2>회원 정보</h2>
						</div>
						<div>
							<table id="detail">
								<colgroup>
									<col style="width: 20%">
								</colgroup>
								<tr class="profile-pic">
									<td colspan="2" style="text-align: center;"><img id="img" src="${member.mphoto }"></td>
								</tr>
								<tr class="items">
									<th>이메일</th>
									<td>${member.memail }</td>
								</tr>
								<tr class="items">
									<th>닉네임</th>
									<td>${member.mnickname }</td>
								</tr>
								<tr class="items">
									<th>휴대폰번호</th>
									<td>${member.mphone }</td>
								</tr>
								<tr class="items">
									<th>회원타입</th>
									<td><c:if test="${member.mlevel eq 1 }">관리자</c:if> <c:if
											test="${member.mlevel eq 2 }">직원</c:if> <c:if
											test="${member.mlevel eq 3 }">일반회원</c:if> <c:if
											test="${member.mlevel eq 4 }">탈퇴예정회원</c:if></td>
								</tr>
								<tr>
									<c:if test="${member.mlevel eq 4 }">
										<th>탈퇴 신청 경과 일수</th>
										<td>${member.mdate }일</td>
									</c:if>
									
								</tr>
							</table>
							<!-- <button id="updateMem" data-oper="modify">수 정</button>
								<button data-oper="remove" class="btn btn-primary btn-sm">삭 제</button>		         	
								<button data-oper="list">목 록</button> -->
			
							<div class="btn_t">
								<form id='operForm' action="" method="get">
									<input type="hidden" name="midx" value="${member.midx }">
									<input type="hidden" name="pageNum" value="${cri.pageNum}">
									<input type="hidden" name="amount" value="${cri.amount}">
									<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
									<span><button id="updateMem">수 정</button></span> 
									<span><button data-oper="remove">삭 제</button></span> 
									<span><button data-oper="list">목 록</button></span>
								</form>
								<%-- <form id='operForm' action="/board/modify" method="get">
								<input type="hidden" id="bno" name="bno" value="${board.bno}">
								<input type="hidden" name="pageNum" value="${cri.pageNum}">
								<input type="hidden" name="amount" value="${cri.amount}"> 
								<button data-oper="modify" class="btn btn-primary btn-sm">Modify</button>
								<button data-oper="list" class="btn btn-primary btn-sm">List</button>
						    </form> --%>
							</div>
						</div>
					</div>
					<div class="updatePage">
						<div>
							<h2>회원 수정</h2>
						</div>
						<div>
							<form action="updateMember.do" method="get" >
							
								<table class="table">
								<colgroup>
									<col style="width: 20%">
								</colgroup>
									<tr class="profile-pic">
										<td colspan="2" style="text-align: center;"><img id="img" src="resources/images/profile.png"></td>
									</tr>
									<tr>
										<th>이메일</th>
										<td><input type="text" name="memail"
											value="${member.memail }" style="height: 30px; border-radius: 3px;"></td>
									</tr>
									<tr>
										<th>닉네임</th>
										<td><input type="text" name="mnickname"
											value="${member.mnickname }" style="height: 30px; border-radius: 3px;"></td>
									</tr>
									<tr>
										<th>휴대폰번호</th>
										<td><input type="text" name="mphone" value="${member.mphone }" placeholder="미등록" style="height: 30px; border-radius: 3px;"></td>
									</tr>
									<tr>
										<th>회원타입</th>
										<td><c:if test="${member.mlevel eq 1 }">
												<select name="mlevel">
													<option value="1" selected>관리자
													<option value="2">직원
													<option value="3">일반회원
													<option value="4">탈퇴예정회원
												</select>
											</c:if> <c:if test="${member.mlevel eq 2 }">
												<select name="mlevel">
													<option value="1">관리자
													<option value="2" selected>직원
													<option value="3">일반회원
													<option value="4">탈퇴예정회원
												</select>
											</c:if> <c:if test="${member.mlevel eq 3 }">
												<select name="mlevel">
													<option value="1">관리자
													<option value="2">직원
													<option value="3" selected>일반회원
													<option value="4">탈퇴예정회원
												</select>
											</c:if> <c:if test="${member.mlevel eq 4 }">
												<select name="mlevel">
													<option value="1">관리자
													<option value="2">직원
													<option value="3">일반회원
													<option value="4" selected>탈퇴예정회원
												</select>
											</c:if></td>
									</tr>
								</table>
								<div class="btn_t">
									<input type="hidden" name="midx" value="${member.midx }">
									<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
									<input type="submit" value="글 수정" style="border-radius: 3px; background: #ffba00; border: #ffba00; color: white; font-family: 'Gowun Dodum';"> 
									<input type="button" value="취 소" id="cancel" style="border-radius: 3px; background: #ffba00; border: #ffba00; color: white; font-family: 'Gowun Dodum';">
								</div>
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