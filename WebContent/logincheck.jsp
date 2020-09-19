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
<jsp:setProperty name="store" property="*"/>
<jsp:useBean id="member" class="pknu.it.Member" scope="session"/>
<jsp:setProperty name="member" property="*"/>
<%
String st_num = request.getParameter("st_num");
String st_name = request.getParameter("st_name");
String mem_name = request.getParameter("mem_name");
String mem_pwd = request.getParameter("mem_pw");

Connection conn = null;
PreparedStatement st =null;
ResultSet rs = null;
boolean success = false;

if(st_num != null && st_num.length() > 0 && st_name != null && st_name.length() > 0){
   conn = DBConnection.getConnection();
   st = conn.prepareStatement("select * from store");
   rs= st.executeQuery();

   while(rs.next()){
      if(rs.getInt("st_num") == Integer.parseInt(st_num) && rs.getString("st_name").equalsIgnoreCase(st_name)){
         store.setSt_name(st_name);
         store.setSt_num(Integer.parseInt(st_num));
         
         success = true;
         response.sendRedirect("store_main.jsp");
      }
   }
   if(!success){ %>
	   <script>
	   alert("아이디와 비밀번호가 맞지 않습니다.");
	   history.go(-1);
	  </script>
 <% 
   }
   rs.close();
   st.close();
   conn.close();
}


else if (mem_name != null && mem_pwd != null  && mem_name.length() > 0  && mem_pwd.length() > 0){
    conn = DBConnection.getConnection();
      st = conn.prepareStatement("select * from member");
      rs= st.executeQuery();

      while(rs.next()){
         if( rs.getString("mem_name").equalsIgnoreCase(mem_name) && rs.getString("mem_pwd").equalsIgnoreCase(mem_pwd)){
            member.setName(mem_name);
            
            success = true;
            response.sendRedirect("member_main.jsp");
         }
      }
      if(!success){%>
	   <script>
	   alert("아이디와 비밀번호가 맞지 않습니다.");
	   history.go(-1);
	  </script> 
<% 
      }
      rs.close();
      st.close();
      conn.close();
   
}


else {
   
   %>
    <script>
   alert("아이디와 비밀번호를 확인해 주세요.");
   history.go(-1);
  </script>
   <%

}


%>


</body>
</html>