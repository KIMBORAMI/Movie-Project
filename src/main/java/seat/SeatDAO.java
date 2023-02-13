package seat;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import movie.MovieDTO;

public class SeatDAO {
	private static final String driver="oracle.jdbc.driver.OracleDriver";
	private static final String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String user="productdb";
	private static final String pwd="pass1234";
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	//좌석목록 메서드
			public List<SeatDTO> seatList() {
				List<SeatDTO> seatList=new ArrayList<SeatDTO>();
				try {
					connDB();
					String query="select seat from seattbl";
					pstmt=con.prepareStatement(query);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						String seat=rs.getString("seat"); 
						SeatDTO vo=new SeatDTO();
						vo.setSeat(seat);
						seatList.add(vo); 
					}
					rs.close();
					pstmt.close();
					con.close();
				} catch (Exception e) {
					System.out.println("좌석 목록 조회중 에러" + e);
				}
				return seatList;
			}
	
	private void connDB() {
		try {
			Class.forName(driver);
			System.out.println("Oracle 드라이버 로딩 성공");
			con=DriverManager.getConnection(url,user,pwd);
			System.out.println("Connection 생성 성공");
		} catch (Exception e) {
			System.out.println("연결오류" + e.getMessage());
		}
	}
}
