<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포장의 민족</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>
<a href="logout.jsp" class="square_btn">로그아웃</a><br><br>

<center>
	<br><br><br> <h1 style="color:#50C8FF;font-size:70px;">포장의 민족</h1><br><br>

	<p style="color:#FDC4F8;font-size:40px;">'<%=member.getName() %>' 님, 환영합니다!</p>

	<a href="store_list.jsp" class="square_btn_pink">주문 하기</a>
	<a href="mypage.jsp" class="square_btn_pink">마이페이지</a>
	<a href="mem_order.jsp" class="square_btn_pink">주문 내역</a>
	
</center>
</body>
</html>