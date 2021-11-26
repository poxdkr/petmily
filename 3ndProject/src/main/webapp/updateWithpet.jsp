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
	#inputBtitle {  /* 가게명 작성 부분 */
		height: 35px;
		width: 500px;
	}
	.entry-content .inputBtn {  /* 저장, 목록 버튼 */
		margin-right: 15px;
		border-radius: 10px;
		background-color: #ffbb00;
		border: none;
	}
	.entry-content .inputBar {
		border-radius: 7px;
		margin-top: 10px;
	}
	#linkBar {  /* 링크 입력바 */
		width: 350px;
	}
	#locationBar {  /* 위치 입력바 */
		width: 350px;
	}
	#fileItem {  /* 파일 업로드 */
		display:none;
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
	str += "<input type='hidden' name='thumbnail' value='"+OriFileCallPath+"'>";
	
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
			alert("가게명을 입력해주세요.");
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
			document.knowhowForm.action = "updateWithpetOk.do";
			document.knowhowForm.submit();
		}
		
	}
	
	function list_go() {
		console.log("list_go() 실행");
		location.href = "getWithpetList.do";		
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
				<h1 class="entry-title">위드펫 수정</h1>
				</header>
				<!-- .entry-header -->
				<div class="entry-content">
					<form name="knowhowForm">
					<strong>가게명</strong>
					<input type="text" name="placename" id="inputBtitle" value="${withpet.placename }">
					<input type="hidden" name="widx" value="${withpet.widx }">
					<br><br>
					
					<strong>링크</strong>
					<input class="inputBar" id="linkBar" type="text" name="link" value="${withpet.link }">
					<br><br>
					
					<strong>썸네일</strong>
					<input type="file" id="fileItem" name="uploadFile" accept="image/*" onchange="fileChange()" />
					<label class="inputFileBtn" for="fileItem">(업로드)</label>
					<div id="uploadResult">
						<div id="result_card">
							<img src="/upload/${withpet.thumbnail }" >
							<div class='imgDeleteBtn' data-file='${withpet.thumbnail }'>x</div>
							<input type="hidden" name="thumbnail" value="${withpet.thumbnail }">
						</div>
					</div>
					<br><br>
					
					<strong>위치(위도, 경도)</strong>
					<input class="inputBar" id="locationBar" type="text" name="location" value="${withpet.location }">
					<br><br>
					
					<strong>주소</strong>
					<input class="inputBar" type="text" name="postcode" id="postcode" placeholder="우편번호">
					<input class="inputBar" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input class="inputBar" class="inputBar" type="text" name="address" id="address" placeholder="주소"><br>
					<input class="inputBar" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
					<input class="inputBar" type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
					<br><br>
					
					<strong>글 작성</strong>
					<textarea id="summernote" name="content">${withpet.content }</textarea>
					<br>
					
					<strong>종류</strong>
					<select name="placetype">
						<option value=1>음식점</option>
						<option value=2>카페</option>
						<option value=3>호텔</option>
						<option value=4>동물병원(24시)</option>
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

<!-- 주소 api 스크립트 시작 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<!-- 주소 api 스크립트 끝 -->

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