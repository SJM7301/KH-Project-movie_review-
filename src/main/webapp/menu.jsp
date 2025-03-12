<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
    String sessionId = (String) session.getAttribute("sessionId");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header class="pb-3 mb-4 border-bottom">
		<div class="container">
			<div class="d-flex justify-content-between justrify-content-lg-start">
				<a href="./main.jsp" class="nav- link"><img alt="Logo_Image" src="./resources/images/logo.jpg" style="width:300" height="50"></a>
					
				<!-- 내비게이션 항목 -->
                <ul class="nav nav-pills">
                    <!-- 세션이 없을 경우 로그인 및 회원 가입 링크 표시 -->
                    <c:choose>
                        <c:when test="${empty sessionId}">
                            <li class="nav-item"><a class="nav-link" href="<c:url value='/loginMember.jsp' />">로그인</a></li>
                            <li class="nav-item"><a class="nav-link" href="<c:url value='/addMember.jsp' />">회원 가입</a></li>
                        </c:when>
                        
                        <c:otherwise>
                        <!-- 세션이 있을 경우 세션 사용자 정보 및 로그아웃, 회원 수정 링크 표시 -->
                            <li style="padding-top: 7px; color: black">[<%=sessionId %>님]</li> <!-- 세션 사용자 이름 표시 -->
                            <li class="nav-item"><a class="nav-link" href="<c:url value='/logoutMember.jsp' />">로그아웃</a></li>
                            <li class="nav-item"><a class="nav-link" href="<c:url value='/updateMember.jsp' />">회원 수정</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
			</div>
		</div>
		
		<hr>
		<nav>
			<!-- 관리자 관련 메뉴 -->
			<ul class="nav nav-pills">
				<c:choose>
					<c:when test="${sessionId eq 'admin' }">
						<li class="nav-item"><a href="<c:url value='/addMovie.jsp'/>" class="nav-link">영화 리뷰 등록</a></li>
						<li class="nav-item"><a href="<c:url value='/editMovie.jsp?edit=update'/>" class="nav-link">영화 리뷰 수정</a></li>
						<li class="nav-item"><a href="<c:url value='/editMovie.jsp?edit=delete'/>" class="nav-link">영화 리뷰 삭제</a></li>
						<li class="nav-item"><a href="<c:url value='/actionMovie.jsp'/>" class="nav-link">액션 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/sfMovie.jsp'/>" class="nav-link">SF 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/comedyMovie.jsp'/>" class="nav-link">코미디 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/romanceMovie.jsp'/>" class="nav-link">로맨스 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/etcMovie.jsp'/>" class="nav-link">기타 영화</a></li>
						<li class="nav-item"><a href="<c:url value="/BoardListAction.do?pageNum=1" />" class="nav-link">Q&A</a></li>
					</c:when>
					
					<c:otherwise>
						<li class="nav-item"><a href="<c:url value='/actionMovie.jsp'/>" class="nav-link">액션 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/sfMovie.jsp'/>" class="nav-link">SF 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/comedyMovie.jsp'/>" class="nav-link">코미디 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/romanceMovie.jsp'/>" class="nav-link">로맨스 영화</a></li>
						<li class="nav-item"><a href="<c:url value='/etcMovie.jsp'/>" class="nav-link">기타 영화</a></li>
						<li class="nav-item"><a href="<c:url value="/BoardListAction.do?pageNum=1" />" class="nav-link">Q&A</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</header>
</body>
</html>