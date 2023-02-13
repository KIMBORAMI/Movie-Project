package user;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;



public class UserDAO {

	private static final String driver="oracle.jdbc.driver.OracleDriver";
	private static final String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String user="productdb";
	private static final String pwd="pass1234";
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;


	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USERTABLE WHERE userID = ?";
		try {
			connDB();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPW))
					return 1; // �α��� ����
				else
					return 0; // ��й�ȣ Ʋ��
			}
			return -1; // ���̵� ����
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
	
	public int join(UserDTO user) {
		String SQL = "INSERT INTO USERTABLE VALUES (?, ?, ?)";
		try {
			connDB();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserName());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // ȸ������ ����

	}
	
	public int myUser(String userID) {
		try {
			connDB();
			String SQL = "SELECT * FROM USERTABLE WHERE userID = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}

	
	private void connDB() {
		try {
			Class.forName(driver);
			System.out.println("Oracle ����̹� �ε� ����");
			con=DriverManager.getConnection(url,user,pwd);
			System.out.println("Connection ���� ����");
		} catch (Exception e) {
			System.out.println("�������" + e.getMessage());
		}
	}

}


