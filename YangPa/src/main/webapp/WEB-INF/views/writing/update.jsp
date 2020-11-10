<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정하기</title>

<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${root}/resources/ckeditor/ckeditor.js"></script>
</head>
<style>
a1 {
	color: #000000;
}
</style>
<script type="text/javascript" src="${root}/resources/js/update.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 처음엔 사용날짜 , 잔여기간을 숨김
	$("#limitdate").hide();
	$("#useday").hide();
	$("#in_ex_kind").css("display","none");
		
// 	alert("${uform.addrcode}".substring(0, 2));
	
	
	//시,도 를 db 에서 가져옴 // 
	$.get(
		"${pageContext.request.contextPath}/filterRest/selectLarge"
		,{}
		,function(data,status){
			$("#in_largelist").empty;
			$("#in_largelist").append(
				"<option value='0'>시,도 선택</option>"	
			);
			$.each(data, function(index, dto){
				if( dto.addrcode == "${uform.addrcode}".substring(0,2) ) {
					$("#in_largelist").append(
						"<option value='"+dto.addrcode+"' selected='selected'>"
						+ dto.addrname
						+ "</option>"
					);
				}else{
					$("#in_largelist").append(
						"<option value='"+dto.addrcode+"'>"
						+ dto.addrname
						+ "</option>"
					);
				}
				
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
					if( dto.addrcode == "${uform.addrcode}") {
						$("#in_middlelist").append(
							"<option value='"+dto.addrcode+"' selected='selected'>"
							+ dto.addrname
							+ "</option>"
						);
					}else{
						$("#in_middlelist").append(
							"<option value='"+dto.addrcode+"'>"
							+ dto.addrname
							+ "</option>"
						);
					}
				});//each
			}//function
			,"json"
		);//get
	});//change	
	$("#in_largelist").change();
	$("#insert_button").click(function() {
		let typeno = $("#in_kind").val(); // 유형 종류 저장
		let bf = "${uform.type}".substring(0,1);
		let af ;
		if(bf == $("#in_kind").val()){
			af = bf;
		}else{
			af = $("#in_kind").val();
		}
		
		alert("bf : " + bf);
		alert("af : " + af);
		//validation 체크(공통) // 
		let cntsData = CKEDITOR.instances.comment.getData();
		if($.trim( $("#in_tel").val() ) == ""){
			alert("전화번호를 입력하세요!!");
			 $('#textbox').focus();
			return;
		}else if($("#in_kind").val() == "0" || $("#in_kind_option").val() == "0"){
			alert("유형을 두개다 선택해주세요!!");
			return;
		}else if($.trim( $("#in_price").val() ) == ""){
			alert("가격을 입력해 주세요!!");
			return;
		}else if($.trim( $("#in_price").val() ) == ""){
			alert("가격을 입력해 주세요!!");
			return;
		}else if($("#in_largelist").val() == "0" || $("#in_middlelist").val() == "0"){
			alert("사용위치를 선택해 주세요!!");
			return;
		}else if($.trim( $("#addrdetail").val() ) == ""){
			alert("지도검색 키워드를 입력해주세요!!");
			return;
		}else if($.trim( $("#in_title").val() ) == ""){
			alert("제목을 입력하세요!!");
			return;
		}else if($.trim(cntsData) == ""){
			alert("내용을 입력하세요!!");
			return;
		}
		
		let inUseDay;
		if(typeno == "1"){
			if($("input:radio[name='in_ex_kind']:checked").val() == undefined){
				alert("판매권 종류를 선택해주세요!!");
				return;
			}else if($.trim( $("#ex_useday").val() ) == ""){
				alert("남은잔여기간(월,회) 를 입력하세요!!");
				return;
			}
			inUseDay = $("#ex_useday").val();
		}else if(typeno == "2" || typeno == "3"){
			if($("#in_datepicker").val() == ""){
				alert("사용날짜를 선택해주세요!!");
				return;
			}
			inUseDay = $("#in_datepicker").val();
		}
		
		
		$.post(
			"${root}/boardRest/boardUpdate"
			,{
				  bno : "${uform.bno}"
				, writer : $("#in_mno").val()
				, in_tel : $("#in_tel").val()
				, type : $("#in_kind_option").val()
				, title : $("#in_title").val()
				, contents : cntsData
				, price : $("#in_price").val()
				, addrcode : $("#in_middlelist").val()
				, addrdetail : $("#addrdetail").val()
				, addrgps : $("#addrgps").val()
				, useday : inUseDay
				, buy_type : $("input:radio[name='in_ex_kind']:checked").val()
				, changeBf : bf
				, changeAf : af
			}
			,function(data , status){
				if(status == "success"){
					if(data > 0){
						alert("글 등록을 완료했습니다!!");
						location.href="${root}/board/mainlist?maintype="+data;
					}else{
						alert("글 등록에 실패했습니다.....");
					}
				}else{
					alert("통신문제 계속될시 관리자에게 연락하세요!!");
				}
			}
			
		);//get
		
	});//click
	
	
});//ready

