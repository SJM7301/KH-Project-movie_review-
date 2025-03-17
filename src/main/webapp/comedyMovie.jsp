<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, dto.Movie, dao.MovieRepository" %>
<%@ include file="dbconn.jsp" %>
<jsp:useBean id="movieDAO" class="dao.MovieRepository" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코미디영화 리뷰 메인화면</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<link href="./resources/css/style.css" rel="stylesheet" />
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<!-- 이미지 슬라이드 -->
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		    <div class="container-fluid py-3">
		        <div class="row">
		            <!-- 왼쪽 텍스트 부분 -->
		            <div class="col-md-8">
		                <h1 class="display-5 fw-bold">코미디 영화 리뷰 목록</h1>
		                <p class="col-md-8 fs-4">Comedy Movie_Review List</p>
		            </div>
		    	</div>
			</div>
		</div>
		
		<%-- 영화 목록 가져오기 --%>
		<div class="row align-items-md-stretch text-center">
			<%
				PreparedStatement pstmt2 = null;
				ResultSet rs2 = null;
				String sql2 = "SELECT * FROM review WHERE r_category = 'Comedy' ORDER BY r_id DESC";
				pstmt2 = conn.prepareStatement(sql2);
				rs2 = pstmt2.executeQuery();
				while (rs2.next()){
			%>
		
			<div class="col-md-3">
				<div class="h-100 p-2">
					<img class="mainImages" src="./resources/images/<%=rs2.getString("r_filename") %>"/>
					<h5><b><%=rs2.getString("r_title") %></b></h5>
					<p><%=rs2.getString("r_director") %>
					<br><%=rs2.getString("r_country") %> | <%=rs2.getString("r_releaseDate") %> | <%=rs2.getString("r_star") %>점
					<p><%=rs2.getString("r_description").substring(0, 50) %>..
					<p><a href="./detail.jsp?id=<%=rs2.getString("r_id") %>" class="btn btn-secondary" role="button"> 리뷰 보기 &raquo;</a>
				</div>
			</div>
		
			<%
				}
				if(rs2 != null)
					rs2.close();
				if(pstmt2 != null)
					pstmt2.close();
				if(conn != null)
					conn.close();
			%>	

		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>