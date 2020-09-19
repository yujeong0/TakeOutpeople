<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="pknu.it.DBConnection, java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="member" class="pknu.it.Member" scope="session" />

	<%
		request.setCharacterEncoding("utf-8");
	String mem_name = request.getParameter("name");
	String mem_pwd = request.getParameter("passwd");
	String mem_phone = request.getParameter("phone");
	System.out.println(mem_name);

	Connection conn = null;
	PreparedStatement st =null;
	ResultSet rs = null;

	

	conn = DBConnection.getConnection();

	boolean success = false;
	if (mem_name != null && mem_name.equalsIgnoreCase(member.getName()) && mem_pwd != null && mem_phone != null) {
		String sql = "UPDATE MEMBER SET mem_pwd=?, mem_phone=? where mem_name=?";
		st = conn.prepareStatement(sql);
		st.setString(1, mem_pwd);
		st.setString(2, mem_phone);
		st.setString(3, mem_name);
		st.executeUpdate();

		success = true;
	}

	if (success) {
		st.close();
		conn.close();
		response.sendRedirect("mypage.jsp");
	} else {
		response.sendRedirect("mypage_update.jsp");
	}
	




	%>
</body>
</html>