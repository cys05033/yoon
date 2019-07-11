<%-- 페이지 임포트 및 설정 --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	UserDAO userDAO = new UserDAO();//UserDAO 객체 생성
	String userID = request.getParameter("userID");//userID 객체 받아옴
	String userPW = request.getParameter("userPW");//userPW 객체 받아옴
	int result = userDAO.login(userID, userPW); //userDAO 객체의 login 메서드 실행 후 리턴 값을 result에 저장
	if(result == 1){//만약 로그인이 성공했다면
		session.setAttribute("userID",userID); //세션에 아이디 저장
		out.println("<script>location.href='index.jsp';</script>");
	}
	else{
		out.println("<script>alert('아이디나 비밀번호를 확인해주세요.');</script>");
		out.println("<script>location.href='loginPage.jsp';</script>");
	}
%>