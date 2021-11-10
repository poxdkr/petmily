<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList 확인 페이지</title>
</head>
<body>
<table border>
<tr>
<td colspan="20"><b>생성되어 있는 모든 보드리스트 확인</b></td>
</tr>
		<c:if test="${boardList != null }">
		<tr>
			<td colspan="20">전체 boardList 불러와짐</td>
		</tr>
		<c:forEach var="board" items="${boardList }">

		<tr>
			<td><b>BIDX</b></td><td><a href="getBoard.do?bidx=${board.bidx }">${board.bidx }</a></td>
			<td><b>MIDX</b></td><td>${board.midx }</td>
			<td><b>BTITLE</b></td><td>${board.btitle }</td>
			<td><b>BTEXT</b></td><td>${board.btext }</td>
			<td><b>BPICT1</b></td><td>${board.bpict1 }</td>
			<td><b>BPICT2</b></td><td>${board.bpict2 }</td>
			<td><b>BPICT3</b></td><td>${board.bpict3 }</td>
			<td><b>BREGDATE</b></td><td>${board.bregdate }</td>
			<td><b>BOARDCATE</b></td><td>${board.boardcate }</td>
			<td><b>ALARM</b></td><td>${board.alarm }</td>
		</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${boardListByKeyword != null }">
		<tr>
			<td colspan="20">검색 boardList 불러와짐</td>
		</tr>
		<c:forEach var="board" items="${boardListByKeyword }">

		<tr>
			<td><b>BIDX</b></td><td><a href="getBoard.do?bidx=${board.bidx }">${board.bidx }</a></td>
			<td><b>MIDX</b></td><td>${board.midx }</td>
			<td><b>BTITLE</b></td><td>${board.btitle }</td>
			<td><b>BTEXT</b></td><td>${board.btext }</td>
			<td><b>BPICT1</b></td><td>${board.bpict1 }</td>
			<td><b>BPICT2</b></td><td>${board.bpict2 }</td>
			<td><b>BPICT3</b></td><td>${board.bpict3 }</td>
			<td><b>BREGDATE</b></td><td>${board.bregdate }</td>
			<td><b>BOARDCATE</b></td><td>${board.boardcate }</td>
			<td><b>ALARM</b></td><td>${board.alarm }</td>
		</tr>
		</c:forEach>
		</c:if>
	

</table>
</body>
</html>