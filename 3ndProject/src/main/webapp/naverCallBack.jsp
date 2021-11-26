<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PETMILY : 로그인페이지</title>

<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all' />
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all' />
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all' />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hi+Melody&display=swap" rel="stylesheet">

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
///////////////////////////////////////////////////////
//SNS로그인 후 입력 폼
function registMember(){
	//alert("submit연결됨");
	console.log($("#registForm").serialize());
	
	if($("#mnickname").val().trim() == ""){
	alert("사용할 닉네임을 입력해주세요!");    
	$("#mnickname").focus();
	return;
	}
	
	if($("#mphone").val().trim() == ""){
	alert("연락처를 입력해주세요!");
	$("#mphone").focus();
	return;
	}
	
	if($("#memail").val().trim() == ""){
	alert("이메일을 입력해주세요!");
	$("#memail").focus();
	return;
    }
	
	$("#registForm").submit();
	
}


//jquery 시작하기/////////////////////////////////////////////
$(function(){
	
 });
/////////////////////////////////////////////////////////////
	
</script>

</head>

<body
	class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
	<div id="page">
		<div class="container">
			<header id="masthead" class="site-header">
				<div class="site-branding">
					<%@ include file="header.jsp"%>
				</div>
				
				<style>
					
				table td{
				padding : 10px 0px ;
				border : none; 
				text-align: center;
				}
				
				table{
				border-collapse: inherit;
				border-top:none;
				border-bottom:none;
				}
				
				li>a{
				color:grey;
				}
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
					
					
				
				#container_Box {
					margin: 0 auto;
					width: 75%;
					display: block;
				}
				
				.titleSpace {
					width: 90%;
					padding: 0px 30px;
					display: inline-block;
				}
				
				#titleContainer {
					float: left;
				}
				
				#detailNickname {
					float: right;
				}
				
				#detailNickname a:hover {
					text-decoration: underline;
				}
				
				.pictureSpace {
					text-align: center;
					width: 400px;
					height: 550px;
					float: left;
				}
				
				#pictureTable {
					margin: 0 auto;
					border: 1px solid grey;
					border-radius: 10px;
					padding: 2px;
					/* height: 720px; */
				}
				
				#mainPict {
				text-align:center;
					height: 300px;
					overflow: hidden;
					padding : 9px;
					border-bottom: none;
				}
				
				#mainPict img {
					width: 290px;
					height : 290px;
				}
				
				#pict1 {
					text-align : center;
					padding : 5px;
					margin : auto;
					opacity: 70%;
					transition: 0.5s;
					overflow: hidden;
				}
				
				#pict1:hover {
					opacity: 100%;
					cursor: pointer;
				}
				
				#pict1 img, #pict2 img, #pict3 img {
					width: 100px;
					
				}
				
				#pict1, #pict2, #pict3 {
					border-top: none;
					
				}
				
				#pict2 {
					text-align : center;
					padding : 5px;
					margin : auto;
					opacity: 70%;
					transition: 0.5s;
					overflow: hidden;
				}
				
				#pict2:hover {
					opacity: 100%;
					cursor: pointer;
				}
				
				#pict3 {
					text-align : center;
					padding : 5px;
					margin : auto;
					opacity: 70%;
					transition: 0.5s;
					overflow: hidden;
				}
				
				#pict3:hover {
					opacity: 100%;
					cursor: pointer;
				}
				
				a {
					text-decoration: none;
					color: grey;
				}
				
				#reportSpace {
					margin: auto;
					text-align: center;
					border: 1px solid darkred;
					display: none;
					position: absolute;
					top: 80%;
					left: 60%;
					background-color: white;
					border-radius: 15px;
					padding: 10px;
				}
				
				#reportTable {
					margin: 0 auto;
				}
				
				h2 {
					margin : auto;
					color: darkgrey;
					font-size: 1.4em;
				}
				
				.reportBtn {
					margin-left : 10px;
					border-radius: 5px;
					width: 100px;
					height: 40px;
					font-size: 15px;
					font-weight: bold;
				}
				
				#likeControll, #favControll, #reportControll {
					cursor: pointer;
				}
				
				.reportBtn:hover {
					background-color: darkred;
					color: white;
					transition: 0.5s;
				}
				
				#recommentSubmit {
					margin-left : 10px;
					border: none;
					border-radius: 5px;
					width: 70px;
					height: 20px;
					font-size: 8px;
					font-weight: bold;
				}
				
				input[id^=recommentVal] {
					width: 300px;
					padding: 5px 0px;
					font-size: 6px;
					border: 1px solid grey;
					border-radius: 5px;
				}
				
				#recommentSubmit:hover {
					background-color: darkred;
					color: white;
					transition: 0.5s;
				}
				
				.contentTextSpace {
					width: 40%;
					float: left;
					margin-left: 5px;
					padding: 10px
				}
				
				#textSpace {
				width : 300px;
					padding: 20px;
					height: 450px;
					font-weight: bold;
				}
				
				.moreConfig {
					font-weight: bold;
					float: right;
				}
				
				.configBoard {
					margin-left: 40px;
					font-weight: bold;
					color: grey;
					float: right;
				}
				
				.midSpace {
					width: 100%;
					margin: 0 auto;
					float: right;
					text-align: center;
					font-weight: bold;
				}
				
				#adSpace {
					width: 200px;
					height: 450px;
					position : absolute;
					top : 70%;
					right : 5%;
					font-weight: bold;
					text-align: center;
				}
				
				#replyTable {
					margin: 40px auto;
					padding: 10px;
					border: 0.1px solid grey;
					background-color: white;
					border-radius: 10px;
					width: 700px;
				}
				
				#reportReply, #recomment, #replyControll {
					font-size: 0.7em;
					color: grey;
					text-align: right;
				}
				
				.writerWrap {
					border-top: 1px solid black;
				}
				
				#replyControll {
					/* border-bottom: 1px solid lightgrey; */
					
				}
				
				td[id^=repNo], #replyReg {
					color: grey;
					font-weight: bold;
					font-size: 0.8em;
					padding: 5px;
					text-align: left;
				}
				
				#replyTable tr:nth-child(3n) {
					background-color: white;
				}
				
				#replyVal {
					padding: 5px;
					width: 500px;
					height: 35px;
					font-family: sans-serif;
					/* border: 2px solid grey; */
					border-radius: 10px;
				}
				
				#replyContent {
					font-size: 0.8em;
					padding: 5px 20px;
				}
				
				#moreBoard{
					padding : 10px; 0px;
					float:left;
					width : 100%;
					text-align: center;
					font-weight: bold;
					font-size:1.2em;
					color : darkgrey;
					cursor: pointer;
					border-top: 1px solid darkgrey;
					border-bottom : 1.5px solid darkgrey;
					margin : 30px auto;
				}
				
				#footSpace{
					margin : 0 auto;
					float:left;
					width : 100%;
					display:none;
				}
				
				#footSpace img {
				width : 120px;
				height : 120px;
				}
				
				
				#footSpace table {
				width : 100%;
				  border-spacing: 15px;
				  border-collapse: separate;
				  	color : black;
				}
				
				
				#closebox {
					padding : 0px;
					text-align: center;
					color : darkgrey;
					font-size : 0.8em;
					cursor: pointer;
				}
				#closebox p:hover, #moreBoard p:hover{
					text-decoration: underline;
				}
				
				#stickTool{
					text-align : center;
					position : fixed;
					top : 95%;
					left : 75%;
					width : 250px;
					z-index: 8;
				}
				
				div[id^=boardBox] {
					width:20%;
					float:left;
					text-align : center;
					margin-left : auto;
					cursor: pointer;
					font-weight: bold;
					color : darkgrey;
					opacity: 60%;
				}
				
				div[id^=boardBox]:hover {
					background-color: ghostwhite;
					transition : 0.5s;
					opacity: 100%;
				}
				
				#boardTable{
					width : 95%;
					margin : auto;
				}
				
				#stickTool{
					text-align : center;
					position : fixed;
					top : 80%;
					right : 0px;
				}
				
				#writeBtn, #backBtn{
					margin-left : 20px;
					float:left;
					width : 90px;
					height : 90px;
					border-radius : 50%;
					border : none;
					font-weight : bold;
					font-size: 1.1em;
				}
				
				
				#writeBtn:hover {
					border : 2px solid black;
					width : 89px;
					height : 89px;
					background-color: darkred;
					color : white;
					transition : 0.5s;
				}
				
				#backBtn:hover {
					border : 2px solid black;
					width : 89px;
					height : 89px;
					background-color: darkred;
					color : white;
					transition : 0.5s;
				}
				
				#titleSpace, #titleinputSpace,#imageInputSpace,#contentInputSpace,#bottomSpace{
					width : 100%;
					float:left;
					text-align: center;
				}
				
				#titleSpace h1{
					color : darkgrey;
					font-weight:bold;
				}
				
				#imageInputSpace{
					padding : 20px;
					
				}
				
				#titleInput select,#titleInput input {
					height : 50px;
					border : 1px solid darkgrey;
					border-radius: 10px;
					font-weight : bold;
					font-size : 1.2em;
				} 
				
				
				#titleInput input {
					width : 400px;
				}
				#subTitleSpace{
					font-size: 1.2em;
					font-weight: bold;
				}
				
				#imageUploadTable{
					width : 100%;
					margin : 0 auto;
					text-align:center;
				}
				
				div[id^=uploadForm]>input {
					font-size : 0.8em;
					background-color: lightyellow;
					font-weight : bold;
					margin : auto;
				}
				
				div[id^=uploadForm] {
					text-align:center;
					margin: auto;
					display:none;
				    width : 600px;
				    height : 200px;
				    border : 5px solid black;
				    border-radius : 5px;
				    font-size: 0.8em;
				    font-weight : bold;
				    background-color: white;
				    border-radius: 15px;
				    padding: 5px;
				}
				
				
				#imageUploadTable div[id^=uploadBpict]{
					margin : auto;
					width : 150px;
					height : 150px;
					border : 5px solid lightgrey;
					opacity:80%;
					border-radius: 10px;
					background-color: 	#FFFFE0;
					color : lightgrey;
					font-size : 1.5em;
					font-weight : bold;
					overflow: hidden;
				}
				
				
				#uploadBpict2, #uploadBpict3 {
					display: none;
				}
				
				
				#imageUploadTable div[id^=uploadBpict]:hover {
					opacity:100%;
					border : 5px solid black;
					color : black;
					cursor:pointer;
				}
				
				#delPict{
					margin-top:20px;
					border: none;
					border-radius: 5px;
					width: 200px;
					height: 50px;
					font-size: 20px;
					font-weight: bold;
				}
				
				#delPict:hover{
					background-color: darkgrey;
					color:white;
					transition : 0.5s;
				}
				
				/* 작성자의 마이페이지 및 쪽지보내기 탭 컨트롤 */
				li {
				    padding: 5px;
				    list-style-type: none;
				}
				
				.userSubmenu a {
				    color:grey;
				}
				
				.userSubmenu a:hover {
				    color:lightgrey;
				}
				
				
				input[id^=replyMenuBtn] ,input[id^=userMenuBtn], input[id^=recommentMenuBtn]{
				   position: fixed;
				    left: -9999px;
				}
				
				label {
				    cursor: pointer;
				}
				
				
				.userSubmenu {
				    display:none;
				    position : absolute;
				    width : 200px;
				    border : 1px solid darkgrey;
				    border-radius : 5px;
				    font-size: 0.8em;
				    font-weight : bold;
				    background-color: white;
				}
				
				#userMenuBtn:checked ~ .userSubmenu {
				    display: block;
				}
				
				
				ul[class^=replySubmenu] {
				    display:none;
				    position : absolute;
				    width : 200px;
				    border : 1px solid darkgrey;
				    border-radius : 5px;
				    font-size: 0.8em;
				    font-weight : bold;
				    background-color: white;
				}
				
				
				input[id^=replyMenuBtn]:checked ~ ul[class^=replySubmenu] {
				    display: block;
				}
				
				
				ul[class^=recommentSubmenu] {
				    display:none;
				    position : absolute;
				    width : 200px;
				    border : 1px solid darkgrey;
				    border-radius : 5px;
				    font-size: 0.8em;
				    font-weight : bold;
				    background-color: white;
				}
				
				
				input[id^=recommentMenuBtn]:checked ~ ul[class^=recommentSubmenu] {
				    display: block;
				}
				
				
				p[id^=popClose]:hover {
					text-decoration: underline;
					cursor: pointer;
				}
				
				
				#registerTable{
					border : 5px solid #2db400;
					text-align: center;
					background-color: white;
					border-radius: 20px;
					padding : 20px 125px;
					width : 600px;
					margin : 0 auto;
				}
				
				#registerTable td {
					width: 100%;
					padding : 10px;
					font-weight: bold;
					color : darkgrey;
					
				}
				
				#registerTable td input {
					padding : 5px;
					border : 2px solid #2db400;
					border-radius : 5px;
					font-weight: bold;
					color : darkgreen;
				}
				
				#registerTable td img{
					border : 3px solid #2db400;
					border-radius : 15px;
				}
				
				#submitBtn {
					border: none;
				    margin: 0 auto;
				    margin-top: 50px;
				    border-radius: 5px;
				    width: 100%;
				    height: 80px;
				    font-size: 2em;
				    font-weight: bold;
				    font-family: 'Gowun Dodum', "Malgun Gothic", serif;
				}
				
				#submitBtn:hover {
					background-color: #2db400;
					color:white;
					transition : 0.5s;
					cursor: pointer;
				}
				#container_Box {
				text-align: center;
				}
				#container_Box tr{
				margin : 0 auto;
				}
				
				#container_Box td{
				text-align: center;
				}
				</style>	
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main">
						<div id="container_Box">
							<form action="registMember.do" method="post" id="registForm">
								<table id="registerTable">
								</table>
							</form>
						
						<!-- 네이버 로그인 버튼 노출 영역 -->
						<div id="naver_id_login"></div>
						<!-- //네이버 로그인 버튼 노출 영역 -->
						<script type="text/javascript">
						  	var naver_id_login = new naver_id_login("KCWOHUMM7sBFVkd2ciCs", "http://localhost:8090/petmily/index.jsp");
						  	
						  	//alert("access token : "+ naver_id_login.oauthParams.access_token); //ìì¸ì¤ í í°ê° ë°ë¡ ì ì¥í´ëìë¤ê° ë¡ê·¸ììí  ë ì¨ì¼í¨
						    naver_id_login.get_naver_userprofile("naverSignInCallback()");
						    // ë¤ì´ë² ì¬ì©ì íë¡í ì¡°í ì´í íë¡í ì ë³´ë¥¼ ì²ë¦¬í  callback function
						    
						    function naverSignInCallback() {
						      mid = naver_id_login.getProfileData('id'); //mid
						      memail = naver_id_login.getProfileData('email'); //memai
						      
						      mnickname = naver_id_login.getProfileData('nickname'); //mnickname
						      mphone = naver_id_login.getProfileData('mobile'); //mphone
						      thumbnail = naver_id_login.getProfileData('profile_image'); //mphoto
						      
						      //alert("mid : " + mid);
						     // alert("memail : " + memail);
						      //alert("mnickname : " + mnickname);
						      //alert("mphone : " + mphone);
						      //alert("thumbnail : " + thumbnail);
						  	
						  	 $.ajax({
						     	url:"getAjaxMemberLogin.do",
						     	data:"mid="+mid,
						     	dataType:"json",
						     	async:false,
						     	success : function(data){
						     		//alert("리턴된 데이터가 null이 아님");
						     		//alert("data 확인 : " + JSON.stringify(data));
						     		//컨트롤러 단에서 session에 유저 넣음. 별도 준비없이 mainpage로 토스함
						     		location.href = "index.jsp";
						     	},error : function(data){
						     		//alert("리턴된 데이터가 null임");
						     		//회원가입을 위한 준비를 시작
						     	let registHtml ="";
						     		
						     	registHtml += "<tr>";
						     	registHtml += "<td colspan=\"2\" id='registTitle' style='font-size:25px; color:#2db400;'>&lt; Naver로 시작합니다! &gt;</td>";
						     	registHtml += "</tr>";
						     	registHtml += "<tr>";
						     	registHtml += "<td colspan=\"2\" id=\"mphoto\"><img src='"+thumbnail+"' width=\"150px\">";
						     	registHtml += "<input type=\"hidden\" name=\"mphoto\" value='"+thumbnail+"'>";
						     	registHtml += "<input type=\"hidden\" name=\"mid\" value='"+mid+"'>";
						     	registHtml += "</td>";
						     	registHtml += "</tr>";
						     	registHtml += "<tr>";
						     	registHtml += "<td>네이버 닉네임</td> <td id=\"mnameVal\"><input type =\"text\" name= \"mname\" value='"+mnickname+"' id='mname' readonly></td>";
						     	registHtml += "</tr>";
						     	registHtml += "<tr>";
						     	registHtml += "<td>사용할 닉네임</td><td id=\"mnicknameVal\"><input type =\"text\" name= \"mnickname\" value='"+mnickname+"' id='mnickname'></td>";
						     	registHtml += "</tr>";
						     	registHtml += "<tr>";
						     	registHtml += "<td>연락처</td><td id=\"mphoneVal\"><input type=\"tel\" name=\"mphone\" placeholder='(연락처를 입력해주세요)' id='mphone'></td>";
						     	registHtml += "</tr>"
						     	registHtml += "<tr>";
						     	registHtml += "<td>Email</td><td id=\"memailVal\"><input type=\"email\" name=\"memail\" value='"+memail+"' id='memail'></td>";
						     	registHtml += "</tr>"
						     	registHtml += "<tr>";
						     	registHtml += "<td colspan=\"2\"><button type=\"button\" id=\"submitBtn\" onclick='javascript:registMember()'>펫밀리 시작하기!</button></td>";
						     	registHtml += "</tr>";
						     	
						     	
						     	$("#registerTable").html(registHtml);
						     	}
						  	 });
						    }
						  	 
						</script>

						<hr>
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
		<footer id="colophon" class="site-footer">
			<div class="container">
				<div class="site-info">
					<h1 style="font-family: 'Hi Melody'; color: white; font-weight: 300; text-align: center; margin-bottom: 0; margin-top: 0; line-height: 1.4; font-size: 46px;">PETMILY</h1>
				</div>
			</div>
		</footer>
		<a href="#top" class="smoothup" title="Back to top"><span
			class="genericon genericon-collapse"></span></a>
	</div>


	<!-- #page -->
	<script src='./resources/js/jquery.js'></script>
	<script src='./resources/js/plugins.js'></script>
	<script src='./resources/js/scripts.js'></script>
	<script src='./resources/js/masonry.pkgd.min.js'></script>
</body>

</html>



