<%@page import="com.project.petmily.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MemberVO mvo = new MemberVO();
mvo.setMidx(-1);
session.setAttribute("user",mvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<script>
alert("로그아웃이 완료되었습니다");
location.href="loginPage.jsp";
</script>
</head>
<body>

</body>
</html>