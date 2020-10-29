<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!-- filter modal -->

<script src="${pageContext.request.contextPath}/resources/js/filter_modal.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script>
$(document).ready(function () {
	
	$("#bunText").val(null);		
	$("#largelistText").val(null);		
	$("#middlelistText").val(null);		
	$("#minpriceText").val(null);		
	$("#maxpriceText").val(null);		
	$("#kindText").val(null);
	$("#optionText").val(null);		
	$("#usedayText").val(null);
	
	//필터모달 클릭시 시,도 로드
	$("#filterlink").click(function() {
		$.get(
			"${pageContext.request.contextPath}/filterRest/selectLarge"
			,{}
			,function(data,status){
				$("#largelist").empty;
				$("#largelist").append(
					"<option value='0'>시,도 선택</option>"	
				);
				$.each(data, function(index, dto){
					$("#largelist").append(
							"<option value='"+dto.addrcode+"'>"
							+ dto.addrname
							+ "</option>"	
					);
				});
			}
		);//get
	});//click
	
	//시,도 값이 바뀌면 그에 맞는 구군 코드 반환
	$("#largelist").change(function() {
		$.get(
			"${pageContext.request.contextPath}/filterRest/selectMiddle"
			,{lcode : $("#largelist").val() }
			, function(data, status){
				$("#middlelist").empty();
				$("#middlelist").append(
						"<option value='0'>구, 군 선택</option>"						
				);
				$.each(data, function(index, dto) {
					$("#middlelist").append(
						"<option value='"+dto.addrcode+"'>"
						+ dto.addrname
						+ "</option>"
					);//append
				});//each
			}//function
			,"json"
		);//get
		
	});//change
	
	//탭 넘어갈시 체크박스와 라디오박스를 해제하는 부분
   $(".bun").click(function() {
	   $("input:checkbox[name='check']").attr("checked", false);
	   $("input:radio[name='ex_kind']").attr("checked", false);
	   $("#datepicker1").val(null);
	    $("#datepicker2").val(null);
	});
	
	
	//검색 버튼 클릭시 히든 상자에 값을넣고 전송
   $("#filter_search_btn").click(function() {
		let bunryu = $('[class="nav-link bun active"]').html();
		let use_date = "";
		let kindvar = "";
			switch (bunryu){
		      case "운동" :
		    	  bunryu = 1;
		    	  kindvar = $("input:radio[name='ex_kind']:checked").val();
		          break;
		      case "여행" :
		    	  bunryu = 2;
		          use_date = $("#datepicker1").val();
		          break;
		      case "티켓" :
		          use_date = $("#datepicker2").val();
		          bunryu = 3;
		          break;
		      default :
		    	  bunryu = 4;
		    }
		let list = [];//옵션을 담은 배열
		  $("input:checkbox[name=check]:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
		   list.push($(this).val());
		  });	
// 				  bun : bunryu
// 				, largelist : $("#largelist").val()
// 				, middlelist : $("#middlelist").val()
// 				, minprice : $("#minprice").val()
// 				, maxprice :  $("#maxprice").val()
// 				, kind : kindvar
// 				, option : JSON.stringify(list)
// 				, useday : use_date

		$("#bunText").val(bunryu);		
		$("#largelistText").val($("#largelist").val());		
		$("#middlelistText").val($("#middlelist").val());		
		$("#minpriceText").val($("#minprice").val());		
		$("#maxpriceText").val($("#maxprice").val());		
		$("#kindText").val(kindvar);
		$("#optionText").val(list);		
		$("#usedayText").val(use_date);	

		$("#filterform").submit();
		
// 		alert(bunryu);
// 		alert($("#largelist").val());
// 		alert($("#middlelist").val());
// 		alert($("#minprice").val());
// 		alert($("#maxprice").val());
// 		alert(list);
// 		alert(use_date);
		
	});
	
});//ready
</script>
<form id="filterform" method="get"
 action="${root}/filter/filterselect" style ="display:none;" >
