<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="employee.EmployeeDAO" %>
<%@ page import="employee.Employee" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원 수정 창</title>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
<link rel="stylesheet" type="text/css" href="css/write.css">
<style>
input[type=text]{
	border-style: solid;
    border-width: 1px;
    transition:400ms ease all;
    border-radius: 10px;
    border: none;
    padding-left:10px;
}
input[type=text]:focus {
	background:#444;
	color:#ffffff
}
</style>
</head>
<body>
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
String[] arrayHomenumber = new String[3];
String[] arrayPhone = new String[3];
String[] arraySsn = new String[2];
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
		arrayHomenumber = homenumber.split("-");
		arrayPhone = employee_phone.split("-");
		arraySsn = employee_ssn.split("-");
		address = list.get(i).getAddress();
		gender = list.get(i).getGender();
		hobby = list.get(i).getHobby();
		specialty = list.get(i).getSpecialty();
		
		break;
	}
}
%>
<script>
$(document).ready(function() {
	function chk(){
		var employee_num = $('#employee_num').val();
		var employee_rank = $('#employee_rank').val();
		var employee_name = $('#employee_name').val();
		var employee_ssn = $('#employee_ssn').val();
		var employee_day = $('#employee_day').val();
		var department = $('#department').val();
		var employee_phone1 = $('#employee_phone1').val();
		var employee_phone2 = $('#employee_phone2').val();
		if(!employee_num || !employee_rank || !employee_name || !employee_ssn || !employee_day
				|| !department ||!employee_phone1 ||!employee_phone2){
			alert("필수사항은 입력해주세요.");
			return false;
		}else{
			if(employee_ssn1.length < 6){
				alert("주민등록번호를 정확히 입력해주세요.");
				$('#employee_ssn1').focus();
				return false;
			}
			if(employee_ssn2.length < 7){
				alert("주민등록번호를 정확히 입력해주세요.");
				$('#employee_ssn2').focus();
				return false;
			}
			if(employee_phone1.length < 4){
				alert("휴대폰 번호를 정확히 입력해주세요.");
				$('#employee_phone1').focus();
				return false;
			}
			if(employee_phone2.length < 4){
				alert("휴대폰 번호를 정확히 입력해주세요.");
				$('#employee_phone2').focus();
				return false;
			}
			return true;
		}
	}
	var employee_rank = "<%=employee_rank%>";
	$("#employee_rank").val(employee_rank);
	var department = "<%=department%>";
	$("#department").val(department);
});
function go(){
	location.href="index.jsp";
}
</script>
<%
String userID="";
if(session.getAttribute("userID")!=null){
    userID = (String) session.getAttribute("userID");
}else{
	out.println("<script>alert('로그인을 해주세요.');</script>");
	out.println("<script>location.href='loginPage.jsp';</script>");
}
%>


