<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="test.UserDAO" %>
<%@ page import="test.Board" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	UserDAO userDAO = new UserDAO();
	String userID = request.getParameter("userID");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	Board board = new Board();
	
	board.setBoard_userID(userID);
	board.setBoard_subject(subject);
	board.setBoard_content(content);

	userDAO.write(board);
	
	response.sendRedirect("index.jsp");
%>