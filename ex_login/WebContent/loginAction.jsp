<%-- ������ ����Ʈ �� ���� --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	UserDAO userDAO = new UserDAO();//UserDAO ��ü ����
	String userID = request.getParameter("userID");//userID ��ü �޾ƿ�
	String userPW = request.getParameter("userPW");//userPW ��ü �޾ƿ�
	int result = userDAO.login(userID, userPW); //userDAO ��ü�� login �޼��� ���� �� ���� ���� result�� ����
	if(result == 1){//���� �α����� �����ߴٸ�
		session.setAttribute("userID",userID); //���ǿ� ���̵� ����
		out.println("<script>location.href='index.jsp';</script>");
	}
	else{
		out.println("<script>alert('���̵� ��й�ȣ�� Ȯ�����ּ���.');</script>");
		out.println("<script>location.href='loginPage.jsp';</script>");
	}
%>