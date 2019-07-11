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
	alert("로그인이 필요한 서비스입니다.");
	location.href="index.jsp";
	</script>
	<%
}
%>
<form method="post" action="writeAction.jsp">
	<table>
		<tr>
			<th>작성자</th><td><input type="text" name="userID" value="<%=userID%>" readonly/></td>
			<th>제목</th><td><input type="text" name="subject"/></td>
			<th>내용</th><td><textarea name="content"></textarea></td>
		</tr>
	</table>
	<input type="submit" value="글작성"/>
	<input type="button" value="목록"/>
</form>
</body>
</html>