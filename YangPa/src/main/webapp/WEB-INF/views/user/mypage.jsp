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
<script type="text/javascript">
$(document).ready(function() {
	$(".del_btn").click(function() {
		let con = confirm("정말 삭제하시겠습니까?");
		if(con){
			$.get(
				"${root}/boardRest/delete"
				,{ bno : $(this).attr("name")}
				,function(data, status){
					if(status == "success"){
						if(data == "1"){
							alert("삭제완료!!!");
							location.href="${root}/mypage?bno=${login_mno_session}&reqNum=1"
						}else{
							alert("삭제중 오류 좀있다가 다시 시도해 주세요");
						}
					}else{
						alert("통신오류 지속될시 관리자에게 연락하세요");
					}
				}
			);//get
		}else{
			return;
		}
		
			
	});//click
	
	$(".sellbtn").click(function() {
		let con = confirm("판매완료 등록 하시겠습니까?");
		if(con){
			$.get(
				"${root}/boardRest/sellComplete"
				,{ bno : $(this).attr("name")}
				,function(data , status){
					if(status == "success"){
						if(data == 1){
							alert("게시글이 판매완료 로 등록 되었습니다.");
							location.href = "${root}/mypage?bno=${login_mno_session}&reqNum=1"
						}else{
							alert("판매완료등록 실패");
						}
					}else{
						alert("통신오류.. 지속될시 관리자에게 연락하세요");
					}
				}
			);
		}else{
			return;
		}
	});
});//ready

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
				+'<a class="page-link" href="${root}/mypage?bno='+"${login_mno_session}"+'&reqNum='+i+'">'
				+ i +'</a></li>'
		);
		
	}else{
		$(".pagination").append(
			'<li class="page-item" id="gbh'+i+'">'
			+'<a class="page-link" href="${root}/mypage?bno='+"${login_mno_session}"+'&reqNum='+i+'">'
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
		<h3 class="mt-3 mb-5">마이페이지 - 내가쓴글</h3>


		<!-- Tab panes -->
		<div>
			<table class="table table-hover" id="mypage">
				<thead>
					<tr>
						<th width="5%" class="text-center">번호</th>
						<th width="10%" class="text-center">판매상태</th>
						<th width="15%" class="text-center">분류</th>
						<th width="30%" class="text-center">제목</th>
						<th width="15%"class="text-center">작성일</th>
						<th width="25%"class="text-center">변경</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${mylist}" varStatus="status">
						<tr>
							<td width="5%" class="text-center">
								<b>${dto.bno}</b>
							</td>
							
							<td width="10%" class="text-center">
								<c:choose>
				                     <c:when test="${dto.state == 0}">
				                     <span class='badge badge-pill badge-success'>판매중</span>
				                     </c:when>
				                     <c:when test="${dto.state == 1}">
				                     <span class='badge badge-pill badge-light'>판매완료</span>
				                     </c:when>
				                     <c:when test="${dto.state == 2}">
				                     	<span class='badge badge-pill badge-danger'>마감임박!!</span>
				                     </c:when>
				                     <c:when test="${dto.state == 3}">
				                     	<span class='badge badge-pill badge-dark'>마감</span>
				                     </c:when>
			                  	</c:choose>
							</td>
							<td width="15%" class="text-center">
								<b>${dto.typename}</b>
							</td>
							
							<td width="30%" class="text-center">
							<a href="${pageContext.request.contextPath}/board/detail?bno=${dto.bno}&typeno=${dto.type}">
	                           ${dto.title}
	                        </a>
							</td>
							
							<td width="15%" class="text-center">${dto.write_date}</td>
							<td width="25%" class="text-center">
								<a href="${root}/board/uform?bno=${dto.bno}">
								<button class="btn btn-warning">수정</button></a>
								<button class="btn btn-secondary ml-2 sellbtn"  name="${dto.bno}">판매완료</button>
								<button class="btn btn-danger ml-2 del_btn" name="${dto.bno}">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
				
			</table>
			<ul class="pagination justify-content-center">
            <!-- 이부분에 자바스크립트로 페이징이 들어감 -->
            </ul>
		</div>
	</div>

</body>
</html>