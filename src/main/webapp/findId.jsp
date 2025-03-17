<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>아이디 찾기</title>
</head>
<body>

<div class="container py-4">
   <jsp:include page="/menu.jsp" />

 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 아이디 찾기</h1>
        <p class="col-md-8 fs-4">Find Member ID</p>
      </div>
    </div>

	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("이름과 이메일이 일치하는 아이디가 없습니다.");
					out.println("</div>");
				}
			%>
  			<form class="form-signin" action="processFindId.jsp" method="post">
  
    			<div class="form-floating mb-3 row">     
      				<input type="text" class="form-control" name='m_name' id="floatingInput" placeholder="Name" required autofocus>
      				<label for="floatingInput">NAME</label>      
    			</div>
    			
    			<div class="form-floating  mb-3 row">     
     	 			<input type="text" class="form-control" name='m_mail' placeholder="E-mail">
    				 <label for="floatingPassword">E-mail</label>
				</div>
   
				<button class="btn btn btn-lg btn-success btn-block" type="submit">아이디 찾기</button>
				<br>
				<br>
				<div class="links">
					<a href="findId.jsp">아이디 찾기</a> | <a href="findPw.jsp">비밀번호 찾기</a> | <a href="addMember.jsp">회원가입</a>
				</div>
  			</form>
		</div>
	</div>

	<jsp:include page="footer.jsp" />  
	</div>
</body>	
</html>