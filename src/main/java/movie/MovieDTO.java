package movie;

import java.sql.Date;

public class MovieDTO {
	private String userID;
	private String movieName;
	private String movieState;
	private String movieImage;
	private String ageImage;
	private Date movieDate;
	private int movieNum;
	
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
	public String getMovieState() {
		return movieState;
	}
	public void setMovieState(String movieState) {
		this.movieState = movieState;
	}
	public String getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}
	public String getAgeImage() {
		return ageImage;
	}
	public void setAgeImage(String ageImage) {
		this.ageImage = ageImage;
	}
	public Date getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}
	public int getMovieNum() {
		return movieNum;
	}
	public void setMovieNum(int movieNum) {
		this.movieNum = movieNum;
	}
	public MovieDTO() {
		
	}
	public MovieDTO(String userID, String movieName, String movieState, String movieImage, String ageImage,
			Date movieDate, int movieNum) {
		super();
		this.userID = userID;
		this.movieName = movieName;
		this.movieState = movieState;
		this.movieImage = movieImage;
		this.ageImage = ageImage;
		this.movieDate = movieDate;
		this.movieNum = movieNum;
	}
	
	
	
	
}
