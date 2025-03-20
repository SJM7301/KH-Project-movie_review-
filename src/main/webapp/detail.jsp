<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			// 영화 리뷰 정보 가져오기
			String movieId = request.getParameter("id");
		
			PreparedStatement pstmt1 = null;
			ResultSet rs1 = null;
			
			String sql1 = "SELECT * FROM review WHERE r_id=?";
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, movieId);
			rs1 = pstmt1.executeQuery();
		
			while(rs1.next()){
		%>
		
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs1.getString("r_filename") %>" style="width: 50%">
			</div>
			
			<div class="col-md-7">
				<h3><b><%=rs1.getString("r_title") %></b></h3>
				<p><b>장르</b>: <%=rs1.getString("r_category") %> | <b>평점</b>: <%=rs1.getString("r_star") %>점</p>
				<p><b>감독</b>: <%=rs1.getString("r_director") %> | <b>나라</b>: <%=rs1.getString("r_country") %></p>
				<p><b>개봉일</b>: <%=rs1.getString("r_releaseDate") %> | <b>상영 플랫폼</b>: <%=rs1.getString("r_condition") %></p>
				<p><b>리뷰</b><br><%=rs1.getString("r_description") %></p>
			</div>
		</div>
		<%
			} 
			if (rs1 != null) rs1.close();
			if (pstmt1 != null) pstmt1.close();
		%>

		<!-- 댓글 작성 폼 -->
		<h3>댓글 작성</h3>
		<form action="addComment.jsp" method="POST">
		    <div class="form-group">
		        <label for="commentContent">내용</label>
		        <textarea class="form-control" id="commentContent" name="commentContent" rows="4" required></textarea>
		    </div>
		    <input type="hidden" name="r_id" value="<%= movieId %>">
		    <button type="submit" class="btn btn-primary">전송</button>
		</form>
		
		<!-- 댓글 섹션 -->
		<h3>댓글</h3>
		<div class="comment-section" style="max-height: 400px; overflow-y: auto;">
		    <%
		        // 댓글 목록 가져오기
		        PreparedStatement pstmt2 = null;
		        ResultSet rs2 = null;
		        String sql2 = "SELECT * FROM comment WHERE r_id = ? ORDER BY created_at DESC";
		        pstmt2 = conn.prepareStatement(sql2);
		        pstmt2.setString(1, movieId);
		        rs2 = pstmt2.executeQuery();
		
		        // 댓글 출력
		        while (rs2.next()) {
		    %>
		    <div class="comment">
		        <p><b><%= rs2.getString("m_id") %></b> (작성일: <%= rs2.getString("created_at") %>)</p>
		        <p><%= rs2.getString("content") %></p>
		        <%
		            // 현재 세션 아이디와 댓글 작성자가 같은 경우만 삭제 버튼을 표시
		            if (sessionId != null && sessionId.equals(rs2.getString("m_id")) || sessionId.equals("admin")) {
		        %>
		        <form action="deleteComment.jsp" method="POST">
		            <input type="hidden" name="c_id" value="<%= rs2.getInt("c_id") %>">
		            <input type="hidden" name="r_id" value="<%= rs2.getString("r_id") %>">
		            <button type="submit">삭제</button>
		        </form>
		        <%
		            }
		        %>
		    </div>
		    <hr/>
		    <%
		        }
		        if (rs2 != null) rs2.close();
		        if (pstmt2 != null) pstmt2.close();
		    %>
		</div>

		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
