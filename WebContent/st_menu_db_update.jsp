<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>
<%

int store_num = store.getSt_num();
System.out.println(store_num);

int menu_num = Integer.parseInt(request.getParameter("menu_num"));
String menu_name = request.getParameter("menu_name");
int menu_price = Integer.parseInt(request.getParameter("menu_price"));
int menu_time = Integer.parseInt(request.getParameter("menu_time"));

Connection conn = DBConnection.getConnection();
PreparedStatement st = conn.prepareStatement("update menu set menu_name=?, menu_price=?, menu_time=? where st_num = ? and menu_num = ?");
st.setString(1, menu_name);
st.setInt(2, menu_price);
st.setInt(3, menu_time);
st.setInt(4, store_num);
st.setInt(5, menu_num);

st.executeUpdate();

st.close();
conn.close();

response.sendRedirect("st_menu.jsp");
%>


</body>
</html>