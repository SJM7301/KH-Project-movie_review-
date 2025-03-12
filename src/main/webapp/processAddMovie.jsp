<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*, dto.Movie, dao.MovieRepository"%>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%@ include file="dbconn.jsp" %>

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
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "INSERT INTO review VALUES(?,?,?,?,?,?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, movieId);
	pstmt.setString(2, title);
	pstmt.setString(3, category);
	pstmt.setString(4, star);
	pstmt.setString(5, director);
	pstmt.setString(6, description);
	pstmt.setString(7, country);
	pstmt.setString(8, releaseDate);
	pstmt.setString(9, condition);
	pstmt.setString(10, fileName);
	
	int num = pstmt.executeUpdate();
	if(num == 1){
		out.println("정상 입력되었습니다.");
	}else
		out.println("입력이 실패하였습니다.");
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("main.jsp");
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