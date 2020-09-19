<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="pknu.it.DBConnection, java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<% 
request.setCharacterEncoding("utf-8");
String name = member.getName();


Connection conn = null;
PreparedStatement st =null;
ResultSet rs = null;

conn = DBConnection.getConnection();
st = conn.prepareStatement("select * from MEMBER where mem_name = ?");
st.setString(1,name);
rs = st.executeQuery();
String pwd = null;
String phone = null;
if(rs.next()){
   pwd = rs.getString("mem_pwd");
   phone = rs.getString("mem_phone");
}

rs.close();
st.close();
conn.close();

%>

<h1 style="color:#50C8FF;"> <%= name %></h1> <h1>회원 정보 조회 </h1>
<hr>

<table border="1" class="type10">
    <thead>
    <tr><th scope="cols">이름</th><td><%= name %></td></tr>
    <tr><th scope="cols">패스워드</th><td><%= pwd %></td></tr>
    <tr><th scope="cols">전화번호</th><td><%= phone %></td></tr>
    </thead>
</table>

<a href="mem_order.jsp" class="square_btn"> 주문내역 </a>
<a href="mypage_update.jsp" class="square_btn"> 회원정보 수정 </a>
<a href="mypage_delete.jsp" class="square_btn"> 회원 탈퇴  </a>
<a href="member_main.jsp" class="square_btn">메인화면</a>
<a href="logout.jsp" class="square_btn"> 로그아웃 </a>


</body>
</html>