<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PETMILY! : 이야기 새로 쓰기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src = "http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hi+Melody&display=swap" rel="stylesheet">


<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script>
//함수 선언부
/////////////////////////////////////////////////////////////////////

//이미지 미리보기 부분
//사진 전부 지우기 시 실행되는 함수
function delPictGo(){
	//미리보기된 부분을 삭제
	$("#uploadBpict1").html("+");
	$("#uploadBpict2").html("+");
	$("#uploadBpict3").html("+");
	
	$("#uploadBpict1").css('width','150px');
	$("#uploadBpict1").css('height','150px');
	$("#uploadBpict2").css('width','150px');
	$("#uploadBpict2").css('height','150px');
	$("#uploadBpict3").css('width','150px');
	$("#uploadBpict3").css('height','150px');
	
	$("#uploadBpict2").css('display','none');
	$("#uploadBpict3").css('display','none');
	
	$("#delPict").remove();
	
	$("#bpictSel1").val("");
	$("#bpictSel2").val("");
	$("#bpictSel3").val("");
	
	
}

//그림파일 업로드 onchange시 실행되는 함수

function setThumbnail(pictNo, event) {

	for (var image of event.target.files) { //target파일이 이미지인 동안 반복하는 구문
		var reader = new FileReader(); // 파일리더기 생성
		reader.onload = function(event) { // 파일이 읽혀지면 실행되는 함수
			var img = document.createElement("img"); //이미지 객체 생성
			img.setAttribute("src", event.target.result);
			
			/////////////////////////////////////////////////////
			$("#uploadBpict"+pictNo).html(""); //업로드 버튼에 있는 내용을 미리 지워줌
			document.querySelector("div#uploadBpict"+pictNo).appendChild(img); //해당 쿼리셀렉터에 img를 넣어줌.
			}
			console.log(image); 
			reader.readAsDataURL(image); //reader.readAsDataURL(file);
		}
			
		$("#uploadForm"+pictNo).css("display","none");
		$("#uploadBpict"+pictNo).css('width','300px');
		$("#uploadBpict"+pictNo).css('height','300px');
		
		//alert("pictNo : " + pictNo);
		if(pictNo < 3){
		let nextNo = pictNo+1;
		//alert("nextNo : " + nextNo);
		$("#uploadBpict"+nextNo).css("display","block");
		}else{
			alert("사진은 3장까지만 첨부 가능해요!");
			let appendHtml ="";
			appendHtml += "<br><button type='button' id='delPict' onclick='javascript:delPictGo()'> 사진 전부 삭제! </button>";
			$("#imageUploadTable").append(appendHtml);
			
		}
		
	}
//////////////////////////////////////////////////////////////////////////////////
// 광고클릭시 Cnt 상승
function goAdLink(aLink,adNo){
	//Cnt 상승을 위한 ajax 처리
	//alert("aLink, adNo : " + aLink+ ":"+adNo);
	
	$.ajax({
		url : "plusCntAd.do",
		type : "post",
		data : "aidx="+adNo,
		//contentType : "application/json",
		success : function(){
			//alert("plusCnt 성공");
		},error : function(){
			//alert("plusCnt 실패");
		}
	});
	var newWindow = window.open("about:blank");
	newWindow.location.href=aLink; 
}
	
