<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>

<a href="logout.jsp" class="square_btn">로그아웃</a>
<a href="store_main.jsp" class="square_btn">메인화면</a><br><br>
<h1>'<%=store.getSt_name() %>'</h1> <h1 style="color:Tomato;"> 주문 리스트 </h1> <br>
<table class="type10">
    <thead>
    <tr>
        <th scope="cols">주문번호</th>
        <th scope="cols">주문시각</th>
        <th scope="cols">금액</th>
        <th scope="cols">수락여부</th>
    </tr>
    </thead>
    <tbody>
<%

int store_num = store.getSt_num();
System.out.println(store_num);

Connection conn = DBConnection.getConnection();

/*
PreparedStatement st= conn.prepareStatement("insert into st_order values(?, ?, ?, ?, ?)");
st.setInt(1, 1);
st.setInt(2, 1);
String time = "2013-04-08 10:10:10";

DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date utilDate = (java.util.Date)sdf.parse(time);
java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

st.setDate(3, sqlDate);
st.setInt(4, 14000);
st.setString(5, "y");
st.executeUpdate();
st.close();
*/
PreparedStatement st = conn.prepareStatement("select * from st_order where st_num = ?");
st.setInt(1, store_num);
ResultSet rs= st.executeQuery();

int order_num = 0;
String order_time = null;
int order_amount = 0;
String acceptance = null;

boolean even = false;

while(rs.next()){
	order_num = rs.getInt("order_num");
	order_amount = rs.getInt("order_amount");
	acceptance = rs.getString("acceptance");
	
	SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss"); 
	//order_time = sdf.format(rs.getDate("order_time"));
	order_time = fmt.format(rs.getTimestamp("order_time").getTime());
	System.out.format("%d %d %s \n", order_num, order_amount, order_time);

	
	if (!even){
	%>
	<tr>
        <th scope="row"><a href="st_order_detail.jsp?order_num=<%=order_num%>&order_amount=<%=order_amount%>"><%=order_num%></a></th>
        <td><%=order_time%></td>
        <td><%=order_amount %></td>
        <td>
        <% 
        	if(acceptance == null){
        %>
        	<form method="get" action="Accept_order.jsp">
	        	<label><input type="radio" name="acceptance" value="y">YES</label>
	        	<label><input type="radio" name="acceptance" value="n">NO</label>
	        	<input type="hidden" name="order_num" value="<%=order_num%>"/>
	        	<p><input type="submit" value="submit">
        	</form>
        <%	}
        	else {
        		if(acceptance.equalsIgnoreCase("y")){
        			%> YES <%
        		}
        		else {
        			%> NO<%
        		}
        	}
        %>
        </td>
   	</tr>
	
	<% 
		even = true;
	}
	else { %>
		<tr>
	        <th scope="row" class="even"><a href="st_order_detail.jsp?order_num=<%=order_num%>&order_amount=<%=order_amount%>"><%=order_num%></th>
	        <td class="even"><%=order_time%></td>
	        <td class="even"><%=order_amount %></td>
	        <td class="even">
		        	<% 
	        	if(acceptance == null){
	        %>
	        	<form method="get" action="Accept_order.jsp">
		        	<label><input type="radio" name="acceptance" value="y">YES</label>
		        	<label><input type="radio" name="acceptance" value="n">NO</label>
		        	<input type="hidden" name="order_num" value="<%=order_num%>"/>
		        	<p><input type="submit" value="submit">
	        	</form>
	        <%	}
	        	else {
	        		if(acceptance.equalsIgnoreCase("y")){
	        			%> YES <%
	        		}
	        		else {
	        			%> NO<%
	        		}
	        	}
	        %>
	        </td>
    	</tr>
	<%	
		even = false;
	}
}

rs.close();
st.close();
conn.close();
%>
    </tbody>
</table>


</body>
</html>