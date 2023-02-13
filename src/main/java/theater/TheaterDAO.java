package theater;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class TheaterDAO {
	private static final String driver="oracle.jdbc.driver.OracleDriver";
	private static final String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String user="productdb";
	private static final String pwd="pass1234";
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
		
		//��ȭ�� ��� �޼���
			public List<TheaterDTO> theaterList() {
				List<TheaterDTO> tlist=new ArrayList<TheaterDTO>();
				try {
					connDB();
					String query="select * from THEATER";
					pstmt=con.prepareStatement(query);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						String movieTheater=rs.getString("movieTheater");
						TheaterDTO vo=new TheaterDTO();
						vo.setMovieTheater(movieTheater);
						tlist.add(vo);
					}
					rs.close();
					pstmt.close();
					con.close();
				} catch (Exception e) {
					System.out.println("��ȭ ��� ��ȸ�� ����");
				}
				return tlist;
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
