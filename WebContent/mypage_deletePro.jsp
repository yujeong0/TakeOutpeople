<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="pknu.it.DBConnection, java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 탈퇴 </title>
</head>
<body>

<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<%
request.setCharacterEncoding("utf-8");
String name = member.getName();

Connection conn = null;
PreparedStatement st =null;


conn = DBConnection.getConnection();

if( name != null){
	st = conn.prepareStatement("delete from mem_order where mem_name = ?");
	st.setString(1,name);
	st.executeQuery();
	st.close();
	
	st = conn.prepareStatement("delete from member where mem_name = ?");
	st.setString(1,name);
	st.executeUpdate();

}

st.close();
conn.close();
	response.sendRedirect("login.jsp");

%>



</body>
</html>