<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PETMILY : 마이페이지</title>

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
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hi+Melody&display=swap"
	rel="stylesheet">

<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
		//그림파일 업로드 onchange시 실행되는 함수/////////////////////////
		function setThumbnail(event) {
					
					for (var image of event.target.files) { //target파일이 이미지인 동안 반복하는 구문
						var reader = new FileReader(); // 파일리더기 생성
						reader.onload = function(event) { // 파일이 읽혀지면 실행되는 함수
							var img = document.createElement("img"); //이미지 객체 생성
							img.setAttribute("src", event.target.result);
							
							/////////////////////////////////////////////////////
							$("#petPict").html(""); //업로드 버튼에 있는 내용을 미리 지워줌
							document.querySelector("div#petPict").appendChild(img); //해당 쿼리셀렉터에 img를 넣어줌.
							}
							console.log(image); 
							reader.readAsDataURL(image); //reader.readAsDataURL(file);
						}
					}
		
		//등록창 확인/////////////////////////////////////
		function viewRegist(){
			$("#registMyPet").css("display","block");
		}
		
		//반려동물 삭제///////////////////////////////////
		function deletePet(pidx){
			let answer = confirm("반려동물 정보를 정말로 삭제하시겠어요?");
			if(answer){
			$.ajax({
				url:"deletePet.do",
				data:"pidx="+pidx,
				success : function(){
				//alert("삭제됨");
				},error : function(){
				//alert("삭제 안됨");
				history.go(0);
				}
			});
			}else{
				return;
			}
		}
		
		//회원탈퇴를 요청할 경우////////////////////////////

		function memberOut(midx){
			//alert("memberOut 연결 확인 : midx = " + midx);
			let answer = confirm("정말로 탈퇴하실건가요?? (신청 이후 14일이 경과되면 모든 정보가 삭제됩니다!)");
			if(answer){
			$.ajax({
				url:"memberOut.do",
				data:"midx="+midx,
				success : function(){
					//alert("연결됨");
				},error : function(data){
					//alert("탈퇴 요청 완료");
					//console.log(data);
					history.go(0);
				}
			});
			}else{
				return;
			}
			
		}



