<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pknu.it.DBConnection, java.sql.*, javax.sql.*, javax.naming.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 관리</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:useBean id="store" class="pknu.it.Store" scope="session"/>

<a href="logout.jsp" class="square_btn">로그아웃</a>
<a href="store_main.jsp" class="square_btn">메인화면</a><br><br>
<h1>'<%=store.getSt_name() %>'</h1> <h1 style="color:Tomato;"> 메뉴 리스트 </h1><br><br>
<a href="st_add_menu.jsp" class="square_btn">메뉴 추가</a><br>


<table class="type10">
    <thead>
    <tr>
        <th scope="cols">메뉴번호</th>
        <th scope="cols">메뉴이름</th>
        <th scope="cols">금액</th>
        <th scope="cols">조리시간</th>
        <th scope="cols">수정/삭제</th>
    </tr>
    </thead>
    <tbody>
<%

int store_num = store.getSt_num();
System.out.println(store_num);

Connection conn = DBConnection.getConnection();
PreparedStatement st = conn.prepareStatement("select * from menu where st_num = ?");
st.setInt(1, store.getSt_num());
ResultSet rs= st.executeQuery();

int menu_num = 0;
String menu_name = null;
int menu_price = 0;
int menu_time = 0;

boolean even = false;

while(rs.next()){
	menu_num = rs.getInt("menu_num");
	menu_name = rs.getString("menu_name");
	menu_price = rs.getInt("menu_price");
	menu_time = rs.getInt("menu_time");
	
	if (!even){
	%>
	<tr>
        <th scope="row"><%=menu_num%></th>
        <td><%=menu_name%></td>
        <td><%=menu_price%></td>
        <td><%=menu_time%>분</td>
        <td>
        	<form action ="st_menu_update_page.jsp" method = post>
        		<input type="hidden" name="menu_num" value="<%=menu_num%>"> 
				<input type="hidden" name="menu_name" value="<%=menu_name%>"> 
       			<input type="hidden" name="menu_price" value="<%=menu_price%>">  
       			<input type="hidden" name="menu_time" value="<%=menu_time%>"> 
				<input type="submit" class="square_btn" value="수정"/>
			</form>
        	<a href="st_menu_remove.jsp?menu_num=<%=menu_num %>" class="square_btn">삭제</a>
        </td>
   	</tr>
	
	<% 
		even = true;
	}
	else { %>
		<tr>
	        <th scope="row" class="even"><%=menu_num%></th>
	        <td class="even"><%=menu_name%></td>
	        <td class="even"><%=menu_price%></td>
	        <td class="even"><%=menu_time%>분</td>
	        <td class="even">
	        	<form action ="st_menu_update_page.jsp" method = post>
        		<input type="hidden" name="menu_num" value="<%=menu_num%>"> 
				<input type="hidden" name="menu_name" value="<%=menu_name%>"> 
       			<input type="hidden" name="menu_price" value="<%=menu_price%>">  
       			<input type="hidden" name="menu_time" value="<%=menu_time%>"> 
				<input type="submit" class="square_btn" value="수정"/>
			</form>
        	<a href="st_menu_remove.jsp?menu_num=<%=menu_num %>" class="square_btn">삭제</a>
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