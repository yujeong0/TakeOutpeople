<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pknu.it.checkid, java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <form method="post" action = "checkID.jsp">
<% 
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");

int result = checkid.check(id);

	 if(result == 1 ){
		 %>
		 
		 <%=id%>는 이미 사용중인 아이디입니다. <br><br>
		<%
		}
		else {
		%>
   <%= id %>는 사용가능한 아이디입니다. <br>
  <% 		
	 }
 %>
 
 </form>
 



</body>
</html>