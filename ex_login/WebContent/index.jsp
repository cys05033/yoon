<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="employee.EmployeeDAO" %>
<%@ page import="employee.Employee" %>
<%@ page import="java.util.*"%><%-- ArrayList --%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 화면</title>
<link rel="stylesheet" type="text/css" href="indexstyle.css">
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<style>
.btn1{
  background:#6c7ae0;
  color:#fff;
  border:none;
  position:relative;
  height:40px;
  font-size:1.2em;
  padding:0 2em;
  cursor:pointer;
  transition:400ms ease all;
  outline:none;
  border-radius: 10px;
}
.btn1:hover{
  background:#ececff;
  color:#666666;
}
.btn1:before,.btn1:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:400ms ease all;
}
.btn1:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn1:hover:before,.btn1:hover:after{
  width:100%;
  transition:800ms ease all;
}
.search{
	display: inline-block; 
	float:right;
	margin-right:15px;
}
input[type=search]{
	border-style: solid;
    border-width: 1px;
    transition:800ms ease all;
    border-radius: 10px;
    border: none;
    padding-left:10px;
}
input[type=search]:focus {
	background:#6c7ae0;
	color:#ffffff
}
</style>
<script>
$(document).ready(function() {
	$("#newBtn").click(function() {
		location.href="writePage.jsp";
	});
});
</script>
<!-- 스크립트 추가사항 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<!-- 스크립트 종료 -->
</head>
<body>
<%
String userID="";
if(session.getAttribute("userID")!=null){
    userID = (String) session.getAttribute("userID");
}else{
	out.println("<script>alert('로그인을 해주세요.');</script>");
	out.println("<script>location.href='loginPage.jsp';</script>");
}
String s_name = "";
String s_dep = "";

//page start
int pageNum = 1;
if(request.getParameter("pageNum") != null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}
//page end

if(request.getParameter("s_name")!=null){
	s_name = request.getParameter("s_name");
}
if(request.getParameter("s_dep")!=null){
	s_dep = request.getParameter("s_dep");
}
EmployeeDAO employeeDAO = new EmployeeDAO();
ArrayList<Employee> list;
if(s_name.length() != 0 && s_dep.length() != 0){
	//out.println("<script>alert('검색기능 테스트');</script>");
	//EmployeeDAO employeeDAO = new EmployeeDAO();
	list = employeeDAO.search(s_name, s_dep);
}else if(s_name.length() != 0 && s_dep.length() == 0){
	list = employeeDAO.search(s_name,1);
}else if(s_name.length() == 0 && s_dep.length() != 0){
	list = employeeDAO.search(s_dep,2);
}else{
	list = employeeDAO.getList();
}
%>
	<div class="limiter">
		<div class="container-table100">
		<img src="./images/logo.png" style="position:absolute; left:40px; top:20px;"/>
		<span style="position:absolute; left:200px; top:20px;">
			<%=userID %>님 안녕하세요!
			<a href="logoutAction.jsp">로그아웃</a>
		</span>
			<div class="wrap-table100">
			
			<div class="table">

						<div class="row header">
							<div class="cell" style="text-align:center">
								검색창
							</div>
						</div>
						<div class="row">
							<div class="cell">
								<form method="post" action="index.jsp">
								<span style="display: inline-block">
									<label for="s_name">성명</label>
									<input type="search" name="s_name">
								</span>
								<span style="display: inline-block">
									<label for="s_dep">소속부서</label>
									<input type="search" name="s_dep">
								</span>
								<span class="search">
									<input type="submit" value="검색" class="btn1" id="searchBtn"/>
								</span>
								</form>
							</div>
						</div>
					</div>
				</div>
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								순번
							</div>
							<div class="cell">
								사원이름
							</div>
							<div class="cell">
								직급
							</div>
							<div class="cell">
								성명
							</div>
							<div class="cell">
								주민등록번호
							</div>
							<div class="cell">
								입사일자
							</div>
							<div class="cell">
								소속부서
							</div>
							<div class="cell">
								전화번호
							</div>
						</div>

<%
//EmployeeDAO employeeDAO = new EmployeeDAO();
//ArrayList<Employee> list = employeeDAO.getList();
int maxColumnNum = list.size();
int maxPageNum = 1;
if(maxColumnNum % 5 == 0){
	maxPageNum = (int)(maxColumnNum / 5);
}else{
	maxPageNum = (int)(maxColumnNum / 5) + 1;
}
int count = (pageNum - 1) * 5;
for(int i = (pageNum - 1) * 5; i < pageNum * 5; i++){
	count += 1;
	if(i >= maxColumnNum)break;
	int num = list.get(i).getNum();
	int employee_num = list.get(i).getEmployee_num();
	String employee_rank = list.get(i).getEmployee_rank();
	String employee_name = list.get(i).getEmployee_name();
	String employee_ssn = list.get(i).getEmployee_ssn();
	String employee_day = list.get(i).getEmployee_day();
	String department = list.get(i).getDepartment();
	String employee_phone = list.get(i).getEmployee_phone();

%>
						<div class="row">
							<div class="cell">
								<%=count %>
							</div>
							<div class="cell">
								<%=employee_num %>
							</div>
							<div class="cell">
								<%=employee_rank %>
							</div>
							<div class="cell">
								<a href="contentView.jsp?num=<%=num%>"><%=employee_name%></a>
							</div>
							<div class="cell">
								<%=employee_ssn %>
							</div>
							<div class="cell">
								<%=employee_day %>
							</div>
							<div class="cell">
								<%=department %>
							</div>
							<div class="cell">
								<%=employee_phone %>
							</div>
						</div>
<%} %>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
						<div class="row">
							<div class="cell">
							</div>
							<div class="cell">
							</div>
							<div class="cell">
							</div>
							<div class="cell">
							</div>
							<div class="cell">
							</div>
							<div class="cell">
							<%
							int paging = (int)(pageNum / 4) + 1;
							//for(int i = 1; i < maxPageNum + 1; i++){
							for(int i = paging * 3 - 2; i <= paging * 3; i++){
								//신규
								if(paging != 1 && i == paging * 3 - 2){
									%>
									<a href="index.jsp?pageNum=<%=(paging - 1) * 3%>">이전</a>
									<%
								}
								if(i > maxPageNum)break;
								if(pageNum == i){
							%>
								<%=i%>
							<%
								}else{
							%>
								<a href="index.jsp?pageNum=<%=i%>"><%=i%></a>
							<%
								}
								//신규 두번째 조건 확인
								if(i == 3 * paging && paging * 3 < maxPageNum){
									%>
									<a href="index.jsp?pageNum=<%=paging * 3 + 1%>">다음</a>
									<%
								}
							}
							%>
							</div>
							<div class="cell">
							</div>
							<div class="cell">
								<input type="button" id="newBtn" value="신규" class="btn1"/>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</body>
</html>