<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>노하우 작성 페이지</title>
<!-- ----------------summernote 부분 시작 ----------------- -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!-- ----------------summernote 부분 끝----------------- -->

<!-- ----------------부트스트랩 부분 시작------------------- -->
<link rel='stylesheet' href='resources/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>
<!-- ----------------부트스트랩 부분 끝------------------- -->
</head>
<style>
	#inputBtitle {
		height: 35px;
		width: 500px;
		border-radius: 8px;
	}
	form .inputBtn {  /* 수정, 목록 버튼 */
		margin-right: 15px;
		border-radius: 10px;
		background-color: #ffbb00;
		border: none;
	}
	#fileItem {  /* 사진 업로드 */
		display: none;
	}
	.entry-content .inputFileBtn:hover {
		cursor: pointer;
	}
</style>
<body>
<script>
//페이지가 로드되면 자동으로 summernote 생성
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
		            		console.log("i : " + i);
				            uploadSummernoteImageFile(files[i], this);
		            }
	            }
            }
     };

        $('#summernote').summernote(setting);
      
});

//게시판에 파일을 올리면 지정한 폴더에 사진을 다운로드하고 그 사진을 다시 화면에 띄운다
function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "uploadSummernoteImageFile.do",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			console.log("data : " + data.url);
			$(editor).summernote('insertImage', data.url);
		}
	});
}

//------------------------- 썸네일 부분 ----------------------------
/* 썸네일 이미지 업로드시 수행하는 메서드 */
function fileChange() {
	/* 이미지 존재시 삭제 */
	if ($(".imgDeleteBtn").length > 0) {
		alert('들어옴!');
		deleteFile();
	}
	
	let formData = new FormData();
	let fileInput = document.getElementById("fileItem");
	let fileList = fileInput.files;
	let fileObj = fileList[0];
	console.log("fileChange");
	
	//지정된 파일 형식이며 지정된 파일 크기를 넘지 않는지 체크 
	if (!fileCheck(fileObj.name, fileObj.size)) {
		return false;
	}
	/* for (let i = 0; i < fileList.length; i++) {
		formData.append("uploadFile", fileList[i]);
	} */
	
	formData.append("uploadFile", fileObj);
	
	$.ajax({
		url: 'uploadAjaxAction.do',
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		dataType : 'json',
		success : function(result) {
			console.log(result);
			showUploadImage(result);
		},
		error: function(result) {
			alert("에러 발생");
		}
	});
}

/* 파일 형식과 크기 지정 */
let regex = new RegExp("(.*?)\.(jpg|png|jpeg|gif)$");  //이미지 파일만
let maxSize = 5 * 1024 * 1024;  //크기 5MB

