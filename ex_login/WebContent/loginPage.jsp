<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 창</title>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<link rel="stylesheet" type="text/css" href="css/login.css">
<script>
	function chk(){
		var userID = $('#userID').val();
		var userPW = $('#userPW').val();
		if(!userID){
			alert("아이디를 입력하세요.");
			return false;
		}
		if(!userPW){
			alert("비밀번호를 입력하세요.")
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<%
String userID="";
if(session.getAttribute("userID")!=null){
    userID = (String) session.getAttribute("userID");
}
if(userID.equals("")){
%>
<form class="sign-up" method="post" action="loginAction.jsp" onsubmit="return chk()">
   <h1 class="sign-up-title">로그인 창</h1>
   <input type="text" class="sign-up-input" placeholder="아이디를 입력하세요!" name="userID" id="userID" autofocus/>
   <input type="password" class="sign-up-input" placeholder="비밀번호를 입력하세요!" name="userPW" id="userPW"/>
   <input type="submit" value="로그인" class="sign-up-button">
 </form>
<%
}else{
	out.println("<script>location.href='index.jsp';</script>");
}
%>
</body>
</html>