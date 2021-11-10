<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PETMILY! : 이야기 새로 쓰기!</title>
<script src = "http://code.jquery.com/jquery-3.6.0.min.js"></script>


</head>
	<body>
	
	<div id = "container">
		<div class = "titleSpace">
			<h1>우리 펫 이야기</h1>
		</div>
		<div class="titleInputSpace">
			<select name="boardCondition" id="boardCondition">
				<option>고양이</option>
				<option>강아지</option>
				<option>댕냥노하우</option>
				<option>자유주제</option>
			</select>
			<input type="text" name="btitle" placeholder="이야기의 제목을 입력해주세요!">
		</div>
		
	</div>
	</body>
</html>