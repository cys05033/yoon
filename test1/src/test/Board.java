package test;

public class Board {
	private int board_num;
	private String board_userID;
	private String board_subject;
	private String board_content;
	private String board_day;
	private int board_hit;
	
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public String getBoard_day() {
		return board_day;
	}
	public void setBoard_day(String board_day) {
		this.board_day = board_day;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_userID() {
		return board_userID;
	}
	public void setBoard_userID(String board_userID) {
		this.board_userID = board_userID;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
}