</script>
<body>
	<%@ include file="../header.jsp"%>
	<div class="ABA-container-box-1080">
		<input type="text" id="in_mno" name="in_mno" value="${login_mno_session}" style="display: none">
		<table width=100% cellpadding=0 cellspacing=0 border=0>
			<tr>
				<td></td>
				
				<td width=550>
					<div id='AB_contents'
						style="padding: 50px 30px; background-color: #ffffff;">
						<form method="post">

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
										<p style="text-align: left;">구매자에게 연락 받을 번호(회원가입시 번호)</p>

										<input type="text" id="in_tel" name="in_tel" value="${login_tel_session}"
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
												    <option value="0">유형을 선택해 주세요</option>
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
											<div class="form-inline mt-1 mb-1 ml-3" id="in_ex_kind">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>판매권 종류 : </b>
												</h6>					    	  	  	  
									      		<label><input type="radio" name="in_ex_kind" class="ml-2" value="0">기간제</label>
									     		 <label><input type="radio" name="in_ex_kind" class="ml-2" value="1">횟수제</label>
											</div>
											<div class="form-inline mt-1 mb-1 ml-3">
											<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>판매금액 : </b>
											</h6></label> <input class="form-control col-6 mr-1" id="in_price" type="text" value="${uform.price}"> 원</div>
											<div class="form-inline mt-1 mb-1 ml-3" id="useday">
											<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>사용날짜 : </b>
											</h6></label> <input id="in_datepicker" readonly="readonly" class="form-control col-6 mr-2" type="text" name="useday">
											</div>
											<div class="form-inline mt-1 mb-1 ml-3" id="limitdate">
											<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>잔여기간 : </b>
											</h6></label> <input id="ex_useday" class="form-control col-4" type="text" name="useday">
											<small class="ml-2">숫자만 입력하십시요(일단위)</small></div>
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
												<select class="form-control" id="in_middlelist" >
												</select>
											</div>
										</div>
										<div class="row">
											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b> 지 도  : </b></h6></label>
														<input type="text" class="form-control" id="addrdetail" name="addrdetail" value="${uform.addrdetail}">
														</div>
														<small class="mapinfo"><b class="mt-2 ml-2">클릭한 한개의 마커가 주소로 표시됩니다.</b></small>
														<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e42e5969ccb79f90d06c6f07a63f1d9&libraries=services"></script>
														<div id="map" style="width:550px;height:350px;"></div>
														<script>
														$("#addrdetail").blur(function() {
															$(".mapinfo").show();
														 	 mapword =  $("#in_largelist option:checked").text()+" "+$("#in_middlelist option:checked").text()
														 	 			+" "+$("#addrdetail").val();
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
														        $("#addrdetail").val(place.place_name);
														        var latlng = new kakao.maps.LatLng(37, 127);
														       	let gps = marker.getPosition();
														       	$("#addrgps").val(gps.getLat()+","+gps.getLng())
														        infowindow.open(map, marker);
														    });
														}
														});
														$("#addrdetail").blur();
														</script>	
													<input type="text" id="addrgps" name="addrgps" value="${uform.addrgps}" style="display: none">			 
											</div>
										</div>
									</div>
									<div class="container p-3 my-3 border">
										<p style="text-align: left;">제목 /내용</p>
										<input type="text" class="form-control mb-3" id="in_title" value="${uform.title}">
										<textarea class="form-control mt-3" rows="10" cols="80" id="comment">
											${uform.contents}
										</textarea>
										<script>
										CKEDITOR.replace('comment',{
											filebrowserUploadUrl:'${root}/ckfileup'
										});
										</script>
									</div>
									<div class="text-right">
										<button type="button" class="btn btn-warning text-right" id="insert_button">
											글 수정하기
										</button>
									</div>
						</form>
					</div>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>