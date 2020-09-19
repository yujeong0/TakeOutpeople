<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>

<%
String paymethod = request.getParameter("paymethod");
String[] menu = request.getParameterValues("menu_nums");
int[] menu_num = new int[menu.length];
for(int i=0;i<menu.length;i++){
	menu_num[i] = Integer.parseInt(menu[i]);
	System.out.println(menu_num[i]);
}

String[] str_quan = request.getParameterValues("quan");
int[] quan = new int[str_quan.length];

for(int i=0;i<str_quan.length;i++){
	quan[i] = Integer.parseInt(str_quan[i]);
	System.out.println(quan[i]);
}

Connection conn = DBConnection.getConnection();
PreparedStatement st = null;
ResultSet rs = null;

int totalprice = 0;
int[] prices = new int[menu_num.length];

for(int i=0;i<menu_num.length;i++){
	st = conn.prepareStatement("select menu_price from menu where st_num = ? and menu_num = ?");
	st.setInt(1, store.getSt_num());
	st.setInt(2, menu_num[i]);

	rs = st.executeQuery();
	while(rs.next()){
		int tmp = rs.getInt("menu_price");
		prices[i] = tmp;
		totalprice += prices[i] * quan[i];
	}
}


int totaltime = 0;
int[] times = new int[menu_num.length];

for(int i=0;i<menu_num.length;i++){
	st = conn.prepareStatement("select menu_time from menu where st_num = ? and menu_num = ?");
	st.setInt(1, store.getSt_num());
	st.setInt(2, menu_num[i]);

	rs = st.executeQuery();
	while(rs.next()){
		int tmp = rs.getInt("menu_time");
		times[i] = tmp;
		totaltime += times[i] * quan[i];
	}
}


rs.close();
st.close();

st = conn.prepareStatement("select max(order_num) from st_order");
rs = st.executeQuery();
int max = -1;
while(rs.next()){
	max = rs.getInt("max(order_num)");
}
rs.close();
st.close();

SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 	
String order_time = fmt.format(System.currentTimeMillis());

st = conn.prepareStatement("insert into mem_order values(?, to_date(?, 'YYYY-MM-DD HH24:MI:SS'), ?, ?, ?)");
st.setInt(1, max+1);
st.setString(2, order_time);
st.setInt(3, totalprice);
st.setString(4, paymethod);	//일단 카드로 해놨다!!
st.setString(5, member.getName());
st.executeUpdate();
st.close();


st = conn.prepareStatement("insert into st_order values(?, ?, to_date(?, 'YYYY-MM-DD HH24:MI:SS'), ?, ?)");
st.setInt(1, max+1);
st.setInt(2, store.getSt_num());
st.setString(3, order_time);
st.setInt(4, totalprice);
st.setNull(5, java.sql.Types.NULL);
st.executeUpdate();
st.close();

for(int i=0;i<menu_num.length;i++){
	st = conn.prepareStatement("insert into order_detail values(?, ?, ?, ?, ?)");
	st.setInt(1, max+1);
	st.setInt(2, menu_num[i]);
	st.setInt(3, store.getSt_num());
	st.setInt(4, quan[i]);
	st.setInt(5, prices[i]);
	st.executeUpdate();
	st.close();
}

conn.close();


response.sendRedirect("take_time.jsp?totaltime="+totaltime);

%>


</body>
</html>