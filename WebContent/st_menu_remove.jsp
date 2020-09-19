<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*, java.text.*" %>
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
Connection conn = null;
PreparedStatement st =null;


conn = DBConnection.getConnection();

//int store_num = store.getSt_num();
//System.out.println(store_num);
String String_menu_num = request.getParameter("menu_num");
if(String_menu_num != null){
int menu_num =Integer.parseInt(String_menu_num);
st = conn.prepareStatement("delete from menu where menu_num = ?");
st.setInt(1, menu_num);
st.executeUpdate();


response.sendRedirect("st_menu.jsp");
}
st.close();
conn.close();



%>


</body>
</html>