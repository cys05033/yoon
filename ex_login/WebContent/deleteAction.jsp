<%-- ������ ����Ʈ �� ���� --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="employee.EmployeeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	EmployeeDAO employeeDAO = new EmployeeDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	int result = employeeDAO.delete(num);
	if(result == 1){
		out.println("<script>location.href='index.jsp';</script>");
	}
	else{
		out.println("<script>alert('�����Դϴ�.');</script>");
		out.println("<script>location.href='index.jsp';</script>");
	}
%>