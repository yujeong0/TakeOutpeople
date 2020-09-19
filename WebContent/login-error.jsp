<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 실패</title>
</head>
<body>

<%
Integer loginfail = null;
synchronized(session){
	loginfail = (Integer)session.getAttribute("loginfail");
	if(loginfail == null){
		loginfail = 0;
	}
	loginfail++;
	session.setAttribute("loginfail", loginfail);
}
response.sendRedirect("login.jsp");
%>

</body>
</html>