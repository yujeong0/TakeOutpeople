<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장분류</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<center>
<div style="height:700px;">
<h1> 주문하기 </h1><br><br>


<a href="storelist_detail.jsp?st_class=한식"><img src="image/korean.png"></a>
<a href="storelist_detail.jsp?st_class=중식"><img src="image/chinese.png"></a>
<a href="storelist_detail.jsp?st_class=양식"><img src="image/foreign.png"></a> <br>
<a href="storelist_detail.jsp?st_class=분식"><img src="image/tteok.png"></a>
<a href="storelist_detail.jsp?st_class=패스트푸드"><img src="image/fastfood.png"></a>
<a href="storelist_detail.jsp?st_class=치킨"><img src="image/chicken.png"></a> <br>
<a href="storelist_detail.jsp?st_class=디저트"><img src="image/dessert.png"></a> <br>
<br>
<br>

<a href="logout.jsp" class="square_btn"> 로그아웃 </a>
<a href="mypage.jsp" class="square_btn"> 마이페이지 </a>
<a href="mem_order.jsp" class="square_btn"> 주문내역 </a>
<a href="member_main.jsp" class="square_btn">메인화면</a>

</div>

</center>

</body>
</html>