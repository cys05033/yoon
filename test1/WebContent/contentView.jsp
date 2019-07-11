<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="test.UserDAO" %>
<%@ page import="test.Board" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));
UserDAO userDAO = new UserDAO();
userDAO.hit_up(num);
String board_userID = "";
String board_subject = "";
String board_content = "";
String board_day = "";
int board_hit = 0;
ArrayList<Board> list = userDAO.getList();
for(int i = 0; i < list.size(); i++){
	int board_num = list.get(i).getBoard_num();
	
	if(board_num == num){
		board_userID = list.get(i).getBoard_userID();
		board_subject = list.get(i).getBoard_subject();
		board_content = list.get(i).getBoard_content();
		board_day = list.get(i).getBoard_day();
		board_hit = list.get(i).getBoard_hit();
		
		break;
	}
}
%>
<table>
	<tr>
		<td>작성자 : <%=board_userID %>  | 작성일 : <%=board_day %> | 조회수 : <%=board_hit %></td>
	</tr>
	<tr>
		<td><%=board_subject %></td>
	</tr>
	<tr>
		<td><%=board_content %></td>
	</tr>
	
</table>
<a href="index.jsp">목록</a>
</body>
</html>