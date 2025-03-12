<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화아이디 오류</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %> <!-- 메뉴 파일 포함 -->
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="alert alert-danger">해당 영화리뷰가 존재하지 않습니다.</h1>
			</div>
		</div>
		
		<div class="row align-items-md-stretch">
			<div class="col-md-12">
				<div class="h-100 p-5">
					<!-- 요청된 URL과 쿼리스트링을 보여주어 사용자에게 요청 정보를 확인시킴 -->
					<p> <%=request.getRequestURL() %>?<%=request.getQueryString() %>
				</div>
			</div>
		</div>
		
		<%@ include file="footer.jsp" %> <!-- 푸터 파일 포함 -->
	</div>
</body>
</html>