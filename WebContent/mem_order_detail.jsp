<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세 정보</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<%
int order_num = Integer.parseInt(request.getParameter("order_num"));
int order_amount = Integer.parseInt(request.getParameter("order_amount"));
%>

<h1 style="color:Tomato;"><%=order_num %>번 주문 정보</h1><br>

<table class="type10">
<thead>
<tr>
    <th scope="cols">메뉴</th>
    <th scope="cols">수량</th>
    <th scope="cols">가격</th>
</tr>
</thead>
<tbody>

<%

String mem_name = member.getName();


Connection conn = DBConnection.getConnection();
PreparedStatement st = conn.prepareStatement("select * from mem_order natural join order_detail natural join menu where mem_name = ? and order_num = ?");
st.setString(1, mem_name);
st.setInt(2, order_num);
ResultSet rs= st.executeQuery();

int db_order_num = 0;
int menu_num = 0;		// 메뉴가 삭제되면 조회할 수 없는데 그래서 order_datail에 가격을 추가해놨긴 한데 일단 pass 
int quantity = 0;
int menu_price = 0;
String menu_name = null;

boolean even = false;

while(rs.next()){
	menu_num = rs.getInt("menu_num");
	quantity = rs.getInt("quantity");
	menu_price = rs.getInt("menu_price");
	menu_name = rs.getString("menu_name");
	
	
	
	if (!even){
	%>
	<tr>
        <th scope="row"><%=menu_name%></th>
        <td><%=quantity%></td>
        <td><%=menu_price %></td>
   	</tr>
	
	<% 
		even = true;
	}
	else { %>
		<tr>
	        <th scope="row" class="even"><%=menu_name%></th>
	        <td class="even"><%=quantity%></td>
	        <td class="even"><%=menu_price %></td>
    	</tr>
	<%	
		even = false;
	}
}

%>
    </tbody>
</table>

<h1>총 금액 : <%=order_amount%>원</h1>
<p>

<a href="mem_order.jsp" class="square_btn">주문 리스트 보기</a><br><br>

<%
rs.close();
st.close();
conn.close();
%>
</body>
</html>