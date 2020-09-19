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


String menu_name = request.getParameter("menu_name"); 
String string_menu_price = request.getParameter("menu_price"); 
String string_menu_time = request.getParameter("menu_time"); 


if(menu_name != null && string_menu_price != null && string_menu_time!= null && menu_name.length() >0 && string_menu_price.length() >0 && string_menu_time.length() >0){

int menu_price = Integer.parseInt(string_menu_price);
int menu_time = Integer.parseInt(string_menu_time); 


Connection conn = DBConnection.getConnection();
PreparedStatement st = conn.prepareStatement("select max(menu_num) from menu where st_num = ?");
st.setInt(1, store_num);
ResultSet rs = st.executeQuery();

int max = -1;
while(rs.next()){
	max = rs.getInt("max(menu_num)");
}

System.out.println(max);

st = conn.prepareStatement("insert into menu values(?, ?, ?, ?, ?)");
st.setInt(1, store_num);
st.setInt(2, max+1);
st.setString(3, menu_name);
st.setInt(4, menu_price);
st.setInt(5, menu_time);

st.executeUpdate();

st.close();
conn.close();

response.sendRedirect("st_menu.jsp");
}
else {
	   
	   %>
	    <script>
	   alert("속성값을 모두 입력해주세요.");
	   history.go(-1);
	  </script>
	   <%

	}

%>

</body>
</html>