package theater;

import java.sql.Date;

public class TheaterDTO {
	private String userID;
	private String movieName;
	private String movieTheater;
	private String time_re;
	private String day_re;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getMovieTheater() {
		return movieTheater;
	}
	public void setMovieTheater(String movieTheater) {
		this.movieTheater = movieTheater;
	}
	public String getTime_re() {
		return time_re;
	}
	public void setTime_re(String time_re) {
		this.time_re = time_re;
	}
	public String getDay_re() {
		return day_re;
	}
	public void setDay_re(String day_re) {
		this.day_re = day_re;
	}
	public TheaterDTO() {
		
	}
	public TheaterDTO(String userID, String movieName, String movieTheater, String time_re, String day_re) {
		super();
		this.userID = userID;
		this.movieName = movieName;
		this.movieTheater = movieTheater;
		this.time_re = time_re;
		this.day_re = day_re;
	}
	

}
