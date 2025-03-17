<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, dto.Movie, dao.MovieRepository" %>
<%@ include file="dbconn.jsp" %>

<%
    String movieId = request.getParameter("r_id"); // 리뷰 ID
    String commentContent = request.getParameter("commentContent"); // 댓글 내용
    String sessionId = (String) session.getAttribute("sessionId"); // 세션 ID (사용자 ID)

    if (sessionId != null && commentContent != null) {
        // 댓글 추가 쿼리
        String sql = "INSERT INTO comment (r_id, m_id, content) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, movieId);
            pstmt.setString(2, sessionId);  // 세션 ID
            pstmt.setString(3, commentContent);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    response.sendRedirect("detail.jsp?id=" + movieId); // 댓글 작성 후 상세페이지로 리디렉션
%>