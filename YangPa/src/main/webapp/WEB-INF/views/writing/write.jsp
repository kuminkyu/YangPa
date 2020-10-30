<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<style>
a1 {
	color: #000000;
}
</style>
<script type="text/javascript" src="${root}/resources/js/write.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.get(
		"${pageContext.request.contextPath}/filterRest/selectLarge"
		,{}
		,function(data,status){
			$("#in_largelist").empty;
			$("#in_largelist").append(
				"<option value='0'>시,도 선택</option>"	
			);
			$.each(data, function(index, dto){
				$("#in_largelist").append(
						"<option value='"+dto.addrcode+"'>"
						+ dto.addrname
						+ "</option>"	
				);
			});
		}
	);//get
	//시,도 값이 바뀌면 그에 맞는 구군 코드 반환
	$("#in_largelist").change(function() {
		$.get(
			"${pageContext.request.contextPath}/filterRest/selectMiddle"
			,{lcode : $("#in_largelist").val() }
			, function(data, status){
				$("#in_middlelist").empty();
				$("#in_middlelist").append(
						"<option value='0'>구, 군 선택</option>"						
				);
				$.each(data, function(index, dto) {
					$("#in_middlelist").append(
						"<option value='"+dto.addrcode+"'>"
						+ dto.addrname
						+ "</option>"
					);//append
				});//each
			}//function
			,"json"
		);//get
	});//change	
	
	//유형이 바뀌면 유형별 상세유형을 부름
	$("#in_kind").change(function() {
		$.get(
			"${root}/"
			,{}
			,function(data , status){
				
			}
		);
	});
	var mapword
});
</script>
<body>
	<%@ include file="../header.jsp"%>
	<div class="ABA-container-box-1080">
		<table width=100% cellpadding=0 cellspacing=0 border=0>
			<tr>
				<td></td>

				<td width=550>
					<div id='AB_contents'
						style="padding: 50px 30px; background-color: #ffffff;">
						<form>

							<div class="ABA-content-box pageMember"
								style="padding-bottom: 0;">
								<div class="container p-2 my-3 border"
									style="font-family: NanumGothic; text-align: center; padding: 30px 20px 20px 20px;">
									<div style="color: #FF9900; letter-spacing: -1px; background-color: #87CEFA; font-size: 20px; font-weight: bold; margin-bottom: 22px;"
										class="container p-3 my-3 border">
										YangPa
										<a1> 판매등록</a1>
									</div>

									<div class="container p-3 my-3 border">
										<p style="text-align: left;">구매자에게 연락 받을 번호</p>

										<input type="text" id="tel"
											style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold;"
											placeholder="전화번호" maxlength="50" tabindex="2" />
									</div>
									
									<!-- 사용정보 -->
									<div class="container p-3 border">
										<p style="text-align: left;">사용정보</p>
										<div class="row">

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>유 형 : </b>
													</h6></label> 
											  <select class="form-control mr-3" id="in_kind" name="in_kind">
											  		<option value="0" class="">유형을 선택해 주세요</option>
											  		<option value="1">   운 동   </option>
											  		<option value="2">   여 행   </option>
											  		<option value="3">   티 켓   </option>
											  		<option value="4">   기 타   </option>
												</select> 
												<select class="form-control" id="in_kind_option">
												
												</select>
											</div>
										</div>
									</div>
									<!-- 판매정보 ()-->
									<div class="container p-3 my-3 border">
										<p style="text-align: left;">판매정보</p>
										<div class="row" id="sell_info">
										<!-- js로 이부분에 판매정보 추가해줌 -->
										</div>
									</div>
									<!-- 위치정보 -->
									<div class="container p-3 my-3 border">
										<p style="text-align: left;">위치정보</p>
										<div class="row">
											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3">
														<b>사용위치 : </b>
													</label> 
												<!-- 시도 부분 리스트 -->
												<select class="form-control mr-3" id="in_largelist">
												</select> 
												
												<!-- 구군 부분 리스트 -->
												<select class="form-control" id="in_middlelist">
												</select>
											</div>
										</div>
										<div class="row">
											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b> 지 도  : </b></h6></label>
														<input type="text" class="form-control" id="mapdetail" name="mapdetail">
														<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e42e5969ccb79f90d06c6f07a63f1d9&libraries=services"></script>
														<div id="map" style="width:350px;height:350px;"></div>
														<script>
														$("#mapdetail").blur(function() {
														 	 mapword =  $("#in_largelist option:checked").text()+" "+$("#in_middlelist option:checked").text()
														 	 			+" "+$("#mapdetail").val();
														 	 alert(mapword);
														// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
														var infowindow = new kakao.maps.InfoWindow({zIndex:1});
														
														var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
														    mapOption = {
														        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
														        level: 3 // 지도의 확대 레벨
														    };  
														
														// 지도를 생성합니다    
														var map = new kakao.maps.Map(mapContainer, mapOption); 
														
														// 장소 검색 객체를 생성합니다
														var ps = new kakao.maps.services.Places(); 
														
														// 키워드로 장소를 검색합니다
														
														ps.keywordSearch(mapword, placesSearchCB); 
														
														// 키워드 검색 완료 시 호출되는 콜백함수 입니다
														function placesSearchCB (data, status, pagination) {
														    if (status === kakao.maps.services.Status.OK) {
														
														        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
														        // LatLngBounds 객체에 좌표를 추가합니다
														        var bounds = new kakao.maps.LatLngBounds();
														
														        for (var i=0; i<data.length; i++) {
														            displayMarker(data[i]);    
														            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
														        }       
														
														        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
														        map.setBounds(bounds);
														    } 
														}
														
														// 지도에 마커를 표시하는 함수입니다
														function displayMarker(place) {
														    
														    // 마커를 생성하고 지도에 표시합니다
														    var marker = new kakao.maps.Marker({
														        map: map,
														        position: new kakao.maps.LatLng(place.y, place.x) 
														    });
														
														    // 마커에 클릭이벤트를 등록합니다
														    kakao.maps.event.addListener(marker, 'click', function() {
														        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
														        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
														        infowindow.open(map, marker);
														        alert(marker.get);
														        alert(cluster.getClusterMarker());
														    });
														}
														});
														
														</script>			 
											</div>
										</div>
									</div>

									<div class="container p-3 my-3 border">
										<p style="text-align: left;">사진첨부</p>
										<div class="row">
											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3">
													<b><input type="file" class="form-control-file"
														id="exampleFormControlFile1"></b>
												</label>
											</div>
										</div>
									</div>
									<div class="container p-3 my-3 border">
										<p style="text-align: left;">제목 /내용</p>
										<input type="text" class="form-control">
										<textarea class="form-control mt-3" rows="5" id="comment"></textarea>
									</div>
									<button type="button" class="btn btn-primary" id="insert_button">
										글 등록하기
									</button>
						</form>
					</div>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>