<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그아웃 </title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<center>
<h1>로그아웃 되었습니다.</h1><br><br>
<%
session.invalidate();
%>

<a href="login.jsp" class="square_btn">다시 로그인하기</a>
</center>


</body>
</html>