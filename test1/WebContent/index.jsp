<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="test.UserDAO" %>
<%@ page import="test.Board" %>
<%@ page import="java.util.*"%><%-- ArrayList --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
int pageNum = 1;
if(request.getParameter("pageNum") != null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<style>
html, body{
	width:100%;
	hight:100%;
}
ul {
    list-style:none;
    margin:0;
    padding:0;
}
li {
    margin: 0 0 0 0;
    padding: 0 0 0 0;
    float: left;
}
#section{
	height: 70%;
	border: 2px dashed;
}
#nav{
	border: 2px dashed;
}
#wrap{
	position: relative;
	width:100%;
}
#board_table{
	width:80%
}
</style>

<script>
$(document).ready(function() {
	//페이지 호출시 최초 사이즈 설정
	$('#wrap').css('width', parseInt($(window).width()) + 'px');
	//$('#wrap').css('height', parseInt($(window).height()) + 'px');
	$(window).resize(function() { // 브라우저 사이즈 감지
		$('#wrap').css('width', parseInt($(window).width()) + 'px');
		//$('#wrap').css('height', parseInt($(window).height()) + 'px');
	});
});

$(document).ready(function() {
	$("#writeBtn").click(function() {
		location.href="writeView.jsp";
	});
});
</script>
</head>
<body>

<div id="wrap">
	<div id="nav">
		<ul>
			<li><input type="button" value="메뉴 1"/></li>
			<li><input type="button" value="메뉴 2"/></li>
			<li><input type="button" value="메뉴 3"/></li>
		</ul>
		<jsp:include page="loginPage.jsp" flush="false"/>
	</div>
	<div id="section">
		<h1>게시물</h1>
		<table id="board_table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<%
			UserDAO userDAO = new UserDAO();
			ArrayList<Board> list = userDAO.getList();
			for(int i = 0; i < list.size(); i++){
				int board_num = list.get(i).getBoard_num();
				String board_userID = list.get(i).getBoard_userID();
				String board_subject = list.get(i).getBoard_subject();
				String board_content = list.get(i).getBoard_content();
				String board_day = list.get(i).getBoard_day();
				int board_hit = list.get(i).getBoard_hit();
			%>
			<tr>
				<td><%=board_num%></td>
				<td><a href="contentView.jsp?num=<%=board_num%>"><%=board_userID%></a></td>
				<td><%=board_subject%></td>
				<td><%=board_day%></td>
				<td><%=board_hit%></td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		int maxColumnNum = list.size();
		int maxPageNum = (int)(maxColumnNum / 5) + 1;
		for(int i = 1; i < maxPageNum + 1; i++){
			if(pageNum == i){
		%>
			<%=i%>
		<%
			}else{
		%>
			<a href="index.jsp?pageNum=<%=i%>"><%=i%></a>
		<%
			}
		}
		%>
		<input type="button" id="writeBtn" value="글쓰기"/>
	</div>
	<jsp:include page="chatting.jsp" flush="false"/>
</div>
</body>
</html>