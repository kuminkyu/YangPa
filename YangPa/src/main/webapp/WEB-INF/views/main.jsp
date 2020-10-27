<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
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

<style type="text/css">
.wrap {
	width: 900px;
	margin: 10px auto;
}

* {
	font-family: 'Nanum Pen Script', cursive;
}

#div-1>h5 {
	color: lightskyblue;
}

#div-1>h4 {
	color: blue;
}

.carousel-inner img {
	width: 100%;
	height: 100%;
}
</style>

<body>
	<%@ include file="./header.jsp"%>

	<div class="container">
		<div id="demo" class="carousel slide float-center"
			data-ride="carousel">

			<!-- Indicators -->
			<ul class="carousel-indicators float-center">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>

			<!-- The slideshow -->
			<div class="carousel-inner" style="width: 1100px; height: 500px">
				<div class="carousel-item active">
					<img src="${root}/resources/img/main/yangpa.png" width="1100px"
						height="500">
				</div>
				<div class="carousel-item">
					<img src="${root}/resources/img/main/yangpa.png" width="1100px"
						height="500">
				</div>
				<div class="carousel-item">
					<img src="${root}/resources/img/main/yangpa.png" width="1100px"
						height="500">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="carousel-control-prev" href="#demo" data-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</a> <a class="carousel-control-next" href="#demo" data-slide="next">
				<span class="carousel-control-next-icon"></span>
			</a>
		</div>
	</div>
	<br>
	<!--     중간 링크 아이콘 넣을곳 -->

	<div class="container">
		<a href="#"> <img class="ml-5 mr-5" alt="W3Schools"
			src="${root}/resources/img/main/wo.png" width="160" height="160">
		</a> <a href="#"> <img class="ml-5 mr-5" alt="W3Schools"
			src="${root}/resources/img/main/tr.png" width="160" height="160">
		</a> <a href="#"> <img class="ml-5 mr-5" alt="W3Schools"
			src="${root}/resources/img/main/tk.png" width="160" height="160">
		</a> <a href="#"> <img class="ml-5 mr-5" alt="W3Schools"
			src="${root}/resources/img/main/rest.png" width="160" height="160">
		</a>
	</div>

	<br>
	<div class="row">
		<div class="wrap col-lg-2 mb-5">
			<h3 class="mb-2 text-center">분류</h3>
			<div class="list-group">
				<b><h3>
						<a href="#" class="list-group-item text-dark tablesearch"><i
							class="fas fa-seedling mr-2"></i>전체</a></b> <b><a href="#"
					class="list-group-item text-dark tablesearch"><i
						class="fas fa-dumbbell mr-2"></i>운동</a></b> <b><a href="#"
					class="list-group-item text-dark tablesearch"><i
						class="fas fa-umbrella-beach mr-2"></i>여행</a></b> <b><a href="#"
					class="list-group-item text-dark tablesearch"><i
						class="fas fa-ticket-alt mr-2"></i>티켓</a></b> <b><a href="#"
					class="list-group-item text-dark tablesearch"><i
						class="fas fa-plus mr-2"></i>기타</a>
					</h3></b>
			</div>
		</div>

		<div class="wrap col-lg-10">
			<div class="card-columns">
				<div class="card" style="width: 400px">
					<img class="card-img-top"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card" style="width: 400px">
					<img class="card-img-top"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card" style="width: 400px">
					<img class="card-img-top"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card" style="width: 400px">
					<img class="card-img-top"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card" style="width: 400px">
					<img class="card-img-top"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>

				<div class="card" style="width: 400px">
					<img class="card-img-top"
						src="https://www.eurail.com/content/dam/images/eurail/Italy%20OCP%20Promo%20Block.adaptive.767.1535627244182.jpg"
						alt="Card image cap">
					<div class="card-body" id="div-1">
						<h5 class="card-title">
							<a>여기에 기사 제목이 들어가죠</a>
						</h5>
						<p class="card-text">This is a longer card with supporting
							text below as a natural lead-in to additional content. This
							content is a little bit longer.</p>
						<h4>
							<a>여기에 코멘트가 들어갑니다.</a>
						</h4>
					</div>
				</div>


			</div>
		</div>
	</div>
	<%@ include file="./footer.jsp"%>
</body>
</html>
