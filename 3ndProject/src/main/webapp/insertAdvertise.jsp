<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 상품 등록 페이지</title>
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
	// 유효성 검사
	function checkAll()	{
		var checkTitle = $('#title').val();
		var checkContent = $('#summernote').val();
		var checkLink = $('#link').val();
		var checkFile = $('#fileUpload').val();
		
		if(checkTitle == null || checkTitle == "") {
			alert("제목을 입력하세요.");
			return false;
		}
		if(checkContent == null || checkContent == "") {
			alert("내용을 입력하세요.");
			return false;
		}
		if(checkLink == null || checkLink == "") {
			alert("링크를 입력하세요.");
			return false;
		}
		if(checkFile == "") {
			alert("사진을 첨부해주세요.");
			return false;
		}
		return true;
	}







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
	            fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체', '바탕체'],
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

/* //게시판에 파일을 올리면 지정한 폴더에 사진을 다운로드하고 그 사진을 다시 화면에 띄운다
function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile.do",    //따로 컨트롤러 안에 추가해야됨
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			console.log("data : " + data.url);
			$(editor).summernote('insertImage', data.url);
		}
	});
} */

	// 이미지 업로드
	$(function(){
		$("input[type='file']").on("change", function(){
		alert("동작");
		
		/* 이미지 존재시 삭제 */
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}
		
		let formData = new FormData();
		let fileInput = $('input[name="fileUpload"]');
		let fileList = fileInput[0].files;
		let fileObj = fileList[0];
		

		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		alert("통과");
		
		
		console.log("fileList : " + fileList);
		console.log("fileObj : " + fileObj);
		
		console.log("fileName : " + fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);
		
	/* 	if(!fileCheck(fileObj.name, fileObj.size)) {
			return false;
		}
		 */
		
		
		formData.append("fileUpload", fileObj);
		console.log("file : " + fileObj);
		
		$.ajax({
			url: 'uploadAjaxAction2.do',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
    		success : function(result){
	    		console.log("result : " + result);
	    		showUploadImage(result);
	    	},
	    	error : function(result){
	    		alert("이미지 파일이 아닙니다.");
	    	}

		});	
	});
});

	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png|gif)$");
	let maxSize = 10000000; // 약 10MB	
	
	function fileCheck(fileName, fileSize){
	
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		return true;		
		
	}

	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){return}
		
		let uploadResult = document.getElementById('uploadResult');
		/* let uploadResult = $("#uploadResult"); */
		
		
		let obj = uploadResultArr[0];	
		
		let str = "";
		
		let oriFileCallPath = obj.apicture;
		
		console.log("oriFileCallPath : " + oriFileCallPath);
	
		
		let fileCallPath = encodeURIComponent(obj.apicture);
		console.log("fileCallPath : " + fileCallPath);

		str += "<div id='result_card'>";
		str += "<img src='display2.do?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "</div>";
		str += "<input type='hidden' name='apicture' value='" + oriFileCallPath + "'>";
		
		console.log("str : " + str);
		
		uploadResult.innerHTML = str;
		/* uploadResult.append(str); */   
	}

	
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		let targetFile = $(".imgDeleteBtn").data("file");
		
		let targetDiv = $("#result_card");
		
		$.ajax({
			url: 'deleteFile2.do',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log("result : " + result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log("result : " + result);
				
				alert("파일을 삭제하지 못하였습니다.");
			}
       });
		
	}

	

</script>

<!-- <style>
	#container { width: 700px; margin:0 auto; }
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse}
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.btn { text-align: center; }
	
	.border-none, .border-none td { border: none; }
	
</style> -->


</head>
<style type="text/css">
#result_card img{
	max-width: 100%;
    height: auto;
    display: block;
    padding: 5px;
    margin-top: 10px;
    margin: auto;	
}
#result_card {
	position: relative;
}
.imgDeleteBtn{
    position: absolute;
    top: 0;
    right: 5%;
    background-color: #ef7d7d;
    color: wheat;
    font-weight: 900;
    width: 30px;
    height: 30px;
    border-radius: 50%;
    line-height: 26px;
    text-align: center;
    border: none;
    display: block;
    cursor: pointer;	
}

.container {
	margin: 0 auto;
	width: 800px;
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
.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}
h3 {
	font-family: 'Gowun Dodum';
}

::selection {
	background: #ffba00;
	color: #fff;
}
.btn_t {
	position: relative;
	left: 50%;
	transform: translate(-50%, -50%);
	margin-top: 50px;
	text-align: center;
}

.btn_t>input {
	margin-bottom: 30px;
 	background: #ffba00;
 	border: #ffba00;
	color: white;
	border-radius: 5px;
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
						<h3>광고 상품 등록</h3>
					</div>
					<div>
						<form action="insertAdvertise.do" method="post" onsubmit="return checkAll()">
							<table class="table">
							<colgroup>
								<col style="width:8%">
								<col style="width:92%">
							</colgroup>
								<tr>
								<th>제목</th>
								<td>
									<input id="title" type="text" name="atitle">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea id="summernote" name="acontent" rows="15" cols="50"></textarea>
								</td>
							</tr>
							<tr>
								<th>링크</th>
								<td>
									<input id="link" type="text" name="alink">
								</td>
							</tr>
							<tr>
								<th>업로드</th>
								<td>
									<input type="file" id="fileUpload" name="fileUpload" style="height: 30px">
									<div id="uploadResult">
										
									</div>
								</td>
							</tr>
							</table>
							<div class="btn_t">
								<input type="submit" value="글 등록">
								<input type="button" value="취 소" onclick="location.href='getAdvertiseList.do'">
							</div>	
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










<script>
	/* 이미지 삭제 버튼 동작 */
	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		alert("삭제 시도");
		deleteFile();
	});
</script>
<!-- #page -->
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>

</body>
</html>