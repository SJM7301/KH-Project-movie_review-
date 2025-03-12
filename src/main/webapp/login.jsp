<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="row align-items-md-stretch text-center">
			<div class="row justify-content-center align-items-center">
				<div class="h-100 p-5 col-md-6">
					<h3>Please sign in</h3> <!-- 로그인 요청 메시지 -->
					
					<%
						String error = request.getParameter("error");
						if(error != null){
							out.println("<div class='alert alert-danger'>");
							out.println("아이디와 비밀번호를 확인해주세요."); // 로그인 실패 시 안내 메시지
							out.println("</div>");
						}
					%>
					
					<!-- 로그인 폼 -->
					<form action="j_security_check" class="form-signin" method="post">
						<div class="form-floating mb-3 row">
							<input type="text" class="form-control" name='j_username' required autofocus> <!-- ID 입력 필드 -->
							<label for="floatingInput">ID</label> <!-- ID 라벨 -->
						</div>
						
						<div class="form-floating mb-3 row">
							<input type="password" class="form-control" name='j_password'> <!-- Password 입력 필드 -->
							<label for="floatingInput">Password</label> <!-- Password 라벨 -->
						</div>
						<!-- 로그인 버튼 -->
						<button class="btn btn-lg btn-success" type="submit">로그인</button>
					</form>
				</div>
			</div>
		</div>

		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>