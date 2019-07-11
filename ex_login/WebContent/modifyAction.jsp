<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="employee.EmployeeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%
	EmployeeDAO employeeDAO = new EmployeeDAO();
	int num = Integer.parseInt(request.getParameter("num"));
	int employee_num = Integer.parseInt(request.getParameter("employee_num"));
	String employee_rank = request.getParameter("employee_rank");
	String employee_name = request.getParameter("employee_name");
	String employee_ssn = request.getParameter("employee_ssn1") + "-" + request.getParameter("employee_ssn2");
	String employee_day = request.getParameter("employee_day");
	String department = request.getParameter("department");
	String employee_phone = "010-" + request.getParameter("employee_phone1")+ "-" + request.getParameter("employee_phone2");
	String homenumber = request.getParameter("homenumber") + "-" + request.getParameter("homenumber1") + "-" + request.getParameter("homenumber2");
	String address = request.getParameter("address");
	int gender = Integer.parseInt(request.getParameter("gender"));
	String hobby= request.getParameter("hobby");
	String specialty = request.getParameter("specialty");
	
	int result = employeeDAO.modify(employee_num, employee_rank, employee_name, employee_ssn, employee_day,
			department,employee_phone,homenumber,address,gender,hobby,specialty, num);
	if(result == 1){
		out.println("<script>location.href='index.jsp';</script>");
	}
	else{
		out.println("<script>alert('SQL 오류');</script>");
		out.println("<script>location.href='index.jsp';</script>");
	}
%>