//////////////////////////////////
	$(function() {

		
		/////////////////////////////////////////////////////////////
		if(${user.midx == targetMember.midx }){
			$("#profileContainer").show();
			$("#petInfoContainer").hide();
			$("#profileBtn").show();
		}else{
			$("#profileContainer").hide();
			$("#petInfoContainer").show();
			$("#profileBtn").hide();
		}
		
		//프로필을 누르면 
		$("#profileBtn").click(function(){
			$("#profileContainer").show();
			$("#petInfoContainer").hide();
		});
		//반려동물을 누르면
		$("#viewPetBtn").click(function(){
			$("#profileContainer").hide();
			$("#petInfoContainer").show();
		});
		//작성게시물을 누르면
		$("#myBoardList").click(function(){
			
			location.href="myBoardListPaging.do";
		});
		
		
		//사용자의 midx로 된 모든 펫의 정보를 불러옴
		$.ajax({
			url:"getPetList.do",
			data:"midx="+${targetMember.midx },
			dataType:"json",
			success : function(data){
				if(data.length == 0){
					//등록된 반려동물이 없음
					let pethtml ="";		
					pethtml += "<div id ='myPet' style='width:100%; font-size:2em;'>";
					pethtml += "<p style='text-align:center;'><img src='./resources/images/empty.png'></p>";
					pethtml += "<p style='text-align:center; font-family: \"Hi Melody\"; font-size: 1em;'>아직 등록된 반려동물이 없네요.....</p>";
					pethtml += "</div>";
					$("#myPetDiv").append(pethtml);
					
				}
				//등록된 반려동물을 순서대로 꺼내어 줌
				$.each(data,function(index,item){
					let pidx = this.pidx;
					let ptype = this.ptype;
					let pkind =this.pkind;
					let pname=this.pname;
					let pgender=this.pgender;
					let pphoto=this.pphoto;
					let pbirth=this.pbirth;
					
					const today = new Date();
					petAgeDate = (today-pbirth)/1000/60/60/24;
					petAgeDate = Math.floor(petAgeDate);
					petAgeMonth = petAgeDate/30;
					petAgeMonth = Math.floor(petAgeMonth);
					
					
					
				let pethtml ="";		
				pethtml += "<div id ='myPet'>";
				pethtml += "<p><img src='/upload/"+pphoto+"'</p>";
				pethtml += "<p>이름 : "+pname+"</p>";
				pethtml += "<p>종류 : "+pkind+"</p>";
				pethtml += "<p>성별 : "+pgender+"</p>";
				pethtml += "<p>나이(월) : "+petAgeMonth+" 개월</p>";
				pethtml += "<p>나이(일) : "+petAgeDate+" 일</p>";
				
				//작성자 본인이면 정보삭제 가능
				if(${targetMember.midx == user.midx}){
				pethtml += "<p><span style='float:right;'><a href='javascript:deletePet("+pidx+")'>정보 삭제</a></span></p>";
				}
				
				pethtml += "</div>";
				
				$("#myPetDiv").append(pethtml);
					
				});
			},error : function(){
				
				alert("반려동물 정보를 불러오는데 실패했어요.....");
			}
		});
	
		
		////////////////////////////////////////////////////////////////////////
		//사용자의 정보를 수정 클릭하였을 시!
		$("#modifyBtn").click(function() {
			alert("정보를 수정하시겠습니까?");

			if ($("#mnickname").val().trim() == "") {
				alert("닉네임은 반드시 입력해야 합니다!");
				$("#mnickname").focus();
				return;
			}

			if ($("#memail").val().trim() == "") {
				alert("이메일은 반드시 입력해야 합니다!");
				$("#memail").focus();
				return;
			}

			if ($("#mphone").val().trim() == "") {
				alert("연락처는 반드시 입력해야 합니다!");
				$("#mphone").focus();
				return;
			}
			
			$("#updateMyInfoFrm").submit();
		});
		
		
		//펫 정보를 등록하였을 시!!
		$("#registBtn").click(function(){
			//alert("연결부터 보자");
		
			//반려동물의 분류 반드시 클릭
			if($("#ptype").val().trim() == "분류"){
				alert("반려동물의 분류를 확인해주세요!");
				return;
			}
			//반려동물의 종류 반드시 입력
			if($("#pkind").val().trim() == ""){
				alert("반려동물의 종류를 입력해주세요!");
				$("#pkind").focus();
				return;
			}
			//반려동물의 사진이 없는데 괜찮음?
			if($("#petImage").val().trim() == ""){
				alert("반려동물의 사진이 없어요....");
				
				let answer = confirm("사진이 없어도 진행할까요?");
				if(answer){/*그냥 진행  */}
				else{return;}
			}		
			
			//반려동물의 이름을 반드시 입력
			if($("#pname").val().trim() == ""){
				alert("반려동물의 이름을 입력해주세요!");
				$("#pname").focus();
				return;
			}
			
			//반려동물의 성별 클릭해야함
			if(!($('input:radio[name=pgender]').is(":checked"))){
				alert("반려동물의 성별을 체크해주세요!");
				return;
			}
			//반려동물의 생일도 등록해야함
			if($("#pbirth").val().trim() == ""){
				alert("반려동물의 생일을 선택해주세요!");
				return;
			}
			
			//alert($("#insertPetFrm").serialize());
			
			
			$("#insertPetFrm").submit();
			
			$("#registMyPet").css("display","none");
			
		});
		
		//펫 등록 닫기 버튼
		$("#close").click(function(){
			$("#registMyPet").css("display","none");
			
		});
		
		
	});
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
						table td {
							padding: 10px 0px;
							border: none;
							text-align: center;
						}
						
						table {
							border-collapse: inherit;
							border-top: none;
							border-bottom: none;
						}
						
						li>a {
							color: grey;
						}
						
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
							text-align: center;
							height: 300px;
							overflow: hidden;
							padding: 9px;
							border-bottom: none;
						}
						
						#mainPict img {
							width: 290px;
							height: 290px;
						}
						
						#pict1 {
							text-align: center;
							padding: 5px;
							margin: auto;
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
							text-align: center;
							padding: 5px;
							margin: auto;
							opacity: 70%;
							transition: 0.5s;
							overflow: hidden;
						}
						
						#pict2:hover {
							opacity: 100%;
							cursor: pointer;
						}
						
						#pict3 {
							text-align: center;
							padding: 5px;
							margin: auto;
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
							border: 1px solid #ffbb00;
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
							margin: auto;
							color: darkgrey;
							font-size: 1.4em;
						}
						
						.reportBtn {
							margin-left: 10px;
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
							background-color: #ffbb00;
							color: white;
							transition: 0.5s;
							opacity: 100%;
						}
						
						#recommentSubmit {
							margin-left: 10px;
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
							width: 100%;
							padding: 20px;
							height: 450px;
							font-weight: bold;
						}
						
						.moreConfig {
							font-weight: bold;
							float: right;
						}
						
						.configBoard {
							border: 1px solid lightgrey;
							border-radius: 10px;
							padding: 15px;
							margin-top: 20px;
							margin-bottom: 20px;
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
							position: absolute;
							top: 70%;
							right: 5%;
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
						
						#moreBoard {
							padding: 10px; 0 px;
							float: left;
							width: 100%;
							text-align: center;
							font-weight: bold;
							font-size: 1.2em;
							color: darkgrey;
							cursor: pointer;
							border-top: 1px solid darkgrey;
							border-bottom: 1.5px solid darkgrey;
							margin: 30px auto;
						}
						
						#footSpace {
							margin: 0 auto;
							float: left;
							width: 100%;
							display: none;
						}
						
						#footSpace img {
							width: 120px;
							height: 120px;
						}
						
						#footSpace table {
							width: 100%;
							border-spacing: 15px;
							border-collapse: separate;
							color: black;
						}
						
						#closebox {
							padding: 0px;
							text-align: center;
							color: darkgrey;
							font-size: 0.8em;
							cursor: pointer;
						}
						
						#closebox p:hover, #moreBoard p:hover {
							text-decoration: underline;
						}
						
						#stickTool {
							text-align: center;
							position: fixed;
							top: 95%;
							left: 75%;
							width: 250px;
							z-index: 8;
						}
						
						div[id^=boardBox] {
							width: 20%;
							float: left;
							text-align: center;
							margin-left: auto;
							cursor: pointer;
							font-weight: bold;
							color: darkgrey;
							opacity: 60%;
						}
						
						div[id^=boardBox]:hover {
							background-color: ghostwhite;
							transition: 0.5s;
							opacity: 100%;
						}
						
						#boardTable {
							width: 95%;
							margin: auto;
						}
						
						#stickTool {
							text-align: center;
							position: fixed;
							top: 80%;
							right: 0px;
						}
						
						#writeBtn, #backBtn {
							margin-left: 20px;
							float: left;
							width: 90px;
							height: 90px;
							border-radius: 50%;
							border: none;
							font-weight: bold;
							font-size: 1.1em;
						}
						
						#writeBtn:hover {
							width: 90px;
							height: 90px;
							background-color: #ffbb00;
							color: white;
							transition: 0.5s;
							opacity: 100%
						}
						
						#backBtn:hover {
							width: 90px;
							height: 90px;
							background-color: #ffbb00;
							color: white;
							transition: 0.5s;
							opacity: 100%
						}
						
						#titleSpace, #titleinputSpace, #imageInputSpace, #contentInputSpace,
							#bottomSpace {
							width: 100%;
							float: left;
							text-align: center;
						}
						
						#titleSpace h1 {
							color: darkgrey;
							font-weight: bold;
						}
						
						#imageInputSpace {
							padding: 20px;
						}
						
						#titleInput select, #titleInput input {
							height: 50px;
							border: 1px solid darkgrey;
							border-radius: 10px;
							font-weight: bold;
							font-size: 1.2em;
						}
						
						#titleInput input {
							width: 400px;
						}
						
						#subTitleSpace {
							font-size: 1.2em;
							font-weight: bold;
						}
						
						#imageUploadTable {
							width: 100%;
							margin: 0 auto;
							text-align: center;
						}
						
						div[id^=uploadForm]>input {
							font-size: 0.8em;
							background-color: lightyellow;
							font-weight: bold;
							margin: auto;
						}
						
						div[id^=uploadForm] {
							text-align: center;
							margin: auto;
							display: none;
							width: 600px;
							height: 200px;
							border: 5px solid black;
							border-radius: 5px;
							font-size: 0.8em;
							font-weight: bold;
							background-color: white;
							border-radius: 15px;
							padding: 5px;
						}
						
						#imageUploadTable div[id^=uploadBpict] {
							margin: auto;
							width: 150px;
							height: 150px;
							border: 5px solid lightgrey;
							opacity: 80%;
							border-radius: 10px;
							background-color: #FFFFE0;
							color: lightgrey;
							font-size: 1.5em;
							font-weight: bold;
							overflow: hidden;
						}
						
						#uploadBpict2, #uploadBpict3 {
							display: none;
						}
						
						#imageUploadTable div[id^=uploadBpict]:hover {
							opacity: 100%;
							border: 5px solid black;
							color: black;
							cursor: pointer;
						}
						
						#delPict {
							margin-top: 20px;
							border: none;
							border-radius: 5px;
							width: 200px;
							height: 50px;
							font-size: 20px;
							font-weight: bold;
						}
						
						#delPict:hover {
							background-color: darkgrey;
							color: white;
							transition: 0.5s;
						}
						
						/* 작성자의 마이페이지 및 쪽지보내기 탭 컨트롤 */
						li {
							padding: 5px;
							list-style-type: none;
						}
						
						.userSubmenu a {
							color: grey;
						}
						
						.userSubmenu a:hover {
							color: lightgrey;
						}
						
						input[id^=replyMenuBtn], input[id^=userMenuBtn], input[id^=recommentMenuBtn]
							{
							position: fixed;
							left: -9999px;
						}
						
						label {
							cursor: pointer;
						}
						
						.userSubmenu {
							display: none;
							position: absolute;
							width: 200px;
							border: 1px solid darkgrey;
							border-radius: 5px;
							font-size: 0.8em;
							font-weight: bold;
							background-color: white;
						}
						
						#userMenuBtn:checked ~ .userSubmenu {
							display: block;
						}
						
						ul[class^=replySubmenu] {
							display: none;
							position: absolute;
							width: 200px;
							border: 1px solid darkgrey;
							border-radius: 5px;
							font-size: 0.8em;
							font-weight: bold;
							background-color: white;
						}
						
						input[id^=replyMenuBtn]:checked ~ ul[class^=replySubmenu] {
							display: block;
						}
						
						ul[class^=recommentSubmenu] {
							display: none;
							position: absolute;
							width: 200px;
							border: 1px solid darkgrey;
							border-radius: 5px;
							font-size: 0.8em;
							font-weight: bold;
							background-color: white;
						}
						
						input[id^=recommentMenuBtn]:checked ~ ul[class^=recommentSubmenu] {
							display: block;
						}
						
						p[id^=popClose]:hover {
							text-decoration: underline;
							cursor: pointer;
						}
						
						#registerTable {
							display: none;
							position: absolute;
							top: 25%;
							left: 33%;
							border: 2px solid orange;
							text-align: center;
							background-color: white;
							padding: 20px 50px;
							border-radius: 20px;
						}
						
						#registerTable td {
							padding: 10px;
							font-weight: bold;
							color: darkgrey;
						}
						
						#registerTable td input {
							padding: 5px;
							border: 2px solid darkgrey;
							border-radius: 5px;
							font-weight: bold;
							color: orange;
						}
						
						#registerTable td img {
							border: 3px solid darkgrey;
							border-radius: 5px;
						}
						
						#submitBtn {
							border: none;
							margin: 0 auto;
							border-radius: 5px;
							width: 100px;
							height: 40px;
							font-size: 15px;
							font-weight: bold;
						}
						
						#submitBtn:hover {
							background-color: #ffbb00;
							color: white;
							transition: 0.5s;
							cursor: pointer;
							opacity: 100%;
						}
						
						h4, h1, h2, span, button {
							font-family: Hi Melody, "Malgun Gothic", serif;
							font-weight: bold;
						}
						
						input, td, p, div {
							font-family: 'Gowun Dodum', "Malgun Gothic", serif;
							font-weight: bold;
						}
						
						#container_Box {
							width: 100%;
							margin-top: 40px;
							margin-bottom: 150px;
						}
						
						/* main div {
							border: 1px solid orange;
						} */
						
						#titleText {
							text-align: center;
						
						}
						#titleText span {
							font-family: 'Gowun Dodum', "Malgun Gothic", serif;
							font-weight: bold;
							font-size : 3em;
						}
						
						#menuBar {
							text-align: center;
							border-bottom : 1px solid darkgrey;
							padding-bottom: 15px;
						}
						#menuBar span {
							font-family: 'Gowun Dodum',"Malgun Gothic", serif;
							font-size : 2em;
							margin-left : 20px;
							border : none;
							border-radius: 30px 0;
							padding : 10px;
						}
						#menuBar span:hover {
							background-color: #ffbb00;
							transition:0.5s;
							color:white;
							cursor: pointer;
						}
						
						
						
						#profileLeft {
							width: 20%;
							float: left;
							height: 200px;
							padding: 10px 0;
							border : 1px solid darkgrey;
						}
						
						
						#petInfoContainer, #registMyPet, #profileContainer{
						float:left;
						margin-top: 30px;
						margin-bottom: 150px;
						width: 100%;
						display: hidden;
						}
						
						
						#profileMain {
							width: 65%;
							float: left;
							height: 200px;
						}
						
						#profilePict {
							text-align: center;
						}
						
						#profilePict img {
						border : 3px solid #ffbb00;
						}
						
						#profiles input{
						border:2px solid #ffbb00;
						border-radius : 10px;
						}
						
						#profileName {
							text-align: center;
						}
						
						#profileModify {
							width: 14%;
							float: left;
							height: 200px;
						}
						
						#itemsName {
							width: 100px;
							float: left;
							text-align: center;
						}
						
						#itemsName div {
							width: 200px;
							float: left;
						}
						
						#modifyBtn {
							border: none;
							margin-top: 30%;
							margin-left: 25%;
							border-radius: 50%;
							width: 100px;
							height: 100px;
							font-size: 1.5em;
							font-weight: bold;
						}
						
						#modifyBtn:hover {
							background-color: #ffbb00;
							color: white;
							transition: 0.5s;
							cursor: pointer;
							opacity: 100%;
						}
						
						#myPetBoardList{
						width:75%;
						float: left;
						}
						
						#myPet{
						width : 22%;
						margin-left : 2%;
						margin-top : 15px;
						margin-bottom : 15px;
						float: left;
						overflow: hidden;
						border : 2px solid #ffbb00;
						border-radius : 15px;
						padding : 10px;
						
						}
						
						#registMyPet{
						width : 50%;
						position: absolute;
						top : 80%;
						left : 25%;
						background-color: white;
						border : 5px solid #ffbb00;
						border-radius: 20px;
						display : none;
						}
						
						#registMyPet input{
						border:2px solid #ffbb00;
						border-radius : 10px;
						}
						
						#petItems{
						width : 30%;
						font-size:1.5em;
						border-bottom: 1px solid darkgrey;
						}
						
						#registForm div{
						margin :0 auto;
						text-align: center;
						margin-top: 30px;
						
						}
						
						#registBtn{
							border: none;
							margin-top: 5px;
							margin-left: auto;
							border-radius: 50%;
							width: 100px;
							height: 100px;
							font-size: 1.5em;
							font-weight: bold;
						}
						
						#registBtn:hover {
							background-color: #ffbb00;
							color: white;
							transition: 0.5s;
							cursor: pointer;
							opacity: 100%;
						}
						
						#petPict{
						width:150px;
						height:150px;
						margin : 0 auto;
						border : 2px solid #ffbb00;
						border-radius:10px;
						opacity: 80%
						}
						
						#petPict:hover{
						opacity: 100%;
						}
						
						#close:hover{
						cursor: pointer;
						}
						
						
						</style>	
				
			</header>
			<!-- #masthead -->
			<div id="content" class="site-content">
				<div id="primary" class="content-area column full">
					<main id="main" class="site-main">
					
						<!--============================================================================  -->
						<!--============================================================================  -->
						<!--============================================================================  -->
						
						<div id="container_Box">
							<!-- 컨테이너 시작  -->
							<div id="titleText">
								<span id="userWho" style="color:#ffbb00">[ ${targetMember.mnickname } ]</span><span>님의
									페이지</span>
									<hr>
							</div>
							<div id="menuBar">

								<span id="profileBtn">프로필</span> <span id="viewPetBtn">반려동물</span> <span id="myBoardList">작성게시물</span>

							</div>
							<!-- 프로필 div -->
							<div id="profileContainer">
							
								<!-- 프로필 좌측 사진 및 이름 -->
								<div id="profileLeft">
									<div id="profilePict">
										<img src="${targetMember.mphoto }" width="150px">
									</div>
									<div id="profileName">
										<p>${targetMember.mnickname }</p>
									</div>
								</div>
								
								
								<!-- 프로필 상세정보 -->
								<form action="updateMyInfo.do" id="updateMyInfoFrm" method="post">
								<div id="profileMain">
									<div id="profiles">
											<p style="font-size:1.3em; margin-left:20px; margin-bottom:30px;" >정보수정</p>
											<input type="hidden" name="midx"
												value="${targetMember.midx }">
											<p>
											<div id="itemsName">닉네임</div>
											<div>
												<input type="text" name="mnickname" id="mnickname"
													value="${targetMember.mnickname }">
											</div>
											<p>
											<div id="itemsName">이메일</div>
											<div>
												<input type="text" name="memail" id="memail"
													value="${targetMember.memail }">
											</div>
											<p>
											<div id="itemsName">휴대폰번호</div>
											<div>
												<input type="text" name="mphone" id="mphone"
													value="${targetMember.mphone }">
											</div>
											<p>
											<div id="itemsName"></div>
											<div style="text-align: center;">
												<c:if test="${targetMember.mlevel != 4}">
													<span><a href="javascript:memberOut(${targetMember.midx })">&lt;&lt;  회원탈퇴하기  &gt;&gt; </a></span>
												</c:if>
												<c:if test="${targetMember.mlevel == 4}">
													<span style="color:darkred">&lt;&lt;  회원탈퇴 신청완료  &gt;&gt; </span>
												</c:if>
												
											</div>
											
										</div>
									</div>
									<div id="profileModify">
											<button type="button" id="modifyBtn">정보수정</button>
									</div>
									</form>
							</div>
							
							
							<!-- 반려동물 보기 div -->
							<div id="petInfoContainer">
								<div id="profileLeft">
									<div id="profilePict">
										<img src="${targetMember.mphoto }" width="150px">
									</div>
									<div id="profileName">
										<p>${targetMember.mnickname }</p>
									</div>
								</div>
								<div id="myPetBoardList">
									
									<c:if test="${user.midx == targetMember.midx }">
										<p style="font-size:1.3em; margin-left:20px; margin-bottom:15px;" >나의 반려동물</p>
										<p style="font-size:1.0em; margin-left:60px; margin-bottom:30px; color:darkgrey" >(반려동물은 총 4마리까지 등록이 가능해요)</p>
										<p  style="font-size:0.9em; margin-left:20px; margin-bottom:30px;" > <a href="javascript:viewRegist();">반려동물 등록하기 &gt;&gt;</a> </p>		
									</c:if>
									
									<c:if test="${user.midx != targetMember.midx }">
										<p style="font-size:1.3em; margin-left:20px; margin-bottom:30px;" >${targetMember.mnickname }님의 반려동물</p>
									</c:if>
									
									<div id="myPetDiv">
										<!-- 반려동물 리스트가 올 자리 -->
									</div>
								</div>
							</div>
							<!-- 나의 pet등록하기 div -->
							<div id="registMyPet">
								<form action="insertPet.do" method="post" id="insertPetFrm" enctype="multipart/form-data">
								<div id="registForm">
										<div>
											<span id="close" style="float:right">닫기 X</span>
										</div>
										
										
										<div>
										<div id="petItems" style="font-size:2em; width:50%; border-bottom:none;">나의 반려동물 등록하기</div>
											<input type="hidden" name="midx" value="${user.midx }">
										</div>
										
										<div>
											<div id="petItems">반려동물의 종류</div>
										</div>
									
										<div>
										<select name="ptype" id="ptype">
											<option>분류</option>
											<option>고양이</option>
											<option>강아지</option>
										</select>
										<input type="text" name="pkind" id="pkind" placeholder="반려동물의 종류를 입력해주세요!" style="width : 250px; margin-left:10px;"> 
										</div>
										<div id="petItems">반려동물의 사진</div>
										<div id="petPict">No picture</div>
										<div><input type="file" name="petImage" id="petImage" style="margin:0 auto; border:2px solid #ffbb00;"
										accept="image/gif, image/jpeg, image/png" onchange="setThumbnail(event);"></div>
										<div><div id="petItems">반려동물의 이름</div><input type="text" name="pname" id="pname" placeholder="반려동물의 이름을 입력해주세요!" style="width : 250px; margin-left:10px; margin-top:15px;"></div>
										<div><div id="petItems">반려동물의 성별</div></div>
										<div><input type="radio" name="pgender" value="남">남아 <input type="radio" name="pgender" value="여">여아</div>
										<div><div id="petItems">반려동물의 생일</div><input type="date" name="pbirth" id="pbirth"></div>
										<div><button type="button" id="registBtn">등록하기</button></div>
									</div>
								</form>
							</div>
							<!-- 나의 펫 상세보기(+수정) -->
							
							
							
							
							<!-- 컨테이너 끝 -->
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



