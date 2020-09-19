<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="pknu.it.DBConnection, java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 정보 수정</title>
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

if(rs.next()){
	String pwd = rs.getString("mem_pwd");
	String phone = rs.getString("mem_phone");
%>

<h1> 회원정보 수정 </h1>
<hr>
<form action="mypage_updatePro.jsp" method="post">

<table border="1" class="type10">
    <thead>
    <tr><th scope="cols">이름 </th><td><input type = "text" name = "name" value="<%= name %>" readonly> </td></tr>
    <tr><th scope="cols">패스워드  </th><td><input type = "password" name = "passwd" value="<%= pwd %>"> </td></tr>
    <tr><th scope="cols">전화번호  </th><td><input type = "text" name = "phone" value="<%= phone %>"></td></tr>
    </thead>
</table>

  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

  <button type="submit" class="square_btn"> 저장 </button>
</form>


<% 
}

rs.close();
st.close();
conn.close();

%>

</body>
</html>