<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 </title>
</head>
<body>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<% 
request.setCharacterEncoding("utf-8");
String name = member.getName();
%>

<h1>회원 탈퇴 페이지</h1>
<hr>
<form action="mypage_deletePro.jsp" method="post">
<p style="color:#50C8FF;font-size:40px;"> <%= name %>님 정말 탈퇴하시겠습니까? 탈퇴시 되돌릴 수 없습니다. </p><br>
<input type="submit" value="탈퇴하기">
 <input type="reset" value="취소" onclick="location.href ='mypage.jsp'" >
</form>

</body>
</html>