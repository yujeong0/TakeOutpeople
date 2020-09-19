<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import ="pknu.it.DBConnection, pknu.it.checkid, java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>


<% 
String name = request.getParameter("name");
int result = checkid.check(name);
if(result == 1) {
%>	<script >
alert("사용중인 이름입니다.");
location.href="signup.jsp";
</script>
<%	
}
else{

request.setCharacterEncoding("utf-8");

Connection conn = null;
PreparedStatement pst = null;



conn = DBConnection.getConnection();

String passwd = request.getParameter("passwd");
String phone = request.getParameter("tel01") + "-" + request.getParameter("tel02") + "-"
		+ request.getParameter("tel03");

if (passwd != null && name != null && phone != null) {
pst = conn.prepareStatement("insert into member values(?, ?, ?)");
pst.setString(1, passwd);
pst.setString(2,name);
pst.setString(3, phone);
pst.executeUpdate();

response.sendRedirect("singup_success.jsp?mem_name="+name);
}



	pst.close();
	conn.close();
	
}
%>


</body>
</html>