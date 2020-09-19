<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>포장의 민족</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<center>
	<h1>포장의 민족 로그인</h1><br>
	
	<%
	Integer loginfail = null;
	
	synchronized(session){
		loginfail = (Integer)session.getAttribute("loginfail");
		if(loginfail == null){
			loginfail = 0;
		}
		session.setAttribute("loginfail", loginfail);
	}
	
	if(loginfail > 0){%>
		<%=loginfail %> 번 실패했습니다.
	<%
	}
	%>
	
	<br><br>
	<div>
	<form action="logincheck.jsp" METHOD="POST">
		매장 번호 : <input type="text" name="st_num"/><br>
		매장 이름 : <input type="text" name="st_name"/><br><br>
		<button type="submit" class="square_btn">매장 로그인</button>
	</form>
	</div>
	
	<br><br>
	<div>
	<form action="logincheck.jsp" METHOD="POST">
		회원 이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="mem_name"/><br>
		회원 비밀번호 : <input type="password" name="mem_pw"/><br><br>
		<button type="submit" class="square_btn">회원 로그인</button>
	</form>
	<br><br>
	
	<a href="signup.jsp" class="square_btn">회원가입</a>
	</div>
	
</center>
</body>

</html>