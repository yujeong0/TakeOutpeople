<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*, java.text.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 조회</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>

<a href="logout.jsp" class="square_btn">로그아웃</a>
<a href="store_main.jsp" class="square_btn">메인화면</a><br><br>

<center>
<h1>'<%=store.getSt_name() %>'</h1> <h1 style="color:Tomato;"> 매출 </h1><br><br>

<%
int store_num = store.getSt_num();

java.util.Date day = new java.util.Date();
SimpleDateFormat sdf1 = new SimpleDateFormat("MM");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-01");
SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy");

String month = sdf1.format(day);
System.out.println("월(1~12): " + month);

String today = sdf2.format(day);
System.out.println("오늘날짜 :  " + today);

String month_firstday = sdf3.format(day);
System.out.println("월1일 :  " + month_firstday);

String year = sdf4.format(day);
System.out.println("올해년도 :  " + year);

int today_total = 0;
int month_total = 0;
int jan_total = 0, feb_total = 0, mar_total = 0, apr_total = 0, may_total = 0, jun_total = 0, jul_total = 0, aug_total = 0,sep_total = 0, oct_total = 0, nov_total= 0, dec_total = 0;

Connection conn = DBConnection.getConnection();

//오늘 매출
PreparedStatement st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time >= TO_DATE(\'"+ today.replace("-", "")  +"\')");
st.setInt(1, store_num);
ResultSet rs = st.executeQuery();
while(rs.next()){
	today_total += rs.getInt("order_amount");
}
rs.close();
st.close();



System.out.println("month : " + month);
// 이번 달 매출
if(Integer.parseInt(month)<=8){
	month = "0"+ String.valueOf(Integer.parseInt(month) + 1);
	String sql = "select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ month_firstday.replace("-", "")  +"\') and TO_DATE(\'"+ year+month+"01" +"\')";
	st = conn.prepareStatement(sql);
	System.out.println(sql);
}
else if(Integer.parseInt(month)<=11){
	month = String.valueOf(Integer.parseInt(month) + 1);
	st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ month_firstday.replace("-", "")  +"\') and TO_DATE(\'"+ year+month+"01" +"\')");
}
else
	st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ month_firstday.replace("-", "")  +"\') and TO_DATE(\'"+ year+"1231" +"\')");


st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	month_total += rs.getInt("order_amount");
}
rs.close();
st.close();


//1월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0101" +"\') and TO_DATE(\'"+ year+"0201" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	jan_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//2월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0201"  +"\') and TO_DATE(\'"+ year+"0301" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	feb_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//3월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0301"  +"\') and TO_DATE(\'"+ year+"0401" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	mar_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//4월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0401"  +"\') and TO_DATE(\'"+ year+"0501" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	apr_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//5월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0501"  +"\') and TO_DATE(\'"+ year+"0601" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	may_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//6월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0601"  +"\') and TO_DATE(\'"+ year+"0701" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	jun_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//7월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0701"  +"\') and TO_DATE(\'"+ year+"0801" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	jul_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//8월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0801"  +"\') and TO_DATE(\'"+ year+"0901" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	aug_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//9월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"0901"  +"\') and TO_DATE(\'"+ year+"1001" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	sep_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//10월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"1001"  +"\') and TO_DATE(\'"+ year+"1101" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	oct_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//11월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"1101"  +"\') and TO_DATE(\'"+ year+"1201" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	nov_total += rs.getInt("order_amount");
}
rs.close();
st.close();
//12월 매출
st = conn.prepareStatement("select * from st_order where acceptance='y' and st_num = ? and order_time between TO_DATE(\'"+ year+"1201"  +"\') and TO_DATE(\'"+ year+"1231" +"\')");
st.setInt(1, store_num);
rs = st.executeQuery();
while(rs.next()){
	feb_total += rs.getInt("order_amount");
}

rs.close();
st.close();
conn.close();

%>

<p style:"font-size:50px;">
	오늘 매출 : <%=today_total %> 원<br>
	이번달 매출 : <%=month_total %> 원
</p>

<table class="type10">

    <tbody>
    	<tr>
	        <th class="even">올해 1월 매출</th>
	        <td class="even"><%=jan_total %></td>
    	</tr>
    	<tr>
	        <th>올해 2월 매출</th>
	        <td><%=feb_total %></td>
    	</tr>
    	<tr>
	        <th class="even">올해 3월 매출</th>
	        <td class="even"><%=mar_total %></td>
    	</tr>
    	<tr>
	        <th>올해 4월 매출</th>
	        <td><%=apr_total %></td>
    	</tr>
    	<tr>
	        <th class="even">올해 5월 매출</th>
	        <td class="even"><%=may_total %></td>
    	</tr>
    	<tr>
	        <th>올해 6월 매출</th>
	        <td><%=jun_total %></td>
    	</tr>
    	<tr>
	        <th class="even">올해 7월 매출</th>
	        <td class="even"><%=jul_total %></td>
    	</tr>
    	<tr>
	        <th>올해 8월 매출</th>
	        <td><%=aug_total %></td>
    	</tr>
    	<tr>
	        <th class="even">올해 9월 매출</th>
	        <td class="even"><%=sep_total %></td>
    	</tr>
    	<tr>
	        <th>올해 10월 매출</th>
	        <td><%=oct_total %></td>
    	</tr>
    	<tr>
	        <th class="even">올해 11월 매출</th>
	        <td class="even"><%=nov_total %></td>
    	</tr>
    	<tr>
	        <th>올해 12월 매출</th>
	        <td><%=feb_total %></td>
    	</tr>
   	</tbody>
</table>


</center>

</body>
</html>