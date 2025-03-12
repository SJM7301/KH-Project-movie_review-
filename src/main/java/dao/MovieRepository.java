package dao;

import java.util.ArrayList;

import dto.Movie;

public class MovieRepository {

	private ArrayList<Movie> listOfMovies = new ArrayList<Movie>();
	private static MovieRepository instance = new MovieRepository();
	
	public static MovieRepository getInstance() {
		return instance;
	}
/*	
	public MovieRepository() {
		Movie movie1 = new Movie("SF1", "마션", "4");
		movie1.setDirector("우재남");
		movie1.setDescription(
				"C#을 처음 접하는 독자를 대상으로 일대일 수업처럼 자세히 설명한 책이다. 꼭 알아야 할 핵심 개념은 기본 예제로 최대한 쉽게 설명했으며, 중요한 내용은 응용 예제, 퀴즈, 셀프 스터디, 예제 모음으로 한번 더 복습할 수 있다.");
		movie1.setCountry("해외");
		movie1.setCategory("SF");
		movie1.setReleaseDate("2022/10/06");
		movie1.setCondition("영화관");
		movie1.setFilename("SF1.jpg");

		Movie movie2 = new Movie("Action1", "존윅1", "5");
		movie2.setDirector("우재남");
		movie2.setDescription(
				"C#을 처음 접하는 독자를 대상으로 일대일 수업처럼 자세히 설명한 책이다. 꼭 알아야 할 핵심 개념은 기본 예제로 최대한 쉽게 설명했으며, 중요한 내용은 응용 예제, 퀴즈, 셀프 스터디, 예제 모음으로 한번 더 복습할 수 있다.");
		movie2.setCountry("해외");
		movie2.setCategory("액션");
		movie2.setReleaseDate("2022/10/06");
		movie2.setCondition("영화관");
		movie2.setFilename("Action1.jpg");

		Movie movie3 = new Movie("Action2", "존윅2", "5");
		movie3.setDirector("우재남");
		movie3.setDescription(
				"C#을 처음 접하는 독자를 대상으로 일대일 수업처럼 자세히 설명한 책이다. 꼭 알아야 할 핵심 개념은 기본 예제로 최대한 쉽게 설명했으며, 중요한 내용은 응용 예제, 퀴즈, 셀프 스터디, 예제 모음으로 한번 더 복습할 수 있다.");
		movie3.setCountry("해외");
		movie3.setCategory("액션");
		movie3.setReleaseDate("2022/10/06");
		movie3.setCondition("영화관");
		movie3.setFilename("Action2.jpg");
		
		Movie movie4 = new Movie("Action3", "존윅3", "5");
		movie4.setDirector("우재남");
		movie4.setDescription(
				"C#을 처음 접하는 독자를 대상으로 일대일 수업처럼 자세히 설명한 책이다. 꼭 알아야 할 핵심 개념은 기본 예제로 최대한 쉽게 설명했으며, 중요한 내용은 응용 예제, 퀴즈, 셀프 스터디, 예제 모음으로 한번 더 복습할 수 있다.");
		movie4.setCountry("해외");
		movie4.setCategory("액션");
		movie4.setReleaseDate("2022/10/06");
		movie4.setCondition("영화관");
		movie4.setFilename("Action3.jpg");
		
		listOfMovies.add(movie1);
		listOfMovies.add(movie2);
		listOfMovies.add(movie3);
		listOfMovies.add(movie4);
	}
*/
	public ArrayList<Movie> getAllMovies() {
		return listOfMovies;
	}

	public Movie getMoiveById(String movieId) {
		Movie movieById = null;

		for (int i = 0; i < listOfMovies.size(); i++) {
			Movie movie = listOfMovies.get(i);

			if (movie != null && movie.getMovieId() != null && movie.getMovieId().equals(movieId)) {
				movieById = movie;
				break;
			}
		}
		return movieById;
	}
	
	public void addMovie(Movie movie) {
		listOfMovies.add(movie);
	}
}