//Jquery 시작	
/////////////////////////////////////////////////////////////////////	
$(function(){
	
	/////////////////////////////////////////////////////
	//게시글 등록!
	
	$("#writeBtn").click(function(){ 
		//alert("연결??");
		var noteAll = $('#bcontent').summernote('code');
		$("#bcontent").val(noteAll);
		//alert("$(\"#bcontent\").val() : " + $("#bcontent").val());
		//alert($("#insertFrm").serialize());
		//유효성 검사
		if($("#btitle").val().trim() == ""){
			alert("제목을 입력해주세요!");
			$("#btitle").focus();
			return;
		}
		
		if($("#boardcate").val() == "말머리선택"){
			alert("말머리를 선택해주세요!");
			$("#btitle").focus();
			return;
		}else if($("#boardcate").val() == "고양이"){
			$("#boardcate option:selected").val(1);
		}else if($("#boardcate").val() == "강아지"){
			$("#boardcate option:selected").val(2);
		}else if($("#boardcate").val() == "자유주제"){
			$("#boardcate option:selected").val(3);
		}
		
		
		//alert("$(\"#insertFrm\").serialize() : "+$("#insertFrm").serialize());
		//insertBoard.do로 전송해서 인서트
		
		let answer = confirm("작성하신 내용을 게시해도 될까요???");
		
		if(answer){
			$("#insertFrm").submit();
		}else{
		 	return;
		}
	});
	
	
////////////////////////////////////////////////////////////////////
	//업로드 td 클릭시 업로드 ul출력
	$("#uploadBpict1").click(function(){
		$("#uploadForm1").css("display","inline-block");
	}); 
	$("#uploadBpict2").click(function(){
		$("#uploadForm2").css("display","inline-block");
	}); 
	$("#uploadBpict3").click(function(){
		$("#uploadForm3").css("display","inline-block");
	}); 
	//닫기 버튼 클릭시
	$("#popClose1").click(function(){
		$("#uploadForm1").css("display","none");
	});
	$("#popClose2").click(function(){
		$("#uploadForm2").css("display","none");
	});
	$("#popClose3").click(function(){
		$("#uploadForm3").css("display","none");
	});
	//////////////////////////////////////////////////////
	//////////////////////////////////////////////////////
	//1. textArea에 summerNote 입히기
	$("#bcontent").summernote({
		  height: 300,                 // set editor height
		fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
		fontNamesIgnoreCheck : [ '맑은고딕' ],
		  minHeight: null,             // set minimum height of editor
		  maxHeight: null,             // set maximum height of editor
		  focus: true,                  // set focus to editable area after initializing summernote
		  placeholder: '이야기를 남길 때는 반드시 타인을 배려하고 상처가 되는 말은 없는지 확인해주세요!',	
		  toolbar: [
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			    ['font', ['strikethrough', 'superscript', 'subscript']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']]
			  ]
	});
		///////////////////////////////////////////////////////////////////
		//2. 광고정보 불러오기
		
		//2-1. 모든 광고리스트를 불러오고 총 몇개의 리스트가 있는지 볼것.
		let adLength = 0;
		let adNo = null;
		
			$.ajax({
			url : "getAdvertiseListNo.do",
			type: "post",
			dataType:"json",
			success : function(data){
				$.each(data,function(index, item){
					adLength += 1;
				});
				
			//2-2. 길이 내의 난수를 하나 지정하여 광고정보를 가져오도록 할 것
			//등록된 광고의 length내에서의 난수 생성
				adNo = Math.floor(Math.random() * adLength) + 1;
				
				$.ajax({
					url : "getAdvertiseAjax.do",
					data : "aidx="+adNo,
					dataType : "json",
					type:"post",
					success : function(data){
						//6-3. 광고정보를 광고판에 띄우도록 할 것 (acontent와 apict만 불러와도 충분하다.)
						let aContent = data.acontent;
						let aLink = data.alink;
						let aPict = data.apicture;
						///성공한 정보를 광고창 쪽 HTML로 append해준다.
						adHtml ="<a href=\"javascript:goAdLink('"+aLink+"',"+adNo+")\">";
						adHtml += "<img src=\"/upload/"+aPict+"\" width = 200px></a><br>";
						adHtml += "<span id=\"adText\">"+aContent+"</span>"; 
						$("#adSpace").html(adHtml);
						
					},error : function(data){ //신고를 아직 하지 않은 경우
						alert("광고정보 불러오기에 실패하였습니다.");
					}
				});
				
			}, 
			error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			});
		

}); //jQuery 종료
</script>
</head>
<body class="home page page-template page-template-template-portfolio page-template-template-portfolio-php">
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
		<%@ include file="header.jsp" %>
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
	width : 90px;
	height : 90px;
	background-color: #ffbb00;
	color : white;
	transition : 0.5s;
	opacity : 100%
}

#backBtn:hover {
	width : 90px;
	height : 90px;
	background-color: #ffbb00;
	color : white;
	transition : 0.5s;
	opacity : 100%
}

#titleSpace, #titleinputSpace,#imageInputSpace,#contentInputSpace,#bottomSpace{
	width : 100%;
	float:left;
	text-align: center;
}

