<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>

	<div class="container py-4">
		<jsp:include page="/menu.jsp" />

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
      			<%
					String msg = request.getParameter("msg");
      				if (msg != null) {
      					if (msg.equals("0")||msg.equals("2")){
      			%>
        		<h1 class="display-5 fw-bold">회원 정보</h1>
        		<p class="col-md-8 fs-4">Membership Info</p>    
        		<%
        				} else if (msg.equals("1")){
        		%>
         		<h1 class="display-5 fw-bold">회원 가입</h1>
        		<p class="col-md-8 fs-4">Membership Joining</p>    
         		<% 
         				} else if (msg.equals("3")){
         		%>
         		<h1 class="display-5 fw-bold">아이디 찾기</h1>
        		<p class="col-md-8 fs-4">Find Member ID</p>
        		<% 
         				} else if (msg.equals("4")){
         		%>
         		<h1 class="display-5 fw-bold">비밀번호 찾기</h1>
        		<p class="col-md-8 fs-4">Find Member PW</p>
         		<%
         				}
      				}
         		%>
			</div>
		</div>
		
		
		<div class="row align-items-md-stretch   text-center">
			<%
            	if (msg != null) {
					if (msg.equals("0")) {
						out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
                	} else if (msg.equals("1")) {
                  		out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
                	} else if (msg.equals("2")) {
                   		String loginId = (String) session.getAttribute("sessionId");
                   		String isAdmin = (String) session.getAttribute("is_admin");
                   		out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다.</h2>\n");
                	} else if (msg.equals("3")) {
                		String findID = (String) session.getAttribute("sessionFindId");
                		out.println(" <h2 class='alert alert-danger'>찾으시는 아이디는\" " + findID + " \"입니다.</h2>");
                	} else if (msg.equals("4")) {
                		String findPW = (String) session.getAttribute("sessionFindPw");
                		out.println(" <h2 class='alert alert-danger'>찾으시는 비밀번호는\" " + findPW + " \"입니다.</h2>");
                	}
             	} else {
                	out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
             	}
			%>
		</div>
	</div>	
</body>
</html>