<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>회원 가입</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.m_id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.m_password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.m_password.value != document.newMember.m_password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
		
	    if (!document.newMember.m_name.value) {
	        alert("성명을 입력하세요.");
	        return false;
	    }

	    if (!document.newMember.m_mail1.value) {
	        alert("이메일을 입력하세요.");
	        return false;
	    }
	}
</script>
<body>
	<div class="container py-4">
		<jsp:include page="menu.jsp" />

		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-3">
				<h1 class="display-5 fw-bold">회원 가입</h1>
				<p class="col-md-8 fs-4">Membership Joining</p>      
			</div>
		</div>
	

		<div class="row align-items-md-stretch text-center">
			<form name="newMember"  action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
				<div class="mb-3 row">
					<label class="col-sm-2 ">아이디</label>
					<div class="col-sm-3">
						<input name="m_id" type="text" class="form-control" placeholder="id" >
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input name="m_password" type="text" class="form-control" placeholder="password" >
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">비밀번호확인</label>
					<div class="col-sm-3">
						<input name="m_password_confirm" type="text" class="form-control" placeholder="password confirm" >
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="m_name" type="text" class="form-control" placeholder="name" >
					</div>
				</div>
			
				<div class="mb-3 row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<div class="row">
							<div class="col-sm-4">
								<input type="text" name="m_mail1" maxlength="50" class="form-control"  placeholder="email">
							</div> @
							<div class="col-sm-3">
								<select name="mail2" class="form-select">
									<option>naver.com</option>
									<option>daum.net</option>
									<option>gmail.com</option>
									<option>nate.com</option>
								</select>
							</div>
						</div>		
					</div>		
				</div>
				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10 ">
						<input type="submit" class="btn btn-primary " value="등록 " > 
						<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" >
					</div>
				</div>
			</form>
		</div>
	
		<jsp:include page="footer.jsp" />
	</div>	
</body>
</html>