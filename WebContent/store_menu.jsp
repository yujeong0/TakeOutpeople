<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 주문</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<% 
request.setCharacterEncoding("utf-8");
String st_num = request.getParameter("st_num");
String st_name = request.getParameter("st_name");

store.setSt_name(st_name);
store.setSt_num(Integer.parseInt(st_num));
%>
<h1><%= st_name %> 의 메뉴내역</h1>
<br>
<a href="logout.jsp" class="square_btn"> 로그아웃 </a>
<a href="mypage.jsp" class="square_btn"> 마이페이지 </a>
<a href="mem_order.jsp" class="square_btn"> 주문내역 </a>

<br><br>


<%
Connection conn = DBConnection.getConnection();

PreparedStatement st = conn.prepareStatement("select * from MENU where st_num = ?");
st.setString(1,st_num);
ResultSet rs = st.executeQuery();


 %>
<form action="add_menu.jsp" method="get" >
<table border="1" class="type10">
<thead><tr>  <th> 메뉴명 </th> <th>가격 </th> <th> 조리시간 </th>   </tr></thead>
<tbody>

  <%
while(rs.next()){
   int menu_num = rs.getInt("menu_num");
   String name = rs.getString(3);
   int price = rs.getInt(4);
   String time = rs.getString(5); 
   %>
   <tr>
	   <td><input type="checkbox" name="menu_num" value="<%=menu_num%>"> <%= name %></td>
	   <td> <%= price %>원 </td> 
	   <td> <%= time %>분 </td> 
   </tr>
   <%
   }
%>
	
	
</tbody>
</table>

<% 

   rs.close();
   st.close();
   conn.close();
%>
	<input type="submit" value="장바구니 담기" class="square_btn">
</form>
</body>
</html>