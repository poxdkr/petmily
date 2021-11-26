<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>광고 상세 보기</title>

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
	function checkAll() {
		var checkTitle = $('#title').val();
		var checkContent = $('#summernote').val();
		var checkLink = $('#link').val();

		if (checkTitle == null || checkTitle == "") {
			alert("제목을 입력하세요.");
			return false;
		}
		if (checkContent == null || checkContent == "") {
			alert("내용을 입력하세요.");
			return false;
		}
		if (checkLink == null || checkLink == "") {
			alert("링크를 입력하세요.");
			return false;
		}
		alert("수정이 완료되었습니다.")
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
	             ['style', ['bold', 'italic', 'underline', 'clear']],
	             // 글자색
	             ['color', ['forecolor','color']],
	             
	             
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
	               placeholder : '내용',
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

	// 이미지 업로드
	$(function() {
		$("input[type='file']").on("change", function() {
			alert("동작");

			/* 이미지 존재시 삭제 */
			if ($(".imgDeleteBtn").length > 0) {
				deleteFile();
			}

			let formData = new FormData();
			let fileInput = $('input[name="fileUpload"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			if (!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}
			alert("통과");

			/* console.log("fileList : " + fileList);
			console.log("fileObj : " + fileObj);
			
			console.log("fileName : " + fileObj.name);
			console.log("fileSize : " + fileObj.size);
			console.log("fileType(MimeType) : " + fileObj.type); */

			/* 	if(!fileCheck(fileObj.name, fileObj.size)) {
			 return false;
			 }
			 */

			formData.append("fileUpload", fileObj);

			$.ajax({
				url : 'uploadAjaxAction.do',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지 파일이 아닙니다.");
				}

			});
		});
	});

	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png|gif)$");
	let maxSize = 10000000; // 약 10MB	

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

	/* 이미지 출력 */
	function showUploadImage(uploadResultArr) {
		/* 전달받은 데이터 검증 */
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return
		}

		let uploadResult = document.getElementById('uploadResult');
		/* let uploadResult = $("#uploadResult"); */

		let obj = uploadResultArr[0];

		let str = "";

		let oriFileCallPath = obj.apicture;

		console.log("oriFileCallPath : " + oriFileCallPath);

		let fileCallPath = encodeURIComponent(obj.apicture);
		console.log("fileCallPath : " + fileCallPath);

		str += "<div id='result_card'>";
		str += "<img src='display.do?fileName=" + fileCallPath + "'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "</div>";
		str += "<input type='hidden' name='apicture' value='" + oriFileCallPath + "'>";

		console.log("str : " + str);

		uploadResult.innerHTML = str;
		/* uploadResult.append(str); */
	}

	/* 파일 삭제 메서드 */
	function deleteFile() {

		let targetFile = $(".imgDeleteBtn").data("file");

		let targetDiv = $("#result_card");

		$.ajax({
			url : 'deleteFile.do',
			data : {
				fileName : targetFile
			},
			dataType : 'text',
			type : 'POST',
			success : function(result) {
				console.log(result);
				alert("파일을 삭제");
				targetDiv.remove();
				$("input[type='file']").val("");

			},
			error : function(result) {
				console.log(result);

				alert("파일을 삭제하지 못하였습니다.");
			}
		});

	}

	
	$(document).ready(function() {
		// 상세보기 버튼 처리
		var operForm = $("#operForm");

		$("button[data-oper='remove']").on("click", function(e) {
			alert("삭제");
			operForm.attr("action", "deleteAdvertise.do");
			console.log("dddddd");
			operForm.submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#aidx").remove();
			operForm.attr("action", "getAdvertiseList.do");
			operForm.submit();
		});
		
		
		
		
		// 수정페이지 디스플레이
		$("#updateAdv").click(function(e) {
			
			$(".updatePage").css("display", "block");
			$(".detailPage").css("display", "none");
		});

		$("#cancel").click(function() {
			
			$(".updatePage").css("display", "none");
			$(".detailPage").css("display", "block");
		});
		
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {
			alert("삭제버튼 클릭");
			/* alert("삭제 시도"); */
			deleteFile();

		});
		

	});
	
	function deleteAdv(a){
		var aidx = a;
		var yn = confirm("삭제하시겠습니까?");
		if (yn == true) {
		location.href='advertiseDelete.do?aidx='+a;
		} else if (yn == false) {
			location.href="getAdvertise.do?aidx="+a;
		}
		
	}
	
	
</script>

</head>
<style type="text/css">


.detailPage {
	margin: 0 auto;
}

.updatePage {
	display: none;
}

.btn_t {
	position: relative;
	left: 50%;
	transform: translate(-50%, -50%);
	margin-top: 50px;
	text-align: center;
}


