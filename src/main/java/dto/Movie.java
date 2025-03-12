package dto;

import java.io.*;

public class Movie implements Serializable {

	public static final long serialVersionUID = -4274700572038677000L;

	private String movieId; // 영화 ID
	private String title; // 영화 제목
	private String category; // 장르(액션, 로멘스, sf등)
	private String star; // 평점 (1~5)
	private String director; // 감독
	private String description; // 설명
	private String country; // 나라(국내, 해외)
	private String releaseDate; // 개봉일(월/년)
	private String condition; // 상영 플랫폼(OTT, 영화관)
	private String filename; // 이미지 파일명

	
	public Movie() {
		super();
	}

	public Movie(String movieId, String title, String star) {
		this.movieId = movieId;
		this.title = title;
		this.star = star;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}
	
	public String getCountry() {
		return country;
	}
	
	public void setCountry(String country) {
		this.country = country;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
}