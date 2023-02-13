package movie;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class MovieDAO {
	private static final String driver="oracle.jdbc.driver.OracleDriver";
	private static final String url="jdbc:oracle:thin:@localhost:1521:XE";
	private static final String user="productdb";
	private static final String pwd="pass1234";
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//��ȭ��� �޼���
		public List<MovieDTO> movieList() {
			List<MovieDTO> list=new ArrayList<MovieDTO>();
			try {
				connDB();
				String query="select * from MOVIE ORDER BY MOVIENUM";
				pstmt=con.prepareStatement(query);
				ResultSet rs=pstmt.executeQuery();
				while(rs.next()) {
					String userID=rs.getString("userID");
					String movieName=rs.getString("movieName");
					String movieState=rs.getString("movieState");
					String movieImage=rs.getString("movieImage");
					String ageImage=rs.getString("ageImage");
					Date movieDate=rs.getDate("movieDate");
					int movieNum=rs.getInt("movieNum");
					MovieDTO vo=new MovieDTO();
					vo.setUserID(userID);
					vo.setMovieName(movieName);
					vo.setMovieState(movieState);
					vo.setMovieImage(movieImage);
					vo.setAgeImage(ageImage);
					vo.setMovieDate(movieDate);
					vo.setMovieNum(movieNum);
					list.add(vo);
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e) {
				System.out.println("��ȭ ��� ��ȸ�� ����");
			}
			return list;
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