<input type="text" id="bunText" name="bun">
<input type="text" id="largelistText" name="largelist">
<input type="text" id="middlelistText" name="middlelist">
<input type="text" id="minpriceText" name="minprice">
<input type="text" id="maxpriceText" name="maxprice">
<input type="text" id="kindText" name="kind">
<input type="text" id="optionText" name="option">
<input type="text" id="usedayText" name="useday">
</form>
<div class="modal" id="filter_modal">
	<div class="modal-dialog modal-l">
		<div class="modal-content">
			<!-- moadl header -->
			<div class="modal-header bg-dark">
			
				<h3 class="text-white">상세검색</h3>
				<button type="button"
						class="close"
						data-dismiss="modal">&times;</button>
			</div>
			<!-- 지역 , 금액 부분 -->
			<div class="modal-body">
					<h5>분류</h5>
				 	 <ul class="nav nav-tabs">
						  <li class="nav-item bun">
						    <a class="nav-link bun active" data-toggle="tab" href="#excercise">운동</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link bun" data-toggle="tab" href="#travel">여행</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link bun" data-toggle="tab" href="#ticket">티켓</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link bun" data-toggle="tab" href="#etc">기타</a>
						  </li>
					</ul>
			  	 <div class="form-inline mt-3 mb-3">
					  <label for="sel1" class="mr-3"><h6 class="mt-3 ml-3"><b>지역 : </b></h6></label>
					  <select class="form-control mr-3" id="largelist">
					  </select>
					  <select class="form-control" id="middlelist" >
					  </select>
				 </div>
				<div class="container mb-3">
		    	  	<div class="form-inline">
				      <label for="minprice" class="mr-3"><b>금액 : </b></label>
				      <input type="text" class="form-control col-4 mr-2"  placeholder="최소금액" id="minprice">
				      ~<input type="text" class="form-control col-4 ml-2"  placeholder="최대금액" id="maxprice">
				    </div>
	    	  </div>
			</div>
			<hr>
			
			<!-- modal body -->
			<div class="modal-body">
				<div class="container">
					<div class="tab-content">
					  <div class="tab-pane fade show active" id="excercise">
					  	  <h5>운동 상세</h5>
						  <div class="container">
					    	  <form>
					    	  	<label for="check" class="mt-3"><b>타입 : </b></label>
							    <label class="checkbox-inline">
							      <input  class="mr-1 ml-3" type="checkbox" value="101" name="check">헬스권
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="102" name="check">필라테스
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="103" name="check">스키
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="104" name="check">골프
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="105" name="check">요가
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="106" name='check'>에어로빅
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="107" name='check'>복싱
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="108" name='check'>주짓수
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="109" name='check'>수영
							    </label>
							  </form>
							  <br>
				    	  </div>
				    	  <div class="form-inline">
				    	  	  <form>
				    	  	  	<div class="form-inline">
					    	  	  	  <label class="ml-3 mr-3"><b>유형 : </b></label>
								      <label><input type="radio" name="ex_kind" checked value="0">기간제</label>
								      <label><input type="radio" name="ex_kind" class="ml-2" value="1">횟수제</label>
				    	  	  	</div>
							  </form>
				    	  </div>
					  </div>
					  <div class="tab-pane fade" id="travel">
					  <h5>여행 상세</h5>
					   <div class="container">
					    	  <form>
					    	  	<label for="check" class="mt-3"><b>타입 : </b></label>
							    <label class="checkbox-inline">
							      <input  class="mr-1 ml-3" type="checkbox" value="201" name='check'>호텔
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="202" name='check'>모텔
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="203" name='check'>팬션
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="204" name='check'>게스트하우스
							    </label>
							  </form>
							  <br>
				    	  </div>
				    	  <div class="container mb-3">
						 	<div class="form-inline">
						 		<label for="checkin" class="mr-3"><b>체크인 날짜 : </b></label>
						 		<input type="text" readonly="readonly" maxlength="10" class="form-control mr-2 datepicker"
						 			id="datepicker1">
						 	<span class="text-muted text-center ml-1 mt-1"><small>체크인 이전에 매물들이 검색됩니다.</small></span>
						 	</div>
						 </div>
				    	  
					  </div>
					  <div class="tab-pane fade" id="ticket">
					  <h5>티켓 상세</h5>
					  	 <div class="container">
					    	  <form>
					    	  	<label for="check" class="mt-3"><b>타입 : </b></label>
							    <label class="checkbox-inline">
							      <input  class="mr-1 ml-3" type="checkbox" value="301" name='check'>콘서트
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="302" name='check'>연극
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="303" name='check'>영화
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="304" name='check'>뮤지컬
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="305" name='check'>오케스트라
							    </label>
							    <label class="checkbox-inline">
							      <input class="mr-1" type="checkbox" value="306" name='check'>방송
							    </label>
							  </form>
							  <br>
				    	  </div>
						 <div class="container mb-3">
						 	<div class="form-inline">
						 		<label for="checkin" class="mr-3"><b>사용 날짜 : </b></label>
						 		<input type="text" readonly="readonly" maxlength="10" class="form-control mr-2 datepicker" id="datepicker2">
						 	<span class="text-muted text-center ml-1 mt-1"><small>사용날짜 이전에 매물들이 검색됩니다.</small></span>
						 	</div>
						 </div>
					  </div>
					  <div class="tab-pane fade" id="etc">
					  </div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<div class="float-right">
					<button class="btn btn-primary" id="filter_search_btn"> 검 색 </button>
				</div>
			</div>
			
		</div>
	</div>

</div>