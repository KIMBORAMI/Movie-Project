package time;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import theater.TheaterDTO;

public class TimeDAO {
	private static final String driver="oracle.jdbc.driver.OracleDriver";
	private static final String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String user="productdb";
	private static final String pwd="pass1234";
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
		
		//영화관 목록 메서드
			public List<TimeDTO> dayList() {
				List<TimeDTO> dlist=new ArrayList<TimeDTO>();
				try {
					connDB();
					String query="select day_re from DAYtbl";
					pstmt=con.prepareStatement(query);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						String day_re=rs.getString("day_re");
						TimeDTO vo=new TimeDTO();
						vo.setDay_re(day_re);
						dlist.add(vo);
					}
					rs.close();
					pstmt.close();
					con.close();
				} catch (Exception e) {
					System.out.println("영화일정 목록 조회중 에러" + e);
				}
				return dlist;
			}
			
			public List<TimeDTO> timeList() {
				List<TimeDTO> dlist=new ArrayList<TimeDTO>();
				try {
					connDB();
					String query="select time_re from timetbl";
					pstmt=con.prepareStatement(query);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()) {
						String time_re=rs.getString("time_re");
						TimeDTO vo=new TimeDTO();
						vo.setTime_re(time_re);
						dlist.add(vo);
					} 
					rs.close();
					pstmt.close();
					con.close();
				} catch (Exception e) {
					System.out.println("영화일정 목록 조회중 에러");
				}
				return dlist;
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