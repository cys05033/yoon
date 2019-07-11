package test;

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
	private ArrayList<Board> board_list = new ArrayList<Board>();
	
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
	public ArrayList getList(){
		String SQL="SELECT * FROM board";
		try{
			pstmt=conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()){
                int board_num = rs.getInt("board_num");
                String board_userID = rs.getString("board_userID");
                String board_subject = rs.getString("board_subject");
                String board_content = rs.getString("board_content");
                String board_day = rs.getString("board_day");
                int board_hit = rs.getInt("board_hit");
                
                Board board = new Board();
                board.setBoard_num(board_num);
                board.setBoard_userID(board_userID);
                board.setBoard_subject(board_subject);
                board.setBoard_content(board_content);
                board.setBoard_day(board_day);
                board.setBoard_hit(board_hit);
                board_list.add(board);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return board_list;
	}
	
	public int write(Board board){
		long time = System.currentTimeMillis(); 
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String day = date.format(new Date(time));
		
		String SQL="INSERT INTO board (board_userID,board_subject, board_content, board_day) VALUES(?,?,?,?)";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, board.getBoard_userID());
			pstmt.setString(2, board.getBoard_subject());
			pstmt.setString(3, board.getBoard_content());
			pstmt.setString(4, day);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
	public void hit_up(int num){
		String SQL="UPDATE board SET board_hit = board_hit + 1 WHERE board_num = ?";
		try{
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
