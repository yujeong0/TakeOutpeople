<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴추가</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>

<a href="logout.jsp" class="square_btn">로그아웃</a>
<a href="store_main.jsp" class="square_btn">메인화면</a><br><br>

<center>

	<h1>'<%=store.getSt_name() %>'</h1> <h1 style="color:Tomato;"> 메뉴 추가 </h1> <br><br>
<div>
	<FORM ACTION ="st_menu_db_add.jsp" METHOD = POST>
		메뉴이름 : <INPUT TYPE="text" NAME="menu_name" SIZE=15> <br><br>
		금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <INPUT TYPE="text" NAME="menu_price" SIZE=15> <br><br>
		조리시간 : <INPUT TYPE="text" NAME="menu_time" SIZE=15> <br><br>
		<input type="submit" class="square_btn" value="추가"/>
	</FORM>
</div>
</center>
</body>
</html>