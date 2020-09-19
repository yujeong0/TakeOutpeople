<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 주문 수락/취소 </title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>


<%
String acc = request.getParameter("acceptance");
int order_num = Integer.parseInt(request.getParameter("order_num"));

Connection conn = DBConnection.getConnection();
PreparedStatement st = null;

if(acc.equalsIgnoreCase("y")){
	st = conn.prepareStatement("update st_order set acceptance = 'y' where order_num = ?");
	st.setInt(1, order_num);
	st.executeUpdate();
	%>
	<h1>주문이 수락되었습니다!</h1><br>
<%
}
else {
	st = conn.prepareStatement("update st_order set acceptance = 'n' where order_num = ?");
	st.setInt(1, order_num);
	st.executeUpdate();
	st.close();
	
	st = conn.prepareStatement("delete from mem_order where order_num = ?");
	st.setInt(1, order_num);
	st.executeUpdate();
	
	%>
	<h1>주문이 취소되었습니다!</h1><br>
<%
}


st.close();
conn.close();
%>

<a href="st_order.jsp" class="square_btn">주문 리스트 보기</a><br><br>

</body>
</html>