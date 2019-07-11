<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 창</title>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script>
	function chk(){
		var id = $('#joinID').val();
		var pw = $('#joinPW').val();
		var chkpw = $('#checkPW').val();
		if(!id || !pw){
			alert("값을 모두 입력해주세요.");
			false;
		}else{
			if(pw != chkpw){
				alert("비밀번호를 확인해주세요.");
				false;
			}else{
				$('#joinForm').submit();
			}	
		}
	}
</script>
</head>
<body>
<form method="post" action="joinAction.jsp" id="joinForm">
	<table>
		<tr><td>ID</td><td><input type="text" id="joinID" name="joinID"/></td></tr>
		<tr><td>Password</td><td><input type="password" id="joinPW" name="joinPW"/></td></tr>
		<tr><td>Password 확인</td><td><input type="password" id="checkPW"/></td></tr>
	</table>
	<input type="button" id="joinBtn" onclick="chk()"/>
</form>
</body>
</html>