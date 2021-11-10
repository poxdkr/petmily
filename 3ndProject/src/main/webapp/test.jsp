<%@page import="java.util.List"%>
<%@page import="com.project.petmily.member.impl.MemberDAO"%>
<%@page import="com.project.petmily.member.impl.MemberServiceImpl"%>
<%@page import="com.project.petmily.member.MemberService"%>
<%@page import="com.project.petmily.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%
//1. 사용자의 정보를 session에 가지고 있다고 가정할 것. 따라서 여기서 미리 session의 유저 정보를 저장해야함. (취합 후 삭제)
// midx가 1인 유저를 하나 불러와서 쓰도록 함


//2. 보드, 댓글, 좋아요, 즐겨찾기 정보는 미리 입력한 뒤 리스트 뽑아와야 함. 데이터 미리 입력 필요.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 페이지</title>
</head>
<body>
<h1> Board DETAIL, Insert TEST 페이지</h1>

<hr>
<h2> MIDX1의 USER 불러와 저장</h2>
<hr>
<table border>
<tr>
<td>user:IDX</td><td>${user.midx }</td>
</tr>
<tr>
	<td>user:MID</td><td>${user.mid }</td>
	</tr>
<tr>
	<td>user:PWD</td><td>${user.pwd }</td>
	</tr>
<tr>
	<td>user:MNAME</td><td>${user.mname }</td>
	</tr>
<tr>
	<td>user:MEMAIL</td><td>${user.memail }</td>
	</tr>
<tr>
	<td>user:MNICKNAME</td><td>${user.mnickname }</td>
</tr>
</table>
<hr>
<p><a href="getBoardList.do">전체 BOARD LIST 확인</a></p>
<hr>
<p><form action="getBoardListByKeyword.do">
			<select name="searchCondition" id="searchCondition">
				<option>고양이</option> <!-- boardCate = 1 -->
				<option>강아지</option> <!-- boardCate = 2 -->
				<option>댕냥노하우</option> <!-- boardCate = 3 -->
				<option>자유주제</option> <!-- boardCate = 4 -->
			</select>
			<input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요!"><input type="submit" value="제목으로 검색찾기">
</form>
<hr>
<p><a href="getBoard.do">BOARD DETAIL 확인</a></p>
<hr>
<p><a href="insertBoard.do">BOARD insert 하기</a></p>

</body>
</html>