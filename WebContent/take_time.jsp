<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <% 
int totaltime = Integer.parseInt(request.getParameter("totaltime"));
%>
<br>
<form action="mem_order.jsp" METHOD="POST" width=300px, height=200px>    
	<p style="color:red;font-size:40px;"> 준비 예상 시간은 <%= totaltime %> 분 입니다.</p>	
<br>
<p style="font-size:20px;">자세한 내역은 <a href="mem_order.jsp" class="square_btn"> 주문내역 </a>에서 확인하세요.<br></p>	
<p style="font-size:18px;">(매장에서 주문 취소시 내역이 삭제됩니다.)<br></p>	
<button type="submit" class="square_btn">확인</button>
	</form>


</body>
</html>