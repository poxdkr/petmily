<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqList페이지</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	// 	$(document).ready(function(){
	// 		$("#faqList").click(getJsonFaqList);
	// 		alert("클릭이벤트발생")
	// 	});

	//제목으로 검색해서 리스트 불러오기
	function getJsonFaqList() {

		var ftitle = $("#ftitle").val();
		let vo = {
			ftitle : ftitle
		};
		console.log(vo);
		console.log(JSON.stringify(vo));

		$.ajax("getJsonFaqList.do", {
			type : "post",
			data : JSON.stringify(vo),
			dataType : "json", //서버로부터 응답받을 데이터 형식 
			contentType : "application/json",

			success : function(data) {

				console.log(data);
				var ftitle = $("#ftitle").val();
				if (ftitle.trim() == "") {
					alert("검색어를 입력해주세요");
				} else if (data.length == 0) {
					alert("해당 검색어로 조회되는 정보가 없습니다.");
				} else {

					let dispHtml = "<table>";
					$.each(data, function(index, obj) {
						dispHtml += "<tr><td>";
						dispHtml += "[" + this.fcategory + "]</td>";
						dispHtml += "  <td><a href='javascript:getBoardDetail("
								+ this.fidx;
						dispHtml += ")'>" + this.ftitle + "</a></span></td>";
						dispHtml += "</tr>";
					});
					dispHtml += "</table>";
					$("#listDisp").html(dispHtml);
				}
			},
			error : function() {
				alert("실패");
			}

		});
	}

	$(document).ready(function() {
		$('.faqbutton').click(function() {
			let idCheck = $(this).attr("id");
			console.log(idCheck);

			buttonFaqList(idCheck);

		});
	});

	//카테고리 버튼으로 리스트 불러오기 
	function buttonFaqList(idCheck) {

// 		alert("buttonFaqList() 실행");
		console.log(idCheck);

		if (idCheck == 'frequency') {
			idCheck = "자주하는질문";
		} else if (idCheck == 'site') {
			idCheck = "사이트이용";
		} else if (idCheck == 'members') {
			idCheck = "계정관리";
		} else if (idCheck == 'other') {
			idCheck = "그외오류";
		}

		var fcategory = idCheck;
		var vo = {
			fcategory : fcategory
		};
		console.log("vo " + vo);
		console.log(JSON.stringify(vo));

		$.ajax("buttonFaqList.do", {
			type : "post",
			data : JSON.stringify(vo),
			dataType : "json", //서버로부터 응답받을 데이터 형식 
			contentType : "application/json",

			success : function(data) {
// 				alert("성공");
				console.log(data);
				let dispHtml = "<table>";
				$.each(data, function(index, obj) {
					dispHtml += "<tr><td>";
					dispHtml += "[" + this.fcategory + "]</td>";
					dispHtml += "  <td><a href='javascript:getBoardDetail("
							+ this.fidx;
					dispHtml += ")'>" + this.ftitle + "</a></span></td>";
					dispHtml += "</tr>";
				});
				dispHtml += "</table>";
				$("#listDisp").html(dispHtml);

			},
			error : function() {
				alert("실패");
			}

		});

	};
	//게시글 상세보기 
	function getBoardDetail(fidx) {
// 		alert("getBoardDetail()실행");
		$(".faqDetail").css("display", "block");
		$(".faqListPage").css("display", "none");

		$("#cancel").click(function() {
			alert("취소");
			$(".faqDetail").css("display", "none");
			$(".faqListPage").css("display", "block");
		});

		var vo = {
			fidx : fidx
		};
		console.log("vo " + vo);
		console.log("JSON : " + JSON.stringify(vo));

		$
				.ajax(
						"getFaqBoard.do",
						{
							type : "post",
							data : JSON.stringify(vo),
						dataType : "json", //서버로부터 응답받을 데이터 형식 
							contentType : "application/json",
							success : function(data) {
// 								alert("성공");
								console.log(data);
								let dispHtml = "<table>";

								dispHtml += "<tr><th>질문분류<th><td>"
										+ data.fcategory + "</td></tr>";
								dispHtml += "<tr><th>제목<th><td>" + data.ftitle
										+ "</td></tr>";
								dispHtml += "<tr><th>내용<th><td><p>"
										+ data.fcontent + "</p></td></tr>";

								dispHtml += "</table>";
								dispHtml += "<div class=\"faqDetailButton\"><c:if test='${user.mlevel == 1 or user.mlevel == 2}'><input style=\"margin: 5px;background: #ffba00;color: white;border: 1px solid; #ffba00;border-radius: 5px;\" type=\"button\" onclick=\"location.href='thisBoardInfo.do?fidx="
										+ data.fidx + "'\" value=\"Faq 수정\">";
								dispHtml += "<input style=\"margin: 5px;background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;\" type=\"button\" onclick=\"faqDelete("
										+ data.fidx + ")\" value=\"Faq 삭제\"></c:if>";
								
								dispHtml += "<input style=\"margin: 5px;background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;\" type=\"button\" onclick=\"location.href='faqList.jsp'\" value=\"돌아가기\"><div>"
								$("#detailDisp").html(dispHtml);

							},
							error : function() {
								alert("실패");
							}

						});

	}
	
	function faqDelete(deleteFidx) {
		var fidx = deleteFidx;
		
		alert("deleteFidx : " + deleteFidx);
		var confirmFaqDelete = confirm("해당 FAQ를 삭제하시겠습니까?")
		if(confirmFaqDelete == true) {
			
			alert("삭제되었습니다.");
			location.href="deleteFaq.do?fidx="+fidx; 
		}else if(confirmFaqDelete == false) {
			
		}
		
	}
	
	