<!-- 뭔지알지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ -->

	<div class="wrapper">
		<div id="main" style="padding:50px 0 0 0;">
		<!-- Form -->
		<form method="post" action="modifyAction.jsp?num=<%=num %>" onsubmit="return chk()" id="contact-form">
			<h3>포위즈 시스템 직원 수정</h3>
			<h4>*는 필수 입력사항입니다.</h4>
			<div>
				<label>
					<span>사원번호*</span>
					<input type="text" name="employee_num" id="employee_num"
			maxlength="6" 
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=employee_num%>" tabindex="1" required autofocus/>
				</label>
			</div>
			<div>
				<label>
					<span>직급*</span>
					<select name="employee_rank" id="employee_rank" tabindex="2">
					<option value="대리">대리</option>
					<option value="사원">사원</option>
					<option value="주임">주임</option>
					<option value="과장">과장</option>
					<option value="차장">차장</option>
					<option value="부장">부장</option>
					<option value="본부장">본부장</option>
					<option value="전무">전무</option>
					<option value="부사장">부사장</option>
					<option value="대표이사">대표이사</option>
					</select>
				</label>
			</div>
			<div>
				<label>
					<span>성명*</span>
					<input type="text" name="employee_name" id="employee_name" value="<%=employee_name%>" tabindex="3" required>
				</label>
			</div>
			
			<div>
				<label>
					<span>주민등록번호*</span>
					<input type="text" name="employee_ssn1" id="employee_ssn1" maxlength="6"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:40%" value="<%=arraySsn[0] %>" tabindex="4"/>-
				<input type="text" name="employee_ssn2" id="employee_ssn2" maxlength="7"
				onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" style="width:40%" value="<%=arraySsn[1] %>" tabindex="5"/>
				</label>
			</div>

			<div>
				<label>
					<span>입사일자*</span>
					<input type="date" name="employee_day" id="employee_day" value="<%=employee_day%>" tabindex="6"/>
				</label>
			</div>
			
			<div>
				<label>
					<span>소속부서*</span>
					<select name="department" id="department" tabindex="7">
					<option value="경영지원팀">경영지원팀</option>
					<option value="부설연구소">부설연구소</option>
					<option value="SI사업1팀">SI사업1팀</option>
					<option value="SI사업2팀">SI사업2팀</option>
					<option value="SI사업3팀">SI사업3팀</option>
					<option value="SI사업4팀">SI사업4팀</option>
					<option value="SI사업본부">SI사업본부</option>
					<option value="전략사업본부">전략사업본부</option>
					<option value="경영지원본부">경영지원본부</option>
					<option value="대표이사">대표이사</option>
					</select>
				</label>
			</div>
			
			<div>
				<label>
					<span>전화번호(자택)</span>
					<input type="text" name="homenumber" id="homenumber" value="<%=arrayHomenumber[0] %>" style="width:20%" readonly tabindex="8"/>-
					<input type="text" name="homenumber1" id="homenumber1" maxlength="4"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=arrayHomenumber[1] %>" style="width:30%" tabindex="9"/>-
					<input type="text" name="homenumber2" id="homenumber2" maxlength="4" 
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=arrayHomenumber[2] %>" style="width:30%" tabindex="10"/>
				</label>
			</div>
			
			<div>
				<label>
					<span>전화번호(이동전화)*</span>
					<input type="text" name="employee_phone" id="employee_phone" value="<%=arrayPhone[0] %>" style="width:20%" readonly tabindex="11"/>-
					<input type="text" name="employee_phone1" id="employee_phone1" maxlength="4"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=arrayPhone[1] %>" style="width:30%" tabindex="12"/>-
					<input type="text" name="employee_phone2" id="employee_phone2" maxlength="4" 
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="<%=arrayPhone[2] %>" style="width:30%" tabindex="13"/>
				</label>
			</div>
			
			<div>
				<label>
					<span>주소*</span>
					<input type="text" name="address" id="address" value="<%=address%>" tabindex="14"/>
				</label>
			</div>
			
			<div>
				<label>
					<span>성별*</span>
					<%if(gender == 1){
					%>
					남자<input type="radio" name="gender" id="gender" value="1" tabindex="15" checked/>여자<input type="radio" name="gender" id="gender" value="2"/>
					<%
					}else{
					%>
					남자<input type="radio" name="gender" id="gender" value="1" tabindex="15"/>여자<input type="radio" name="gender" id="gender" value="2" checked/>
					<%} %>
				</label>
			</div>
			
			<div>
				<label>
					<span>취미</span>
					<input type="text" name="hobby" id="hobby" value="<%=hobby%>" tabindex="16"/>
				</label>
			</div>
			
			<div>
				<label>
					<span>특기</span>
					<input type="text" name="specialty" id="specialty" value="<%=specialty%>" tabindex="17"/>
				</label>
			</div>
			
			<div>
				<button name="submit" type="submit" id="contact-submit">수정 완료</button>
				<button type="button" onclick="go()">취소</button>
			</div>
		</form>
		<!-- /Form -->
		</div>
	</div>


</body>
</html>