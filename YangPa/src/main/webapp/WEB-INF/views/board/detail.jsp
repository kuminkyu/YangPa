<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/6a4e36a028.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container-fluid">


		<div class="container p-1 my-1 border">
			<div class="row">

				<div class="col float-right">
					<h2>
						<span class="badge badge-pill badge-success">#STATE연결# 판매중</span>
					</h2>
				</div>
				<div class="col-sm-1">
					<h1>
						<i style="color: #007bff; size: 15px" class="fas fa-shopping-cart"></i>
					</h1>
				</div>
			</div>

		</div>

		<div style="text-align: center;" class="container p-3 my-3 border">
			<h1>#title연결# 마포구 몸짱헬스장 양도합니다</h1>

		</div>

		<div class="container p-1 my-1 border">
			<div class="row">

				<div class="col text-left">
					<h5>
						판매등록일 :
						<text>#write_date연결#</text>
						</span>
					</h5>
				</div>
				<div class="col text-right">
					<h5>
						조회수 :
						<text>#view_cnt연결#</text>
						</span>
					</h5>
				</div>
			</div>
		</div>

		<br>

		<div class="row">

			<div class="col-lg-8 mt-2 mb-2 border">

				<div>
					<h1>#Img추가</h1>
					<img class="card-img-top"
						src="https://www.ancient-origins.net/sites/default/files/field/image/Agesilaus-II-cover.jpg">
					
				</div>

				<div>
					<h1>#Contents추가</h1>
					<h1>#Contents추가</h1>
					<h1>#Contents추가</h1>
					<h1>#Contents추가</h1>
					<h1>#Contents추가</h1>
					<h1>#Contents추가</h1>
					
				</div>


			</div>

			<div class="col-lg-4 mt-2 mb-2 border">
				<table class="table table-hover mt-4">
					<colgroup>
						<col width="5%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">남은횟수</th>
							<th class="text-right">#write_date</th>
						</tr>
					</thead>

					<thead>
						<tr>
							<th class="text-center">판매금액</th>
							<th class="text-right">#price</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<table class="table table-hover mt-4">
					<colgroup>
						<col width="5%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-center">작성자</th>
							<th class="text-right">#write_date</th>
						</tr>
					</thead>
				</table>


				<td>
					<button class="btn btn-primary center">판매자 연락처 확인</button>
				</td>

				<table class="table table-hover mt-4">
					<colgroup>
						<col width="5%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-left mt-3"><p>#api 주소 가게이름</p>
								<p>#api 주소</p></th>
						</tr>

					</thead>
				</table>

				<div class = "border">#api를 활용한 지도이미지 추가</div>

			</div>

		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>

