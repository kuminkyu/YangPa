<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />    
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
<script type="text/javascript">

$(document).ready(function() {
	let typeno;
	$(".tablesearch").click(function() {
		$(".board-title").empty();
		typeno = $(this).text();
		switch (typeno){
	      case "운동" :
	    	  typeno = 1;
				$(".board-title").append(
					"<i class='fas fa-dumbbell mr-2'></i>"  
					+"<span style='color: red' class='mr-2'>"
					+ "운동</span>판매목록"		
				);
	          break;
	      case "여행" :
	    	  typeno = 2;
				$(".board-title").append(
					"<i class='fas fa-umbrella-beach mr-2'></i>"
					+"<span style='color: blue' class='mr-2'>"
					+"여행</span>판매목록"		
				);
	          break;
	      case "티켓" :
	    	  typeno = 3;
				$(".board-title").append(
					"<i class='fas fa-ticket-alt mr-2'></i>"
					+"<span style='color: brown' class='mr-2'>티켓</span>판매목록"		
				);
	          break;
	      case "기타" :
	    	  typeno = 4;
				$(".board-title").append(
					"<i class='fas fa-plus mr-2'></i>"	
					+"<span style='color: gray' class='mr-2'>기타</span>판매목록"		
				);
	          break;
	      case "전체" :
	    	  typeno = 0;
				$(".board-title").append(
					"<i class='fas fa-seedling mr-2'></i>"	
					+"<span style='color: green' class='mr-2'>양파</span>판매목록"		
				);
	          break;
	      default :
	    	  alert("리스트 로딩중 오류 다시 시도해 주십시요");
	    }
		//페이징 //
		$.ajax({
			contentType : "application/json"
			, url : "${root}/pageRest/pageCount/"+typeno
			,success: function(totCnt, status){
				$(".pagination").empty();
				$(".pagination").append(
					'<li class="page-item disabled"><a class="page-link" href="#" id = "prevpage"> 이전 </a></li>'		
				);
				alert(totCnt);
				if(totCnt % 10 > 0){
					totCnt = (totCnt / 10) +  1;
				}else{
					totCnt = totCnt/10;
				}
				let maxPage
				if(totCnt >= 10){
					maxPage = 10
				}else{
					maxPage = totCnt
				}
				for (let i = 1; i <= maxPage ; i++) {
					$(".pagination").append(
						'<li class="page-item">'
						+'<a class="page-link" href="${root}/page?reqNum="' + i + '>'
						+ i +'</a></li>'
					);	
				}
				if(totCnt <= 10){
					$(".pagination").append(
							'<li class="page-item disabled"><a class="page-link" href="#" id = "prevpage"> 다음 </a></li>'		
					);					
				}else{
					$(".pagination").append(
							'<li class="page-item"><a class="page-link" href="#" id = "prevpage"> 다음 </a></li>'		
					);		
				}

			}
		});//ajax
		
		//리스트 뽑아오기 // 
		$.ajax({
			contentType : "application/json"
			, url : "${root}/boardRest/searchAll/"+typeno
			, success : function(data, status) {
				$("tbody").empty();
				$.each(data, function(index, dto){
					if(dto.state == "0"){
						dto.state = "<span class='badge badge-pill badge-success'>판매중</span>";
					}else if(dto.state == "1"){
						dto.state = "<span class='badge badge-pill badge-light'>판매완료</span>";
					}
					$("tbody").append(
							"<tr class='text-center'>"
							+"<td><b>"+dto.bno+"</b></td>"
							+"<td><b>"+dto.state+"</b></td>"
							+"<td><b>"+dto.addrname+"</b></td>"
							+"<td>"+dto.type+"</td>"
							+"<td>"
							+"<a href='${pageContext.request.contextPath}/free/detail?bno="
							+dto.bno+"'>"+dto.title+"</a>"
							+"</td>"
							+"<td>"+dto.useday+"</td>"
							+"<td>"+dto.price+"</td>"
							+"<td>"+dto.write_date+"</td>"
							+"</tr>"
						);//append
				});//each
			}//function
		});//ajax
	});//click
	
});//ready

</script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="container-fluid">
		<ul class="pagination">
		  <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
		  <li class="page-item"><a class="page-link" href="#">1</a></li>
		  <li class="page-item"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
		<div class="row">
			<div class="col-lg-2">
		        <h3 class="mb-2">분류</h3>
		        <div class="list-group">
		          <b><a href="#" class="list-group-item text-dark tablesearch"><i class="fas fa-seedling mr-2"></i>전체</a></b>
		          <b><a href="#" class="list-group-item text-dark tablesearch"><i class="fas fa-dumbbell mr-2"></i>운동</a></b>
		          <b><a href="#" class="list-group-item text-dark tablesearch"><i class="fas fa-umbrella-beach mr-2"></i>여행</a></b>
		          <b><a href="#" class="list-group-item text-dark tablesearch"><i class="fas fa-ticket-alt mr-2"></i>티켓</a></b>
		          <b><a href="#" class="list-group-item text-dark tablesearch"><i class="fas fa-plus mr-2"></i>기타</a></b>
		        </div>
			</div>
			<div class="col-lg-10 mt-2 mb-2">
				<div class="cotainer mt-2 mb-2">
					<button class="btn btn-primary float-right"><b>판매등록</b></button>
					<button class="btn btn-warning float-right mr-2"><b>내 판매 서비스로 이동</b></button>
					<h4 class="ml-5">
					<b class="board-title">
					<i class="fas fa-seedling mr-2"></i><span style="color: green" class="mr-2">양파</span>판매목록</b>
					</h4>
				</div>
			
			<table class="table table-hover mt-4">
				<colgroup>
					<col width="5%">
					<col width="5%">
					<col width="10%">
					<col width="10%">
					<col width="30%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">상태</th>
						<th class="text-center">위치</th>
						<th class="text-center">분류</th>
						<th class="text-center">제목</th>
						<th class="text-center">사용가능일/날짜</th>
						<th class="text-center">금액</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
			</div>
		</div>
</body>
</html>