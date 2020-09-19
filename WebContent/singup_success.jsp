<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
  String name = request.getParameter("mem_name");
  %>
  <h1> <%=name%> 님 회원가입을 축하드립니다</h1>
  <p style="font-size:18px;">다시 로그인 해 주시길 바랍니다.<br></p>	
<button type="submit" class="square_btn" onclick="location.href ='login.jsp'">확인</button>

</body>
</html>