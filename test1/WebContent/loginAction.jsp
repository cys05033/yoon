<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="test.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	UserDAO userDAO = new UserDAO();
	String userID = request.getParameter("userID");
	String userPW = request.getParameter("userPW");
	int result = userDAO.login(userID, userPW);
	if(result == 1){
		session.setAttribute("userID",userID);
		out.print(session.getAttribute("userID"));
	}
%>