/*
.detail {
	position: relative;
	margin: 0 auto;
	width: 600px;
	height: 400px;
	border: 1px solid lightgrey;
	border-radius: 10px;
	text-align: center;
}
.item {
	position: relative;
	margin: 10px;
}

.item nth:child(1) {
	width: 550px;
}

.btn {
	text-align: center;
	margin: 10px;
}
*/

/* 사진첨부부분 */
#result_card img {
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

.imgDeleteBtn {
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
table tr td a {
	
}

table tr td a:hover {
	color: #ffba00;
}

table tr nth:child(0) {
	width: 450px;
}

#detailImg {
	width: 350px;
}

.advertiseImg{
	width: 450px;
	text-align: center;
}

button {
	border-radius: 3px;
	background: #ffba00;
	border: #ffba00;
	color: white;
	font-family: 'Gowun Dodum';
}

.site-content {
	color: black;
	font-family: 'Gowun Dodum';
}

h2{
	font-family: 'Gowun Dodum';
}

::selection {
	background: #ffba00;
	color: #fff;
}

#primary {
    width: 70%;
    float: none !Important;
	margin: 0 auto;
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
					<div class="detailPage">
						<div>
							<h2>광고 상세 보기</h2>
						</div>
						<div class="detail">
							<table>
							<colgroup>
								<col style="width: 25%">
								<col style="width: 75%">
							</colgroup>
								<tr>
									<td class="advertiseImg" colspan="2"><img id="detailImg" src="/upload/${selectAdvertise.apicture }" style="width: 400px"></td>
								</tr>
								<tr>
									<th>광고 타이틀</th>
									<td>${selectAdvertise.atitle }</td>
								</tr>
								<tr>
									<th>광고 카피</th>
									<td>${selectAdvertise.acontent }</td>
								</tr>
								<tr>
									<th>광고 등록일</th>
									<td>${selectAdvertise.aregdate }</td>
								</tr>
								<tr>
									<th>링크</th>
									<td><a href="${selectAdvertise.alink }">광고 상품 페이지</a></td>
								</tr>
							</table>
			
						</div>
			
						<div class="btn_t">
							 <%-- <form id='operForm' action="" method="get">
								<input type="hidden" name="aidx" value="${selectAdvertise.aidx }"> 
								<input type="hidden" name="pageNum" value="${cri.pageNum}"> 
								<input type="hidden" name="amount" value="${cri.amount}">
								<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
								<span><button id="updateAdv">수 정</button></span> 
								<span><button data-oper="remove">삭 제</button></span> 
								<span><button data-oper="list">목 록</button></span>
							</form> --%>
			
							<input type="hidden" name="pageNum" value="${cri.pageNum}"> 
							<input type="hidden" name="amount" value="${cri.amount}"> 
							<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
							<span><button id="updateAdv">수 정</button></span>
							<span><button onclick="deleteAdv(${selectAdvertise.aidx})">삭 제</button></span>
							<span><button onclick="location.href='getAdvertiseList.do'">목 록</button></span>
						</div>
					</div>
		
		
				<!-- 수정페이지 -->
					<div class="updatePage">
						<div>
							<h2>광고 상품 수정</h2>
						</div>
						<hr>
						<div>
							<form action="updateAdvertise.do" method="get" onsubmit="return checkAll()">
								<table>
									<tr>
										<th>제목</th>
										<td>
											<input id="title" type="text" name="atitle"value="${selectAdvertise.atitle }" style="width: 413px;">
										</td>
									</tr>
									<tr>
										<th>내용</th>
										<td>
											<textarea id="summernote" name="acontent">${selectAdvertise.acontent }</textarea>
										</td>
									</tr>
									<tr>
										<th>링크</th>
										<td>
											<input id="link" type="text" name="alink" style="width: 413px;" value="${selectAdvertise.alink }">
										</td>
									</tr>
									<tr>
										<th>업로드</th>
										<td><input type="file" id="fileItem" name="fileUpload"
											style="height: 30px">
											<div id="uploadResult">
												<div id="result_card">
													<img src="/upload/${selectAdvertise.apicture}"> 
													<div class="imgDeleteBtn" data-file="${selectAdvertise.apicture }">x</div>
													<input type="hidden" name="apicture" value="${selectAdvertise.apicture }">
												</div>
											</div>
										</td>
									</tr>
								</table>
								<div class="btn_t">
									<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
									<input type="hidden" name="aidx" value="${selectAdvertise.aidx }">
									<input type="submit" value="글 수정" style="border-radius: 3px; background: #ffba00; border: #ffba00; color: white;"> 
									<input type="button" value="취 소" id="cancel" style="border-radius: 3px; background: #ffba00; border: #ffba00; color: white;">
								</div>
							</form>
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
	<%@ include file="footer.jsp" %>
</div>

<!-- #page -->
<script src='resources/js/jquery.js'></script>
<script src='resources/js/plugins.js'></script>
<script src='resources/js/scripts.js'></script>
<script src='resources/js/masonry.pkgd.min.js'></script>
</body>
</html>