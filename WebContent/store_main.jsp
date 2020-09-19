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
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>
<a href="logout.jsp" class="square_btn">로그아웃</a><br><br>
<center>
	<br><br><br> <h1 style="color:#50C8FF;font-size:70px;">포장의 민족</h1><br><br>
	
	<p style="color:#FDC4F8;font-size:40px;">'<%=store.getSt_name() %>' 님, 환영합니다!</p>
	
	
	<a href="st_menu.jsp" class="square_btn_pink">메뉴 관리</a>
	<a href="st_order.jsp" class="square_btn_pink">주문 내역</a>
	<a href="st_sales.jsp" class="square_btn_pink">매출 조회</a>
	
</center>
</body>
</html>