package employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import employee.Employee;
public class EmployeeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	ArrayList<Employee> employee_list = new ArrayList<Employee>();
	
	public EmployeeDAO(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL="jdbc:mysql://localhost:3306/forwiz?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String dbID="yoon";
			String dbPW="1234";
			conn=DriverManager.getConnection(dbURL,dbID,dbPW);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	//리스트에 넣기
	public ArrayList getList(){
		String SQL="SELECT * FROM employee ORDER BY employee_num";
		try{
			pstmt=conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				 int num = rs.getInt("num");
	            int employee_num = rs.getInt("employee_num");
	            String employee_rank = rs.getString("employee_rank");
	            String employee_name = rs.getString("employee_name");
	            String employee_ssn = rs.getString("employee_ssn");
	            String employee_day = rs.getString("employee_day");
	            String department = rs.getString("department");
	            String employee_phone = rs.getString("employee_phone");
	            String homenumber = rs.getString("homenumber");
	            String address = rs.getString("address");
	            int gender = rs.getInt("gender");
	            String hobby= rs.getString("hobby");
	            String specialty = rs.getString("specialty");
	            
	            Employee employee = new Employee();
	            employee.setNum(num);
	            employee.setEmployee_num(employee_num);
	            employee.setEmployee_rank(employee_rank);
	            employee.setEmployee_name(employee_name);
	            employee.setEmployee_ssn(employee_ssn);
	            employee.setEmployee_day(employee_day);
	            employee.setDepartment(department);
	            employee.setEmployee_phone(employee_phone);
	            employee.setHomenumber(homenumber);
	            employee.setAddress(address);
	            employee.setGender(gender);
	            employee.setHobby(hobby);
	            employee.setSpecialty(specialty);
	            employee_list.add(employee);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return employee_list;
	}
	public int join(int employee_num, String employee_rank, String employee_name, 
			String employee_ssn, String employee_day,
			String department,String employee_phone,String homenumber,String address,
			int gender,String hobby,String specialty){
		
		String SQL="INSERT INTO employee"
				+ " (employee_num,employee_rank,employee_name,employee_ssn,employee_day,department,"
				+ "employee_phone,homenumber,address,gender,hobby,specialty)"
				+ " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, employee_num);
			pstmt.setString(2, employee_rank);
			pstmt.setString(3, employee_name);
			pstmt.setString(4, employee_ssn);
			pstmt.setString(5, employee_day);
			pstmt.setString(6, department);
			pstmt.setString(7, employee_phone);
			pstmt.setString(8, homenumber);
			pstmt.setString(9, address);
			pstmt.setInt(10, gender);
			pstmt.setString(11, hobby);
			pstmt.setString(12, specialty);
			
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	public ArrayList search(String s_name, String s_dep){
		String SQL="SELECT * FROM employee WHERE employee_name = ? AND department = ? ORDER BY employee_num ";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, s_name);
			pstmt.setString(2, s_dep);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				int num = rs.getInt("num");
	            int employee_num = rs.getInt("employee_num");
	            String employee_rank = rs.getString("employee_rank");
	            String employee_name = rs.getString("employee_name");
	            String employee_ssn = rs.getString("employee_ssn");
	            String employee_day = rs.getString("employee_day");
	            String department = rs.getString("department");
	            String employee_phone = rs.getString("employee_phone");
	            String homenumber = rs.getString("homenumber");
	            String address = rs.getString("address");
	            int gender = rs.getInt("gender");
	            String hobby= rs.getString("hobby");
	            String specialty = rs.getString("specialty");
	            
	            Employee employee = new Employee();
	            employee.setNum(num);
	            employee.setEmployee_num(employee_num);
	            employee.setEmployee_rank(employee_rank);
	            employee.setEmployee_name(employee_name);
	            employee.setEmployee_ssn(employee_ssn);
	            employee.setEmployee_day(employee_day);
	            employee.setDepartment(department);
	            employee.setEmployee_phone(employee_phone);
	            employee.setHomenumber(homenumber);
	            employee.setAddress(address);
	            employee.setGender(gender);
	            employee.setHobby(hobby);
	            employee.setSpecialty(specialty);
	            employee_list.add(employee);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return employee_list;
	}
	
	public ArrayList search(String search, int chk){
		String SQL ="";
		if(chk == 1){ //name
			SQL="SELECT * FROM employee WHERE employee_name = ? ORDER BY employee_num";
		}else{ //dep
			SQL="SELECT * FROM employee WHERE department = ? ORDER BY employee_num";
		}
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, search);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
				int num = rs.getInt("num");
	            int employee_num = rs.getInt("employee_num");
	            String employee_rank = rs.getString("employee_rank");
	            String employee_name = rs.getString("employee_name");
	            String employee_ssn = rs.getString("employee_ssn");
	            String employee_day = rs.getString("employee_day");
	            String department = rs.getString("department");
	            String employee_phone = rs.getString("employee_phone");
	            String homenumber = rs.getString("homenumber");
	            String address = rs.getString("address");
	            int gender = rs.getInt("gender");
	            String hobby= rs.getString("hobby");
	            String specialty = rs.getString("specialty");
	            
	            Employee employee = new Employee();
	            employee.setNum(num);
	            employee.setEmployee_num(employee_num);
	            employee.setEmployee_rank(employee_rank);
	            employee.setEmployee_name(employee_name);
	            employee.setEmployee_ssn(employee_ssn);
	            employee.setEmployee_day(employee_day);
	            employee.setDepartment(department);
	            employee.setEmployee_phone(employee_phone);
	            employee.setHomenumber(homenumber);
	            employee.setAddress(address);
	            employee.setGender(gender);
	            employee.setHobby(hobby);
	            employee.setSpecialty(specialty);
	            employee_list.add(employee);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return employee_list;
	}
	public int delete(int num){
		String SQL="DELETE FROM employee WHERE num = ?";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	
	public int modify(int employee_num, String employee_rank, String employee_name, 
			String employee_ssn, String employee_day,
			String department,String employee_phone,String homenumber,String address,
			int gender,String hobby,String specialty, int num){
		
		String SQL="UPDATE employee SET"
				+ " employee_num = ?, employee_rank = ?, employee_name = ?, employee_ssn =?, employee_day = ?,"
				+ "department = ?, employee_phone = ?, homenumber = ?, address = ?, gender =?,"
				+ "hobby = ?, specialty = ?"
				+ " WHERE num = ?";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, employee_num);
			pstmt.setString(2, employee_rank);
			pstmt.setString(3, employee_name);
			pstmt.setString(4, employee_ssn);
			pstmt.setString(5, employee_day);
			pstmt.setString(6, department);
			pstmt.setString(7, employee_phone);
			pstmt.setString(8, homenumber);
			pstmt.setString(9, address);
			pstmt.setInt(10, gender);
			pstmt.setString(11, hobby);
			pstmt.setString(12, specialty);
			pstmt.setInt(13, num);
			
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
}
