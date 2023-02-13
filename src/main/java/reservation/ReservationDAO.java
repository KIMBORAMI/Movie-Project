package reservation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import movie.MovieDTO;
import time.TimeDTO;



public class ReservationDAO {
	private static final String driver="oracle.jdbc.driver.OracleDriver";
	private static final String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String user="productdb";
	private static final String pwd="pass1234";
	private static Connection con;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	//영화예매
	public int reset(ReservationDTO reservationDTO) {
		try {
			connDB();
			String SQL = "INSERT INTO RESERVATION(userID, movieName, movieTheater, day_re, time_re) SELECT a.userid , b.movieName ,c.movieTheater, d.day_re, e.time_re FROM USERTABLE a, MOVIE b , THEATER c, DAYtbl d, TIMEtbl e WHERE a.USERID=? and b.movieName=? and c.movieTheater=? and d.day_re=? and e.time_re=?";
			pstmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			pstmt.setString(1, reservationDTO.getUserID());
			pstmt.setString(2, reservationDTO.getMovieName());
			pstmt.setString(3, reservationDTO.getMovieTheater());
			pstmt.setString(4, reservationDTO.getDay_re());
			pstmt.setString(5, reservationDTO.getTime_re());
			return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} 
			return -1;
		}
	
	//myPage(특정사용자)영화예매 메서드
	public List<ReservationDTO> myReservtion(String userID) {
		List<ReservationDTO> myReservtionlist=new ArrayList<ReservationDTO>();
		try {
			connDB();
			String SQL="select * from RESERVATION WHERE USERID=?";
			pstmt=con.prepareStatement(SQL);
			System.out.println(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String userID1=rs.getString("userID");
				String movieName=rs.getString("movieName");
				String movieTheater=rs.getString("movieTheater");
				String day_re=rs.getString("day_re");
				String time_re=rs.getString("time_re");
				ReservationDTO vo=new ReservationDTO();
				vo.setUserID(userID1);
				vo.setMovieName(movieName);
				vo.setMovieTheater(movieTheater);
				vo.setDay_re(day_re);
				vo.setTime_re(time_re);
				myReservtionlist.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("영화예매 조회중 에러"+e);
		}
		return myReservtionlist;
	}
	//좌석 선택
	static public int seatReset(ReservationDTO seatDTO) {
		try {
			connDB();
			String SQL = "UPDATE reservation SET seat = ? WHERE userID=?";
			pstmt = con.prepareStatement(SQL);
			System.out.println(SQL);
			pstmt.setString(1, seatDTO.getSeat());
			pstmt.setString(2, seatDTO.getUserID());
			return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if(pstmt != null) pstmt.close();
					if(rs != null) pstmt.close();
					if(con != null) con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return -1;
		
		}
	//영화목록 메서드
		public List<ReservationDTO> reservationList(String userID) {
			List<ReservationDTO> relist=new ArrayList<ReservationDTO>();
			try {
				connDB();
				String query="select * from RESERVATION WHERE userID=?";
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, userID);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					String userID1=rs.getString("userID");
					String movieName=rs.getString("movieName");
					String movieTheater=rs.getString("movieTheater");
					String day_re=rs.getString("day_re");
					String time_re=rs.getString("time_re");
					ReservationDTO vo=new ReservationDTO();
					vo.setUserID(userID1);
					vo.setMovieName(movieName);
					vo.setMovieTheater(movieTheater);
					vo.setDay_re(day_re);
					vo.setTime_re(time_re);
					relist.add(vo);
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e) {
				System.out.println("예약 목록 조회중 에러");
			}
			return relist;
		}
		
		
	
	private static void connDB() {
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


