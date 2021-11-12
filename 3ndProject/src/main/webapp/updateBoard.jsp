<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMILY! : 이야기 고쳐 쓰기</title>
<link rel ="stylesheet" href="./style.css" type="text/css">
<script src = "http://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* div{
border : 1px solid orange;
} */
</style>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script>
/////////////////////////////////////////////////////////////////
//원래 가지고 있던 bidx의 게시글 정보를 모두 가져옴
let bidx = ${board.bidx };
let midx = ${board.midx };
let btitle = "${board.btitle }";
let btext = "${board.btext }";
let bpict1 = "${board.bpict1 }";
let bpict2 = "${board.bpict2 }";
let bpict3 = "${board.bpict3 }";
let bregdate = "${board.bregdate }";
let boardcate = ${board.boardcate };
let alarm = ${board.alarm };



//함수 선언부
/////////////////////////////////////////////////////////////////////
//이미지 미리보기 부분
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
		$("#uploadBpict"+pictNo).css('width','30%');
		$("#uploadBpict"+pictNo).css('height','300px');
		
		//alert("pictNo : " + pictNo);
		if(pictNo < 3){
		let nextNo = pictNo+1;
		//alert("nextNo : " + nextNo);
		$("#uploadBpict"+nextNo).css("display","block");
		}else{
			alert("앗! 사진은 3장까지만 첨부 가능해요!");
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
	//페이지가 시작되면 알맞은 form위치에 값을 모조리 넣어줌.
 	
	///////////////////////
	//그림캔버스의 크기 조정 및 노출
	$("#uploadBpict1").css('display','block');
	$("#uploadBpict1").css('width','30%');
	$("#uploadBpict1").css('height','300px');
	
	$("#uploadBpict2").css('display','block');
	$("#uploadBpict2").css('width','30%');
	$("#uploadBpict2").css('height','300px');
	
	$("#uploadBpict3").css('display','block');
	$("#uploadBpict3").css('width','30%');
	$("#uploadBpict3").css('height','300px');
	/////////////////
	//말머리 미리 지정
	if(boardcate == 1){
		$("#boardcate").val("고양이").prop("selected", true);
	}else if(boardcate == 2){
		$("#boardcate").val("강아지").prop("selected", true);
	}else if(boardcate == 3){
		$("#boardcate").val("자유주제").prop("selected", true);
	}
	////////////
	//제목 미리 지정
	$("#btitle").val(btitle);
	
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
		
		
		alert("$(\"#insertFrm\").serialize() : "+$("#insertFrm").serialize());
		//insertBoard.do로 전송해서 인서트
		
		let answer = confirm("작성하신 내용을 수정할까요???");
		
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
		  placeholder: '${board.btext}',	
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
			url : "getAdvertiseList.do",
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
					url : "getAdvertise.do",
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
						adHtml += "<img src=\"./images/"+aPict+"\" width = 149px></a><br>";
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
<body>
<div id="container">
	<div id="titleSpace">
		<h1>우리 펫 이야기 수정하기!</h1>
	</div>
	<form action="updateBoard.do" id="insertFrm" method="post" enctype="multipart/form-data"> <!--   -->
	
	
	
	<input type="hidden" name="oriPict1" value="${board.bpict1 }">
	<input type="hidden" name="oriPict2" value="${board.bpict2 }">
	<input type="hidden" name="oriPict3" value="${board.bpict3 }">
	
	<input type="hidden" name="bidx" value="${board.bidx }">
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
					<div id="uploadBpict1"><img src="./images/${board.bpict1 }"></div>
						<div id="uploadForm1">
							<h2><b>첫번째 사진을 수정합니다!</b></h2>
							
							<input type="file" name="bpict" accept="image/gif, image/jpeg, image/png" onchange="setThumbnail(1,event);"/>
							<br>
							<br>
							<br>
							<br>
							<p id="popClose1">닫기</p>
						</div>
					<div id="uploadBpict2"><img src="./images/${board.bpict2 }"></div>
						<div id="uploadForm2">
								<h2><b>두번째 사진을 수정합니다!</b></h2>
								<input type="file" name="bpict" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(2,event);"/>
								<br>
								<br>
								<br>
								<br>
								<p id="popClose2">닫기</p>
						</div>	
					<div id="uploadBpict3"><img src="./images/${board.bpict3 }"></div>
					
						<div id="uploadForm3">
							<h2><b>세번째 사진을 수정합니다!</b></h2>
							<input type="file" name="bpict" accept="image/gif, image/jpeg, image/png"  onchange="setThumbnail(3,event);"/>
							<br>
							<br>
							<br>
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
	최하단 자리
	</div>
	<div id="stickTool">
		<button type="button" id="writeBtn">수정</button>
		<button type="button" id="backBtn" onclick="javascript:history.back()">뒤로</button>
		</div>
	</form>
	<div id="adSpace" style="height:300px;">

	</div>
</div>
<hr>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>
</html>