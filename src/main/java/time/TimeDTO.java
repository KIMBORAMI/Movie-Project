package time;

import java.sql.Date;

public class TimeDTO {
	private String userID;
	private String movieName;
	private String movieTheater;
	private String day_re;
	private String time_re;
	
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
	public String getDay_re() {
		return day_re;
	}
	public void setDay_re(String day_re) {
		this.day_re = day_re;
	}
	public String getTime_re() {
		return time_re;
	}
	public void setTime_re(String time_re) {
		this.time_re = time_re;
	}
	public TimeDTO() {
		
	}
	public TimeDTO(String userID, String movieName, String movieTheater, String day_re, String time_re) {
		super();
		this.userID = userID;
		this.movieName = movieName;
		this.movieTheater = movieTheater;
		this.day_re = day_re;
		this.time_re = time_re;
	}
	
	
	
}
