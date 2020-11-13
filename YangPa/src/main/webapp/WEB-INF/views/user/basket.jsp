<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<%-- <script type="text/javascript" src="${root}/resources/js/my_paging.js"></script> --%>

<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
        contentType : "application/json"
        , url : "${root}/pageRest/myListCount?mno=${login_mno_session}"
        ,success: function(totresult, status){
           totCnt = totresult;
           paging(totCnt,1,10);
        }
     });//ajax
});
let totCnt;
let beginPage ,endPage;

function paging(totCnt , beginNum , endNum) {
$(".pagination").empty();
let maxPage ;
beginPage = beginNum;
endPage = endNum;

if(totCnt % 15 > 0){
	maxPage = (totCnt / 15) +  1;
}else{
	maxPage = totCnt/15;
}


if(endPage > maxPage) {endPage = maxPage}


if(beginPage > 10){
	$(".pagination").append(
			'<li class="page-item"><a class="page-link movepage" href="#"'
			+'onclick="movepage(0)" id = "prevpage"> 이전 </a></li>'		
	);
}else{
	$(".pagination").append(
			'<li class="page-item disabled"><a class="page-link" href="#" id = "prevpage"> 이전 </a></li>'		
	);
}

//리스트 숫자 찍는 for문 부분
for (let i = beginPage ; i <= endPage  ; i++) {
	if(parseInt("${reqNum}") == i){
		$(".pagination").append(
				'<li class="page-item active nowpage" id="gbh'+i+'">'
				+'<a class="page-link" href="${root}/basket?bno='+"${login_mno_session}"+'&reqNum='+i+'">'
				+ i +'</a></li>'
		);
		
	}else{
		$(".pagination").append(
			'<li class="page-item" id="gbh'+i+'">'
			+'<a class="page-link" href="${root}/basket?bno='+"${login_mno_session}"+'&reqNum='+i+'">'
			+ i +'</a></li>'
		);	
	}	
}

if(maxPage == endPage){
	$(".pagination").append(
			'<li class="page-item disabled"><a class="page-link" href="#" id = "nextpage"> 다음 </a></li>'		
	);					
}else{
	$(".pagination").append(
			'<li class="page-item"><a class="page-link" onclick="movepage(1)" href="#" > 다음 </a></li>'		
	);		
}
}

function movepage(num) {
if(num == 0){
	if(endPage % 10 != 0){
		endPage = beginPage + 9;
	}
	paging(totCnt,beginPage-10,endPage-10);
	list(beginPage);
}else{
	paging(totCnt,beginPage+10,endPage+10);
	list(beginPage);
}
}

</script>

<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<h3 class="mt-3 mb-5">마이페이지 - 관심목록</h3>

		<!-- Tab panes -->
		<div>
			<table class="table table-hover" id="basket">
				<thead>
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="15%" class="text-center">판매상태</th>
						<th width="15%" class="text-center">분류</th>
						<th width="40%" class="text-center">제목</th>
						<th width="20%"class="text-center">작성일</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${mybasket}" varStatus="status">
						<tr>
							<td width="10%" class="text-center">
								<b>${dto.bno}</b>
							</td>
							
							<td width="15%" class="text-center">
								<c:choose>
				                     <c:when test="${dto.state == 0}">
				                     <span class='badge badge-pill badge-success'>판매중</span>
				                     </c:when>
				                     <c:when test="${dto.state == 1}">
				                     <span class='badge badge-pill badge-light'>판매완료</span>
				                     </c:when>
			                  	</c:choose>
							</td>
							<td width="15%" class="text-center">
								<b>${dto.typename}</b>
							</td>
							
							<td width="40%" class="text-center">
							<a href="${pageContext.request.contextPath}/board/detail?bno=${dto.bno}&typeno=${dto.type}">
	                           ${dto.title}
	                        </a>
							</td>
							
							<td width="20%" class="text-center">${dto.write_date}</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<ul class="pagination justify-content-center">
            <!-- 이부분에 자바스크립트로 페이징이 들어감 -->
            </ul>
		</div>
	</div>
	<!-- container -->
</body>
</html>