<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*, dto.*, dao.*"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"%>
<%@ include file="dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String realFolder = "C:\\eclipse\\web_project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Movie_review\\resources\\images";
	int maxSize = 5 * 1024 * 1024; // 최대 업로드될 파일의 크기 5MB
	String encType = "UTF-8"; //인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String movieId = multi.getParameter("movieId");
	String title = multi.getParameter("title");
	String category = multi.getParameter("category");
	String star = multi.getParameter("star");
	String director = multi.getParameter("director");
	String description = multi.getParameter("description");
	String country = multi.getParameter("country");
	String releaseDate = multi.getParameter("releaseDate");
	String condition = multi.getParameter("condition");
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM review WHERE r_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, movieId);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (fileName != null) {
			sql = "UPDATE review SET r_title=?, r_category=?, r_star=?, r_director=?, r_description=?, r_country=?, r_releaseDate=?, r_condition=?, r_filename=? WHERE r_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, category);
			pstmt.setString(3, star);
			pstmt.setString(4, director);
			pstmt.setString(5, description);
			pstmt.setString(6, country);
			pstmt.setString(7, releaseDate);
			pstmt.setString(8, condition);
			pstmt.setString(9, fileName);
			pstmt.setString(10, movieId);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE review SET r_title=?, r_category=?, r_star=?, r_director=?, r_description=?, r_country=?, r_releaseDate=?, r_condition=? WHERE r_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, category);
			pstmt.setString(3, star);
			pstmt.setString(4, director);
			pstmt.setString(5, description);
			pstmt.setString(6, country);
			pstmt.setString(7, releaseDate);
			pstmt.setString(8, condition);
			pstmt.setString(9, movieId);
			pstmt.executeUpdate();
		}
	}
	
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editMovie.jsp?edit=update");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>