<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>
<%
String userID=null;
if(session.getAttribute("userID")!=null){
    userID = (String) session.getAttribute("userID");
}else{
	%>
	<script>
	alert("�α����� �ʿ��� �����Դϴ�.");
	location.href="index.jsp";
	</script>
	<%
}
%>
<form method="post" action="writeAction.jsp">
	<table>
		<tr>
			<th>�ۼ���</th><td><input type="text" name="userID" value="<%=userID%>" readonly/></td>
			<th>����</th><td><input type="text" name="subject"/></td>
			<th>����</th><td><textarea name="content"></textarea></td>
		</tr>
	</table>
	<input type="submit" value="���ۼ�"/>
	<input type="button" value="���"/>
</form>
</body>
</html>