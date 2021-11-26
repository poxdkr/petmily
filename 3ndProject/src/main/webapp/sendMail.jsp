<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sendMail page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	function sendEmail() {
		var sendMail = $('#sendMail').val();
		var qcontent = $('#qcontent').val();
		
		if(sendMail == null || sendMail == "") {
			alert("답변받으실 이메일 주소를 적어주세요");
			return false;
		}if(qcontent == null || qcontent == "") {
			alert("문의하실 내용을 기재하여 주세요");
			return false;
		}
		alert("문의가 접수되었습니다.");
		
		 document.sendInfo.action = "sendMail.do";
		 document.sendInfo.submit();
	}
		
	function back() {
		location.href='faqList.jsp';
	}
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
	
	.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}

button {
    background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;

}

#sendButton {
	background: #ffba00;
    color: white;
    border: 1px solid #ffba00;
    border-radius: 5px;
}


.sendButtons {
	text-align : center;
	margin-bottom: 30px;
}

h1 {
	text-align: center;
	font-family: 'Gowun Dodum';
}

::selection {
	background: #ffba00;
	color: #fff;
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
<form  id="frmMail" name="sendInfo" method="post"> 
<!-- post방식으로 자료를 컨트롤러로 보냄 -->

<h1>1:1 E-MAIL 문의</h1>
<table>
		<tr>
			<th>답변 받으실 메일주소</th>
			<td>
				<input name="senderMail" id="sendMail">
			</td>
		</tr>
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
			<td>
				<input name="receiveMail" type="hidden" value="yjefkd@gmail.com">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="subject" value="이메일 test"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="80" name="message" id="qcontent"></textarea></td>
		</tr>
	</table>

		<div class="sendButtons">
			<input type="button" id="sendButton" value="문의 접수하기" onclick="sendEmail()">
			<input type="button" class="emailCancel" onclick="location.href='faqList.jsp'" value="취 소"
					style="background: #ffba00; color: white; border: 1px solid #ffba00; border-radius: 5px;">
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