</script>
</head>

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

#faqTitle {
	text-align: center;
}

.box1 {
	text-align: right;
}

.box2 {
	
}

.faqbutton {
	width: 190px;
	height: 200px;
	margin: 20px;
	background-color: white;
	
}

.faqimg {
	width: 170px;
	height: 190px;
}

em {
	font-size: 18px
}

#faqh1 {
    
    width: 100px;
    
}

#faqButtonDiv {
	
}

.form-control {
    
    display: inline-block;
}

.aaa {
	float : right;
	margin-top: 35px;	
	margin-right: 30px;
}

#faqEmail {
    background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;
    
}

.emailDiv {
	text-align : center;
}

.faqWrightButton {
	background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;
    margin-left: 846px;
    margin-bottom: 30px;
}


#searchButton {
     background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;
    
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

.faqDetail {
	position: a
}

.faqDetailButton {
	margin-bottom: 30px;
	text-align: center;
}
.faqDetailButton1 {
	background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;
}

.faqbutton {
    
    border: 0px;
}

/* .faqDetail { */
/* 	margin-left: 150px; */
/* 	margin-right: 150px; */
/* } */

p {
	font-family: 'Gowun Dodum';
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


						<div class=faqListPage>
							<div>

								<div id="faqTitle">
									<h1 id="faqTitle">고객센터</h1>
									<div class="box1">
									<p id="faqTitle">문제가 해결되지 않는 경우 하단의  [E-MAIL로 문의하기] 를 이용 해
										주세요 ^^</p>
										
										
								</div>
									
								</div>
								
								<br>

							<div class="emailDiv">
								<button id="faqEmail" onclick="location.href='sendMail.jsp'"
									style="font-size: 25px;">이메일로 문의하기</button>
							</div>
							
							<br>


							</div>

													
								<div id="float2">
									<div class="form-control">
										<img src="resources/images/faq.png" id="faqh1">
									</div>
									
									<div class="aaa">
									

									<div id="faqSearch" class="form-control">
										<input type="text" name="ftitle" id="ftitle" placeholder="문의내용" style="border-radius: 5px;"> <input
											type="button" onclick="getJsonFaqList()" value="검색" id="searchButton">
									</div>
									</div>
								</div>
							
							<div id="faqButtonDiv">
								<button name="frequency" id="frequency" class="faqbutton">
									<span><img src="resources/images/fre.png" class="faqimg"></span>
									<em>자주하는질문</em>
								</button>
								<button name="site" id="site" class="faqbutton">
									<span><img src="resources/images/site.png" class="faqimg"></span>
									<em>사이트이용</em>
								</button>
								<button name="members" id="members" class="faqbutton">
									<span><img src="resources/images/user.png" class="faqimg"></span>
									<em>계정관리</em>
								</button>
								<button name="other" id="other" class="faqbutton">
									<span><img src="resources/images/others.png" class="faqimg"></span>
									<em>그 외 오류</em>
								</button>
							</div>

							<table>
								<c:forEach var="getReport" items="${faqList }">
									<tr>
										<td>${faq.fidx }</td>
										<td><a href="faqGetBoard.do?fidx=${faq.fidx }">${faq.ftitle }</a>
										</td>
									</tr>
								</c:forEach>
							</table>



							<div id="listDisp">
								<!-- list표시영역 -->
							</div>

							<c:if test="${user.mlevel eq 1 }">
							<button onclick="location.href='insertFaq.jsp'" class="faqWrightButton">FAQ작성</button>
							</c:if>
							<c:if test="${user.mlevel eq 2 }">
							<button onclick="location.href='insertFaq.jsp'" class="faqWrightButton">FAQ작성</button>
							</c:if>

						</div>
						<div class="faqDetail" id="detailDisp">
							
							<!--게시글상세보기표시영역  -->
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