<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.BoardDTO"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<html>
<head>
<title>Q&A 게시판</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>
</head>
<body style="padding-right: 15px;">
	<div class="container py-4">
		<jsp:include page="../menu.jsp" />
		
		<div class="row align-items-md-stretch   text-center">	 	
			<form action="<c:url value="./BoardListAction.do"/>" method="post">
					<div class="text-end"> 
						<span class="badge text-bg-success">전체 <%=total_record%>건	</span>
					</div>
			
				<div style="padding-top: 20px">
					<table class="table table-hover text-center">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
							<th>글쓴이</th>
						</tr>
						<%
						
							for (int j = 0; j < boardList.size() ; j++){
								
								BoardDTO notice = (BoardDTO) boardList.get(j);
						%>
						<tr>
							<td><%=notice.getQnaNum()%></td>
							<td><a href="./BoardViewAction.do?num=<%=notice.getQnaNum()%>&pageNum=<%=pageNum%>"><%=notice.getQnaTitle()%></a></td>
							<td><%=notice.getQnaRegist_day()%></td>
							<td><%=notice.getQnaHit()%></td>
							<td><%=notice.getQnaName()%></td>
						</tr>
						<%
							}
						%>
					</table>
				</div>
				<div align="center">
					<c:set var="pageNum" value="<%=pageNum%>" />
					<c:forEach var="i" begin="1" end="<%=total_page%>">
						<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'><b> [${i}]</b></font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'> [${i}]</font>
								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>
				</div>
					
				<div class="py-3" align="right">							
					<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>				
				</div>			
				<div align="left">				
					<select name="items" class="txt">
						<option value="qna_title">제목에서</option>
						<option value="qna_content">본문에서</option>
						<option value="qna_name">글쓴이에서</option>
					</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary " value="검색 " />				
				</div>
			</form>			
		</div>
		<jsp:include page="../footer.jsp" />
	</div>
</body>
</html>