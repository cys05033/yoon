<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="employee.EmployeeDAO" %>
<%@ page import="employee.Employee" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세 정보 창</title>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<style>
table {
  border-collapse: separate;
  border-spacing: 10px 10px;
  width:90%;
}
tr td:first-child{
background:#6c7ae0
}
tr td:last-child{
background:#ececff
}
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
</style>
</head>
<body>
<img src="./images/logo.png" style="position:absolute; left:40px; top:20px;"/>
<%
int num = Integer.parseInt(request.getParameter("num"));
EmployeeDAO employeeDAO = new EmployeeDAO();
int employee_num = 0;
String employee_rank = "";
String employee_name = "";
String employee_ssn = "";
String employee_day = "";
String department = "";
String employee_phone = "";
String homenumber = "";
String address = "";
int gender = 1;
String hobby= "";
String specialty = "";
ArrayList<Employee> list = employeeDAO.getList();
for(int i = 0; i < list.size(); i++){
	int chk_num = list.get(i).getNum();
	
	if(chk_num == num){
		employee_num = list.get(i).getEmployee_num();
		employee_rank = list.get(i).getEmployee_rank();
		employee_name = list.get(i).getEmployee_name();
		employee_ssn = list.get(i).getEmployee_ssn();
		employee_day = list.get(i).getEmployee_day();
		department = list.get(i).getDepartment();
		employee_phone = list.get(i).getEmployee_phone();
		homenumber = list.get(i).getHomenumber();
		address = list.get(i).getAddress();
		gender = list.get(i).getGender();
		hobby = list.get(i).getHobby();
		specialty = list.get(i).getSpecialty();
		
		break;
	}
}
%>
<table>
<caption>
<h1>직원 정보</h1>
</caption>
	<tr>
		<td style="width:20%">사원번호</td><td><%= employee_num%></td>
	</tr>
	<tr>
		<td>직급</td><td><%= employee_rank%></td>
	</tr>
	<tr>
		<td>성명</td><td><%= employee_name%></td>
	</tr>
	<tr>
		<td>주민등록번호</td><td><%= employee_ssn%></td>
	</tr>
	<tr>
		<td>입사일자</td><td><%= employee_day%></td>
	</tr>
	<tr>
		<td>소속부서</td><td><%= department%></td>
	</tr>
	<tr>
		<td>전화번호(이동전화)</td><td><%= employee_phone%></td>
	</tr>
	<tr>
		<td>전화번호(자택)</td><td><%= homenumber%></td>
	</tr>
	<tr>
		<td>주소</td><td><%= address%></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
		<% 
		if(gender==1){
			out.println("남자");
		}else{
			out.println("여자");
		}
		%>
		</td>
	</tr>
	<tr>
		<td>취미</td><td><%= hobby%></td>
	</tr>
	<tr>
		<td>특기</td><td><%= specialty%></td>
	</tr>
</table>
<button id="listBtn" class="btn1">목록</button>
<button id="delBtn" class="btn1">삭제</button>
<button id="modBtn" class="btn1">수정</button>
</body>
<script>
$(document).ready(function() {
	var deleteChk;
	$("#delBtn").click(function() {
		deleteChk = confirm("정말 삭제하시겠습니까?");
		if(deleteChk == true){
			location.href="deleteAction.jsp?num=<%=num%>";
	    }
	});
	$("#listBtn").click(function() {
		location.href="index.jsp";
	});
	$("#modBtn").click(function() {
		location.href="modifyPage.jsp?num=<%=num%>";
	});
});
</script>
</html>