<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰 등록</title>
<link href="./resources/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
	<div class="container py-4">
		<%@ include file="menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="row align-items-md-stretch">
				<form name="newMovieReview" action="./processAddMovie.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="mb-3 row">
						<label class="col-sm-2"><b>영화 코드</b></label>
						<div class="clo-sm-3">
							<input type="text" id="movieId" name="movieId" class="form-control" placeholder="장르에 상관없이 번호를 순서대로 적어주세요.">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>영화 제목</b></label>
						<div class="clo-sm-3">
							<input type="text" id="title" name="title" class="form-control">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>장르</b></label>
						<div class="clo-sm-3">
							<select name="category" class="form-control">
								<option value="Action">액션</option>
								<option value="SF">SF</option>
								<option value="Comedy">코미디</option>
								<option value="Romance">로맨스</option>
								<option value="etc">etc(기타)</option>
							</select>
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>평점</b></label>
						<div class="clo-sm-3">
							<select id="star" name="star" class="form-control">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
							</select>
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>감독</b></label>
						<div class="clo-sm-3">
							<input type="text" name="director" class="form-control" placeholder="해외 감독은 영어로 적어주세요.">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>영화 리뷰</b></label>
						<div class="clo-sm-5">
							<textarea name="description" rows="5" cols="120"></textarea>
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>나라</b></label>
						<div class="clo-sm-3">
							<input type="radio" name="country" value="국내"> 국내
							<input type="radio" name="country" value="해외"> 해외
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>개봉일</b></label>
						<div class="clo-sm-3">
							<input type="text" name="releaseDate" class="form-control" placeholder="YYYY/MM/DD">
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>상영 플랫폼</b></label>
						<div class="clo-sm-3">
							<input type="radio" name="condition" value="OTT"> OTT
							<input type="radio" name="condition" value="Movie"> 영화관
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><b>이미지 파일명</b></label>
						<div class="clo-sm-5">
							<input type="file" name="filename" class="form-control">
						</div>
					</div>
					
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>