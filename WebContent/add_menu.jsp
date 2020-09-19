<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<h1>장바구니</h1>
<%
int store_num = store.getSt_num();
System.out.println(store_num);

String[] menu = request.getParameterValues("menu_num");
int[] menu_num = new int[menu.length];
for(int i=0;i<menu.length;i++){
	menu_num[i] = Integer.parseInt(menu[i]);
	System.out.println(menu_num[i]);
}

Connection conn = null;
PreparedStatement st = null;
ResultSet rs = null;
%>

<form method="get" action="order_to_db.jsp">
<table border="1" class="type10">
<thead><tr>  <th> 메뉴명 </th> <th>수량 </th></tr></thead>
<tbody><%

	for(int i=0;i<menu_num.length;i++){
		conn = DBConnection.getConnection();
		st = conn.prepareStatement("select menu_name from menu where st_num = ? and menu_num = ?");
		st.setInt(1, store_num);
		st.setInt(2, menu_num[i]);
		rs = st.executeQuery();
		String menu_name = null;
		while(rs.next()){
			menu_name = rs.getString("menu_name");
		}
		
		
	%>
	<tr>
	   <td><%= menu_name %></td>
	   <td>
	   		<select name="quan">
	        	<option value="1" selected>1</option>
	        	<option value="2">2</option>
	        	<option value="3">3</option>
	        	<option value="4">4</option>
	        	<option value="5">5</option>
        	</select>
	   </td> 
   	</tr>
  <% } %>
	</tbody>
	</table>
	<br>결제수단 선택 : &nbsp;&nbsp;
	<input type= "radio" name= "paymethod" value = "카드">카드
    <input type= "radio" name= "paymethod" value = "현금">현금&nbsp;&nbsp;

	
<% for(int i=0;i<menu_num.length;i++){
%>
	<input type="hidden" name="menu_nums" value="<%=menu_num[i]%>"/>
<%}%>		
	
	<input type="submit" value="주문" class="square_btn"  >
</form>



<%

rs.close();
st.close();
conn.close();
%>



</body>
</html>