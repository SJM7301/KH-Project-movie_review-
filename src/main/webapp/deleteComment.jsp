<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
    String cId = request.getParameter("c_id"); // 댓글 ID
    String movieId = request.getParameter("r_id"); // 리뷰 ID

    // 댓글 삭제 쿼리
    String sql = "DELETE FROM comment WHERE c_id = ?";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setInt(1, Integer.parseInt(cId));
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    response.sendRedirect("detail.jsp?id=" + movieId); // 삭제 후 상세페이지로 리디렉션
%>