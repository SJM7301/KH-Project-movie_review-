<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 수정</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
</head>

<script type="text/javascript">
	function deleteConfirm(id) {
		// 삭제 확인 후 삭제를 진행하거나 취소
		if(confirm("해당 리뷰를 삭제합니다!!") == true)
			location.href="./deleteMovie.jsp?id=" + id; // 삭제 페이지로 리다이렉트
		else
			return; // 취소하면 아무 일도 일어나지 않음
	}
</script>

<%
	String edit = request.getParameter("edit");
%>

<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="row align-items-md-stretch text-center">
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "SELECT * FROM review ORDER BY r_id DESC";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()){
			%>
		
			<div class="col-md-3">
				<div class="h-100 p-2">
					<img class="mainImages" src="./resources/images/<%=rs.getString("r_filename") %>"/>
					<h5><b><%=rs.getString("r_title") %></b></h5>
					<p><%=rs.getString("r_director") %>
					<br><%=rs.getString("r_country") %> | <%=rs.getString("r_releaseDate") %> | <%=rs.getString("r_star") %>점
					<p><%=rs.getString("r_description").substring(0, 50) %>..
					
					<p>
	            	<% if(edit.equals("update")){ %> <!-- edit 파라미터가 'update'일 경우 수정 버튼을 보여줌 -->
	            	<p><a href="./updateMovie.jsp?id=<%=rs.getString("r_id") %>" class="btn btn-success" role = "button"> 수정 &raquo;</a>
	            	<% } else if(edit.equals("delete")){ %> <!-- edit 파라미터가 'delete'일 경우 삭제 버튼을 보여줌 -->
	            	<a href="#" onclick="deleteConfirm('<%=rs.getString("r_id") %>')" class="btn btn-danger" role="button">삭제 &raquo;</a>
	            	<% } %>
				</div>
			</div>
		
			<%
				}
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>	
		</div>

		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>