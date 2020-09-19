<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장분류별조회</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<% 
request.setCharacterEncoding("utf-8");
String st_class = request.getParameter("st_class");

%>

<a href="logout.jsp" class="square_btn"> 로그아웃 </a>
<a href="mypage.jsp" class="square_btn"> 마이페이지 </a>
<a href="mem_order.jsp" class="square_btn"> 주문내역 </a>

<br><br>
<h1> <%= st_class %> 매장 내역 </h1>

<% 
Connection conn = DBConnection.getConnection();

String sqlStr = "select * from STORE where st_class = '"+ st_class+ "'";

PreparedStatement st = conn.prepareStatement(sqlStr);
ResultSet rs = st.executeQuery();

%>
  
<table border="1" class="type10">
<thead><tr>
<th scope="cols">매장 </th> 
<th scope="cols">매장 전화번호 </th> 
<th scope="cols"> 매장주소 </th>   
</tr></thead>
  <%
while(rs.next()){
   String num = rs.getString(1);
   String name = rs.getString(2);
   String phone = rs.getString(3);
   String address = rs.getString(4); 
   //System.out.format("store( %s, %s, %s) \n " , name, phone, address);
   %><tr>
   </td> <td> <a href="store_menu.jsp?st_num=<%= num %>&st_name=<%= name %>" > <%= name %> </a>  </td>
   <td> <%= phone %> </td> 
   <td> <%= address %></td> 
   <%

   }
  



   rs.close();
   st.close();
   conn.close();
%>
</table>
</body>
</html>