package reservation;

import java.sql.Date;

public class ReservationDTO {
	private String userID;
	private String movieName;
	private String movieTheater;
	private String movieImage;
	private String day_re;
	private String time_re;
	private String seat;
	
	
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
	public String getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
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
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public ReservationDTO() {
		
	}
	public ReservationDTO(String userID, String movieName, String movieTheater, String day_re,
			String time_re) {
		super();
		this.userID = userID;
		this.movieName = movieName;
		this.movieTheater = movieTheater;
		this.day_re = day_re;
		this.time_re = time_re;
	}
	public ReservationDTO(String userID, String movieName, String movieTheater, String day_re, String time_re, String seat) {
		super();
		this.userID = userID;
		this.movieName = movieName;
		this.movieTheater = movieTheater;
		this.day_re = day_re;
		this.time_re = time_re;
		this.seat = seat;
	}
	
	
	
}
