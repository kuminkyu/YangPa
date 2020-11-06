<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
$(document).ready(function() {
	
	//판매자 번호 뜨게하기 // 
	$("#tel_check").click(function() {
		$.get(
			"${root}/boardRest/getTel"
			,{ id : $("#detail_writer").text() }
			,function(data , status){
				if(status == "success"){
					$("#telarea").empty();
					$("#telarea").append(
						"<b>" + data + "</b>"	
					);
				}else{
					alert("번호 로딩중 에러!!");
					return;
				}
			}
		);
	});
});//ready

</script>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container-fluid">


		<div class="container p-1 my-1 border">
			<div class="row">

				<div class="col float-right">
				<c:choose>
					<c:when test="${detail_dto.state == '0'}">
						<h2>
							<span class="badge badge-pill badge-success">판매중</span>
						</h2>
					</c:when>
					<c:when test="${detail_dto.state == '2'}">
						<h2>
							<span class="badge badge-pill badge-danger">마감임박!!!</span>
						</h2>
					</c:when>
					<c:when test="${detail_dto.state == '3'}">
						<h2>
							<span class="badge badge-pill badge-dark">마감</span>
						</h2>
					</c:when>
					<c:otherwise>
						<h2>
							<span class="badge badge-pill badge-light">판매완료</span>
						</h2>
					</c:otherwise>
				</c:choose>
				</div>
				<div class="col-sm-1">
					<h1>
						<i style="color: #007bff; size: 15px" class="fas fa-shopping-cart"></i>
					</h1>
				</div>
			</div>

		</div>

		<div style="text-align: center;" class="container p-3 my-3 border">
			<h1>${detail_dto.title}</h1>
		</div>

		<div class="container p-1 my-1 border">
			<div class="row">

				<div class="col text-left">
					<h5 class="ml-2 mt-1">
						판매등록일 :
						<text>${detail_dto.write_date}</text>
					</h5>
				</div>
				<div class="col text-right">
					<h5 class="mr-2 mt-1">
						조회수 :
						<text>${detail_dto.view_cnt}</text>
					</h5>
				</div>
			</div>
		</div>

		<br>

		<div class="row">

			<div class="col-lg-8 mt-2 mb-2 border">

				<div>
					${detail_dto.contents}
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
							<th class="text-center">남은횟수/사용날짜</th>
							<c:choose>
								<c:when test="${detail_dto.buy_type == '1'}">
									<th class="text-right">${detail_dto.useday} 회</th>
								</c:when>
								<c:otherwise>
									<th class="text-right">${detail_dto.useday} 일</th>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>

					<thead>
						<tr>
							<th class="text-center">판매금액</th>
							<th class="text-right">${detail_dto.price} 원</th>
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
							<th class="text-right" id="detail_writer"><b>${detail_dto.writer}</b></th>
						</tr>
					</thead>
				</table>


				<button class="btn btn-primary center" id="tel_check">판매자 연락처 확인</button>
				<p id="telarea" class="float-right"></p>

				<table class="table table-hover mt-4">
					<colgroup>
						<col width="5%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th class="text-left mt-3"><p>${detail_dto.addrname}</p>
								<h3>${detail_dto.addrdetail}</h3></th>
						</tr>

					</thead>
				</table>

				<div class = "border">
				<input type="text" id="addrgps" value="${detail_dto.addrgps}" style="display: none">
				<div id="map" style="width:100%;height:350px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e42e5969ccb79f90d06c6f07a63f1d9&libraries=services"></script>
				<script>
				var gps = $("#addrgps").val();
				
				var gpsX = parseFloat(gps);
				var gpsY = parseFloat(gps.substr(gps.indexOf(",") + 1));
				
				var gps = $("#addrgps").val();
				

				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(gpsX,gpsY), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				// 마커가 표시될 위치입니다 
				var markerPosition  = new kakao.maps.LatLng(gpsX,gpsY); 
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});
				
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);    
				</script>
				
				</div>

			</div>

		</div>
	</div>
	<%@ include file="../footer.jsp"%>
</body>
</html>