/* 지정된 형식의 파일이 들어왔는지 확인 */
function fileCheck(fileName, fileSize) {
	if (fileSize >= maxSize) {
		alert("파일 사이즈 초과");
		return false;
	}
	
	if (!regex.test(fileName)) {
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
	
	return true;
}

/* ajax로 저장된 이미지 출력 */
function showUploadImage(uploadResultArr) {
	/* 전달받은 데이터 검증 */
	if (!uploadResultArr || uploadResultArr.length == 0) {
		return;
	}
	
	let uploadResult = document.getElementById('uploadResult');
	
	let obj = uploadResultArr[0];
	
	//데이터베이스 저장시 오리지널 경로로 저장한다
	let OriFileCallPath = obj.bpict1;
	
	let str = "";
	
	//utf-8로 인코딩하기 위해 encodeURIComponent사용
	/* let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" 
		+ obj.fileName); */
	
	//replace 적용 하지 않아도 가능
	let fileCallPath = encodeURIComponent(obj.bpict1);
	console.log("fileCallPath : " + fileCallPath);
	
	str += "<div id='thumbnailDiv'>";
	str += "<img src='display.do?fileName=" + fileCallPath + "'>";
	str += "<div class='result_card' data-file='"+fileCallPath+"'>x</div>";
	str += "</div>";
	str += "<input type='hidden' name='bpict1' value='"+OriFileCallPath+"'>";
	
	uploadResult.innerHTML = str;
}


/* 썸네일 파일 삭제 메서드 */
function deleteFile() {
	let targetFile = $(".imgDeleteBtn").data("file");
	let targetDiv = $("#result_card");
	
	$.ajax({
		url: 'deleteFile.do',
		data: {fileName : targetFile},
		dataType : 'text',
		type: 'POST',
		success : function(result) {
			console.log(result);
			//x버튼 클릭시 imgDeleteBtn 부분을 없애고 파일 업로드 input 부분을 초기화한다
			targetDiv.remove();
			document.getElementById("fileItem").value = "";
		},
		error : function(result) {
			console.log(result);
			
			alert("파일을 삭제하지 못하였습니다.");
		}
	});
}


//업데이트 메서드
function update_go() {
	//제목 입력값 확인
	let title = document.getElementById("inputBtitle");
	if (title.value.trim() == "") {
		alert("제목을 입력해주세요.");
		title.focus();
		return false;
	}
	
	//썸네일 입력값 확인
	/* let thumbnail = document.getElementById("fileItem");
	if (!thumbnail.value) {
		alert("사진을 업로드해주세요.");
		thumbnail.focus();
		return false;
	} */
	
	//내용 입력값 확인
	let content = document.getElementById("summernote");
	
	if (content.value.length == 0) {
		alert("내용을 입력해주세요.");
		content.focus();
		return false;
	}
	
	var check = confirm("정말 저장하시겠습니까?");
	if (check == true) {
		document.knowhowForm.method = "post";
		document.knowhowForm.action = "updateKnowhowOk.do";
		document.knowhowForm.submit();
	}
	
}
	function list_go() {
		console.log("list_go() 실행");
		location.href = "getKnowhowList.do";		
	}
</script>
<div id="page">
	<div class="container">
		<header id="masthead" class="site-header">
		<div class="site-branding">
			<%@ include file = "header.jsp" %>
		</div>
		</header>
		<!-- 메뉴바 끝 -->
		
		<!-- #masthead -->
		<div id="content" class="site-content">
			<div id="primary" class="content-area column full">
				<header class="entry-header">
				<h1 class="entry-title">노하우 수정</h1>
				</header>
				<!-- .entry-header -->
				<div class="entry-content">
					<form name="knowhowForm">
					<p>
						자신의 노하우를 공유해보세요.
					</p>
					<strong>제목</strong>
					<input type="text" name="btitle" id="inputBtitle" value="${knowhow.btitle }">
					<input type="hidden" name="bidx" value="${knowhow.bidx }">
					<input type="hidden" name="midx" value="${user.midx }">
					<br><br>
					
					<strong>썸네일</strong>
					<input type="file" id="fileItem" name="uploadFile" accept="image/*" onchange="fileChange()" />
					<label class="inputFileBtn" for="fileItem">&nbsp; <span style="color:#ffbb00; border:1px solid #ffbb00; border-radius: 10px; padding : 5px; font-weight: bold;"> 파일 찾기 </span></label>
					<div id="uploadResult">
						<div id="result_card">
							<img src="/upload/${knowhow.bpict1 }" >
							<div class='imgDeleteBtn' data-file='${knowhow.bpict1 }'>x</div>
							<input type="hidden" name="bpict1" value="${knowhow.bpict1 }">
						</div>
					</div>
					<br><br>
					
					<strong>글 작성</strong>
					<textarea id="summernote" name="btext">${knowhow.btext }</textarea>
					<br>
					
					<strong>댕냥이</strong>
					<select name="boardcate">
						<option value=4>강아지</option>
						<option value=5>고양이</option>
					</select>
					<br><br><br>
					
					<input class="inputBtn" type="button" value="수정" onclick="update_go()">
					<input class="inputBtn" type="button" value="목록" onclick="list_go()">
					</form>
				</div>
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
<script>
	/* 이미지 삭제 버튼 동작 */ 
	$("#uploadResult").on("click", ".imgDeleteBtn", function(){
		deleteFile();
	}); 
</script>
<!-- #page -->
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/accordion.js'></script>
<script src='resources/js/tabs.js'></script>
<script src='resources/js/toggle.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>