<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%
String userID=null;
if(session.getAttribute("userID")!=null){
    userID = (String) session.getAttribute("userID");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α��� â</title>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<script>
$(document).ready(function() {
	var sessionID = "<%=session.getAttribute("userID") %>"
	if(sessionID != "null"){
		$("#logoutForm").css('display','block');
		$("#loginForm").css('display','none');
	}
	$("#loginBtn").click(function() {
		var form_data = {
			userID: $("#userID").val(),
			userPW: $("#userPW").val()
		};
		$.ajax({
			type: "POST",
			url: "loginAction.jsp",
			data: form_data,
			success: function(response) {
				if(response.trim() != ""){
					$("#logoutForm").css('display','block');
					$("#loginForm").css('display','none');
					$("#userID").val("");
					$("#userPW").val("");
					$("#tdText").html(response.trim() + "��, �ȳ��ϼ���.");
				}else{
					alert("���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.");
					return false;
				}
			},
			error:function(){
				alert("���� �߻�");
			}
		});
		return false;
	});
	
	$("#logoutBtn").click(function() {
		var form_data = {
			userID: $("#userID").val()
		};
		$.ajax({
			type: "POST",
			url: "logoutAction.jsp",
			data: form_data,
			success: function() {
					$("#logoutForm").css('display','none');
					$("#loginForm").css('display','block');
			}
		});
		return false;
	});
	$("#joinBtn").click(function() {
		window.location = "joinPage.jsp";
	});
});
</script>
</head>
<body>
<div id="wrap">
	<form id="logoutForm" style="display:none">
		<table>
			<tr>
				<td id="tdText"><%=userID %>��, �ȳ��ϼ���.</td>
			</tr>
			<tr style="text-align:center">
				<td><input type="button" name="logoutBtn" id="logoutBtn" value="�α׾ƿ�"></td>
			</tr>
		</table>
	</form>
	<form id="loginForm" style="display:block">
		<table>
			<tr>
				<td>ID</td><td><input type="text" id="userID" name="userID"/></td>
				<td>PW</td><td><input type="text" id="userPW" name="userPW"/></td>
			</tr>
			<tr style="text-align:center">
				<td><input type="button" name="loginBtn" id="loginBtn" value="�α���"></td>
				<td><input type="button" name="joinBtn" id="joinBtn" value="ȸ������"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>