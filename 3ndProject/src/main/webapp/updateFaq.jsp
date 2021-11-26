<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateFaq</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
$(document).ready(function() {
	//summernote 툴바 설정
	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']],
		    // 추가한 글꼴
		  ];
	
	//summernote 세팅
	var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            //  추가한 폰트 이름
            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
	   		 // 추가한 폰트사이즈
	   		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
            callbacks : { //여기 부분이 이미지를 첨부하는 부분
	            onImageUpload : function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		            		console.log(files[i].name)
				            uploadSummernoteImageFile(files[i], this);
		            }
	            }
            }
     };

        $('#summernote').summernote(setting);
      
});
</script>
</head>
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
	::selection {
	background: #ffba00;
	color: #fff;}
	
	.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}
	.updateFaqButton {
	background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;
	}
	.updateFaqButtons {
	margin-bottom: 30px;
	text-align: center;
	}
	h1 {
	font-family: 'Gowun Dodum';
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
<form action="updateFaq.do" method="post">
	<h1>FAQ 수정페이지</h1>
	<table>
		<tr>
			<th>질문분류</th>
			<td>
				<select name="fcategory">
					<option value="자주하는질문">자주하는질문</option>
					<option value="사이트이용">사이트이용</option>
					<option value="계정관리">계정관리</option>
					<option value="그외오류">그외오류</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" value="${faqBoard.ftitle }" name="ftitle"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea id="summernote" name="fcontent">${faqBoard.fcontent }</textarea>
			</td>
		</tr>
	</table>
	
	
	<br>
	<div class="updateFaqButtons">
	<input style="background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;" type="hidden" value="${faqBoard.fidx }" name="fidx" class="updateFaqButton">
	<input style="background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;" type="submit" id="insert" value="수정" class="updateFaqButton">
	<input style="background: #ffba00;color: white;border: 1px solid #ffba00;border-radius: 5px;" type="button" onclick="location.href='faqList.jsp'" value="취소" class="updateFaqButton">
	</div>
</form>
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
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>