#titleSpace h1{
	text-align:center;
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
    width : 300px;
    height : 150px;
    border : 5px solid black;
    border-radius : 5px;
    font-size: 0.8em;
    font-weight : bold;
    background-color: white;
    border-radius: 15px;
    padding: 15px;
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
	background-color: #ffbb00;
	color:white;
	transition : 0.5s;
	opacity: 100%;	
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
	display : none;
	position:absolute;
	top : 25%;
	left : 33%;
	border : 2px solid orange;
	text-align: center;
	background-color: white;
	padding : 20px 50px;
	border-radius: 20px;
}

#registerTable td {
	padding : 10px;
	font-weight: bold;
	color : darkgrey;
}

#registerTable td input {
	padding : 5px;
	border : 2px solid darkgrey;
	border-radius : 5px;
	font-weight: bold;
	color : orange;
}

#registerTable td img{
	border : 3px solid darkgrey;
	border-radius : 5px;
}

#submitBtn {
	border: none;
	margin : 0 auto;
	border-radius: 5px;
	width: 100px;
	height: 40px;
	font-size: 15px;
	font-weight: bold;
}

#submitBtn:hover {
	background-color: darkred;
	color:white;
	transition : 0.5s;
	cursor: pointer;
}

h4, h1,h2, span, button{
font-family: Hi Melody, "Malgun Gothic", serif;
font-weight: bold;
}

input, td, select,small,p {
font-family: 'Gowun Dodum', "Malgun Gothic", serif;
font-weight: bold;
}


</style>


		</header>
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<main id="main" class="site-main">
				<div id="container_Box">
	<div id="titleSpace">
		<h1 style="color:#ffbb00">우리 펫 이야기 남기기</h1>
	</div>
	<form action="insertBoard.do" id="insertFrm" method="post" enctype="multipart/form-data"> <!--   -->
	
	<input type="hidden" name="midx" value="${user.midx }">
	
	
	<div id="titleinputSpace">
		<p id="boardCateImageSpace">
			<img src="./images/catDog.jpg" width="80px">
		</p>
		<p id="titleInput">
			<select name="boardcate" id="boardcate">
				<option>말머리선택</option>
				<option>고양이</option>
				<option>강아지</option>
				<option>자유주제</option>
			</select>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type = "text" name="btitle" id="btitle">
		</p>

		<hr>
	</div>
	<div id="imageInputSpace">
		<p id="subTitleSpace">내용을 작성해볼까요?</p>
		<p style="color:darkred; font-weight:bold;"><small>이미지가 정사각형이 아니면 부분적으로 잘릴 수 있어요! 주의해주세요!</small></p>
			<div id="imageUploadTable">
					<div id="uploadBpict1">+</div>
					<div id="uploadForm1">
							<h2 style="text-align: center;"><b>첫번째 사진을 업로드합니다!</b></h2><br>
							
							<input type="file" name="bpict" id="bpictSel1" accept="image/gif, image/jpeg, image/png" onchange="setThumbnail(1,event);"/>
							<br>
							<br>
							<p id="popClose1">닫기</p>
					</div>
					<div id="uploadBpict2">+</div>
					<div id="uploadForm2">
							<h2 style="text-align: center;"><b>두번째 사진을 업로드합니다!</b></h2>
							<br>
							<input type="file" name="bpict"  id="bpictSel2" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(2,event);"/>
							<br>
							<p id="popClose2">닫기</p>
					</div>	
					<div id="uploadBpict3">+</div>
					<div id="uploadForm3">
						<h2 style="text-align: center;"><b>세번째 사진을 업로드합니다!</b></h2><br>
						<input type="file" name="bpict"  id="bpictSel3"  accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(3,event);"/>
						<br>
						<p id="popClose3">닫기</p>
					</div>
			</div>
	</div>
	
	<div id="contentInputSpace">
		<p id="subTitleSpace"><!-- 미사용 --></p>
		<div id="contentInputApiDiv">
			<textarea name="btext" id="bcontent"></textarea>
		</div>
	</div>
	<div id="bottomSpace">
	<!-- 최하단 자리(미사용) -->
	</div>
	<div id="stickTool">
		<button type="button" id="writeBtn">등록</button>
		<button type="button" id="backBtn" onclick="javascript:history.back()">뒤로</button>
		</div>
	</form>
	<div id="adSpace" style="height:300px;">

	</div>
</div>
<hr>
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
