<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://kit.fontawesome.com/6a4e36a028.js" crossorigin="anonymous"></script>

</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2">
		        <h3 class="mb-2">분류</h3>
		        <div class="list-group">
		          <b><a href="#" class="list-group-item text-dark"><i class="fas fa-dumbbell mr-2"></i>운동</a></b>
		          <b><a href="#" class="list-group-item text-dark"><i class="fas fa-umbrella-beach mr-2"></i>여행</a></b>
		          <b><a href="#" class="list-group-item text-dark"><i class="fas fa-ticket-alt mr-2"></i>티켓</a></b>
		          <b><a href="#" class="list-group-item text-dark"><i class="fas fa-plus mr-2"></i>기타</a></b>
		        </div>
			</div>
			<div class="col-lg-10 mt-2 mb-2">
				<div class="cotainer mt-2 mb-2">
					<button class="btn btn-primary float-right"><b>판매등록</b></button>
					<button class="btn btn-warning float-right mr-2"><b>내 판매 서비스로 이동</b></button>
					<h4 class="ml-5"><b><span style="color: green">양파</span>판매목록</b></h4>
				</div>
			
			<table class="table table-hover mt-4">
				<colgroup>
					<col width="10%">
					<col width="15%">
					<col width="30%">
					<col width="15%">
					<col width="10%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">상태</th>
						<th class="text-center">위치</th>
						<th class="text-center">제목</th>
						<th class="text-center">사용가능일/날짜</th>
						<th class="text-center">금액</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
			</table>
		</div>
			</div>
		</div>
</body>
</html>