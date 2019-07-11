package user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbURL="jdbc:mysql://localhost:3306/forwiz?serverTimezone=UTC";
			String dbID="yoon";
			String dbPW="1234";
			conn=DriverManager.getConnection(dbURL,dbID,dbPW);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public int join(User user){
		String SQL="INSERT INTO user VALUES(?,?)";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return -1;
	}
	public int login(String userID, String userPW){
		String SQL="SELECT * FROM user WHERE userID=?";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()){
                String dbPW = rs.getString(2);
                if (dbPW.equals(userPW)) 
                    return 1;
                else                  
                    return 0;
            } else {
                return -1;
            }
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}

}
