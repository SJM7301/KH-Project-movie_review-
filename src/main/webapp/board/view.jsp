<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../dbconn.jsp" %>
<%@ page import="dto.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<body>

<div class="container py-4">
	<jsp:include page="../menu.jsp" />
	
	 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">게시판</h1>
        <p class="col-md-8 fs-4">Board</p>      
      </div>
    </div>
	<div class="row align-items-md-stretch text-center">	 
		<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getQnaNum()%>&pageNum=<%=nowpage%>"  method="post">
				<div class="mb-3 row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control"	value=" <%=notice.getQnaName()%>" readonly>
				</div>
			</div>
				<div class="mb-3 row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="title" class="form-control" value=" <%=notice.getQnaTitle()%>" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5"> <%=notice.getQnaContent()%></textarea>
				</div>
			</div>
			
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<c:set var="userId" value="<%=notice.getQnaId()%>" />
					<c:if test="${sessionId==userId}">
						<p>
							<a	href="./BoardDeleteAction.do?num=<%=notice.getQnaNum()%>&pageNum=<%=nowpage%>"	class="btn btn-danger"> 삭제</a> 
							<input type="submit" class="btn btn-success" value="수정 ">
						</p>
					</c:if>
				</div>
			</div>
		</form>
	</div>
	
	<!-- 댓글 목록 -->
	<h3>답변</h3>
	<div class="comment-section" style="max-height: 400px; overflow-y: auto;">
	    <%
	        PreparedStatement pstmt2 = null;
	        ResultSet rs2 = null;
	        String sql2 = "SELECT * FROM qna_comment WHERE r_id = ? ORDER BY created_at DESC";
	        pstmt2 = conn.prepareStatement(sql2);
	        pstmt2.setInt(1, num); // 게시글 번호 사용
	        rs2 = pstmt2.executeQuery();
	
	        while (rs2.next()) {
	    %>
	    <div class="comment">
	        <p><b><%= rs2.getString("m_id") %></b> (작성일: <%= rs2.getString("created_at") %>)</p>
	        <p><%= rs2.getString("content") %></p>
	        <%
	        	
	            // 현재 세션 아이디와 댓글 작성자가 같은 경우만 삭제 버튼을 표시
	            if (sessionId != null && sessionId.equals(rs2.getString("m_id"))) {
	        %>
	        <form action="./BoardCommentDeleteAction.do" method="POST">
	            <input type="hidden" name="c_id" value="<%= rs2.getInt("c_id") %>">
	            <input type="hidden" name="r_id" value="<%= rs2.getInt("r_id") %>">
	            <input type="hidden" name="m_id" value="<%= rs2.getString("m_id") %>">
	            <input type="hidden" name="content" value="<%= rs2.getString("content") %>">
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
	
	<!-- 댓글 작성 폼 -->
	<c:choose>
		<c:when test="${sessionId eq 'admin' }">
			<h3>댓글 작성</h3>
			<form name="qnaComment" action="./BoardCommentWriteAction.do" method="post" onsubmit="return checkForm()">
			    <div class="form-group">
			        <label for="commentContent">답변</label>
			        <input name="m_id" type="" class="form-control" value="<%=sessionId %>" readonly>
			        <textarea class="form-control" id="commentContent" name="content" rows="4" required></textarea>
			    </div>
			    <input type="hidden" name="r_id" value="<%= notice.getQnaNum() %>">
			    <button type="submit" class="btn btn-primary">전송</button>
			</form>
		</c:when>
		
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	
	<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>