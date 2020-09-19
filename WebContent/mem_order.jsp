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
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<a href="logout.jsp" class="square_btn">로그아웃</a>
<a href="member_main.jsp" class="square_btn">메인화면</a><br><br>
<h1>'<%=member.getName() %>'</h1> <h1 style="color:Tomato;"> 주문 리스트 </h1> <br>
<table class="type10">
    <thead>
    <tr>
        <th scope="cols">주문번호</th>
        <th scope="cols">주문시각</th>
        <th scope="cols">금액</th>
        <th scope="cols">결제수단</th>
    </tr>
    </thead>
    <tbody>
<%

String mem_name = member.getName();
//System.out.println(store_num);

Connection conn = DBConnection.getConnection();

PreparedStatement st = conn.prepareStatement("select * from mem_order where mem_name = ?");
st.setString(1, mem_name);
ResultSet rs= st.executeQuery();

int order_num = 0;
String order_time = null;
int order_amount = 0;
String paymethod = null;



while(rs.next() ){
	order_num = rs.getInt("order_num");
	order_amount = rs.getInt("order_amount");
	paymethod = rs.getString("paymethod");
	
	SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss"); 
	//order_time = sdf.format(rs.getDate("order_time"));
	order_time = fmt.format(rs.getTimestamp("order_time").getTime());
	System.out.format("%d %d %s \n", order_num, order_amount, order_time);

	

	%>
	<tr>
        <th scope="row"><a href="mem_order_detail.jsp?order_num=<%=order_num%>&order_amount=<%=order_amount%>"><%=order_num%></a></th>
        <td><%=order_time%></td>
        <td><%=order_amount %></td>
        <td><%=paymethod %>
        </td>
   	 </tr>	
	<%        	}
rs.close();
st.close();
conn.close();
%>
    </tbody>
</table>


</body>
</html>