<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import ="pknu.it.DBConnection, pknu.it.checkid, java.sql.*,javax.naming.*,javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
 <script type="text/javascript">
 function checkWrite() {
		
	 if (document.form1.name.value == "") {
		alert("이름을 입력하세요");
		document.form1.name.focus();
	}else if (document.form1.passwd.value == "") {
		alert("비밀번호를 입력하세요");
		document.form1.passwd.focus();
	}else if (document.form1.passwdchk.value == "") {
		alert("확인 비밀번호를 입력하세요");
		document.form1.passwdchk.focus();
	}else if (document.form1.tel01.value == "" || document.form1.tel02.value == "" || document.form1.tel03.value == "") {
		alert("휴대폰 번호를 입력하세요");
		document.form1.tel01.focus();
	}
	else if(document.form1.passwd.value != "" && document.form1.passwdchk.value != ""){
		if(document.form1.passwd.value != document.form1.passwdchk.value){
			alert("비밀번호가 일치하지 않습니다.");
			document.form1.passwd.focus();
		}

	else {
		document.form1.submit();
	}
}
}
	
 function checkid() {
	 if (document.form1.name.value == "") {
			alert("이름을 입력하세요");
		return;
	}
	 var url = "checkID.jsp?id="+document.form1.name.value ;
	open(url,"중복확인","toolbar=no, status=no, menubar=no, scrollbars=no, resizalbe=no, width=300px, height=200px");     	

}
	</script>
<a href="login.jsp" class="square_btn">로그인화면</a><br><br>

<center>
<h1> 회원 가입 </h1> <br><br>
<div2>

	<form name="form1" method="post" action="signupPro.jsp">
					      이름 : <input id="NAMEcheck" type="text" maxlength="10" name="name" SIZE=15>
							<input type="button"value="중복확인" onclick="checkid();"/>  <br><br>
							
						비밀번호 : <input name="passwd" type="password" SIZE=15 ><br><br>
						
						비밀번호 확인 : <input name="passwdchk" type="password" SIZE=15> <br><br>
						
					       전화번호 : <input name="tel01" type="text" SIZE=10> - <input name="tel02" type="text" SIZE=10> - <input name="tel03" type="text" SIZE=10> <br><br>
				
			
						<input type="button"
							value="회원가입" onclick="checkWrite();"> 
							<input type="reset" value="다시 작성" >

</div2>
</form>
</center>	
</body>
	
</html>