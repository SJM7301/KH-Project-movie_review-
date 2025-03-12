<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, dto.Movie, dao.MovieRepository" %>
<%@ page errorPage="exceptionNoMovieId.jsp" %>
<%@ include file="dbconn.jsp" %>
<jsp:useBean id="movieDAO" class="dao.MovieRepository" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 상세화면</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<%
			String movieId = request.getParameter("id");
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM review WHERE r_id=?";
			
			// SQL 쿼리 실행 준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieId);
			rs = pstmt.executeQuery(); // 쿼리 실행
			
			// 쿼리 결과에서 첫 번째 레코드 가져오기
			while(rs.next()){
		%>
		
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<!-- 도서 이미지를 출력, 파일 이름을 DB에서 가져옴 -->
				<img src="./resources/images/<%=rs.getString("r_filename") %>" style="width: 50%">
			</div>
			
			<div class="col-md-7">
				
				<h3><b><%=rs.getString("r_title") %></b></h3>
				<p><b>장르</b>: <%=rs.getString("r_category") %> | <b>평점</b>: <%=rs.getString("r_star") %>점
				<p><b>감독</b>: <%=rs.getString("r_director") %> | <b>나라</b>: <%=rs.getString("r_country") %>
				<p><b>개봉일</b>: <%=rs.getString("r_releaseDate") %> | <b>상영 플랫폼</b>: <%=rs.getString("r_condition") %>
				<p><b>리뷰</b><br><%=rs.getString("r_description") %></p>
			</div>
		</div>
		<%
			} 
			// 리소스 정리
			if (rs != null)
				rs.close(); // ResultSet 닫기
			if (pstmt != null)
				pstmt.close(); // PreparedStatement 닫기
			if (conn != null)
				conn.close(); // DB 연결 닫기
		%>
		
		<p>댓글기능
		<br>
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>