<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#del_btn").click(function() {
		if($.trim( $("#del_num").val() ) == ""){
			alert("삭제할 게시판 번호를 입력하세요");
			return;
		}
		
		$.get(
			"${root}/notice/delete"
			,{bno : $("#del_num").val() }
			,function(data , status){
				if(status == "success"){
					if(data == 1){
						alert("삭제성공");
						location.href = "${root}/notice";
					}else{
						alert("삭제 실패");
					}
					
				}else{
					alert("통신상태 불량");
				}
			}
		);//get
	});//click
	
});//ready

let beginCopy = 1;
let endCopy = 10;
let clickedPageNum = 1;
function clickedPaging(num) {
	if(num == "Before"){
		clickedPageNum = parseInt(beginCopy) -1;
	}else if (num == "Next") {
		clickedPageNum = parseInt(endCopy) + 1;
	} else {
		clickedPageNum = num;
	}
	alert(clickedPageNum);
	getList();
}
function getList() {
	$.get(
		"${root}/brdfree/list_search"
				+"?search_option="+$("#search_option").val()
				+"&search_word="+$("#search_word").val()
				+"&reqPage="+clickedPageNum
		, {}
		, function(data, status) {
			if(status == "success") {
				let list = data.board_list;
				if(list.length > 0) {
					$("#list_body").empty();
	 				$.each(list, function(idx, dto) {
	 					$("#list_body").append(
	 						"<tr>"
	 						+"<td>"+dto.bno+"</td>"
	 						+"<td>"+dto.title+"</td>"
	 						+"<td>"+dto.writer+"</td>"
	 						+"<td>"+dto.view_cnt+"</td>"
	 						+"<td>"+dto.write_date+"</td>"
	 						+"</tr>"
	 					);//append
					});//each
					$("#page_ul").empty();
					let begin = data.page_dto.beginPage;
					let end = data.page_dto.endPage;
					beginCopy = begin;
					endCopy = end;
					let max = data.page_dto.maxPage;
					if(begin > 10){
						$("#page_ul").append(
							"<li class='page-item'>"
							+"<a class='page-link'>"
							+"Before"
							+"</a></li>"
						);//append
					}
					for(; begin<=end; begin++){//page_ul
						$("#page_ul").append(
							"<li class='page-item'>"
							+"<a class='page-link' value='"+begin+"'>"
							+begin
							+"</a></li>"
						);//append
					}//for
					if(max > end){
						$("#page_ul").append(
							"<li class='page-item'>"
							+"<a class='page-link'>"
							+"Next"
							+"</a></li>"
						);//append
					}

					$("#page_ul li a").on("click",function() {
						clickPaging($(this).text());
					});//click
				} else {
					alert("조회된 데이터가 없습니다.");
				}
			} else {
				alert("서버와의 연결이 불안합니다.");
			}
		}//function
	);//get
}//function getList
</script>



	<%@ include file="../header.jsp" %>
	<div class="container">
		<h1 class="text-info mt-3 mb-3">Notice Board</h1>
		<c:if test="${login_role_session == '1'}">
		<div class="text-right mb-2">
			<a href="${root}/notice/wform"><button class="btn btn-primary">글 등록하기</button></a>
			<input type="text" id="del_num" placeholder="삭제할 게시판 번호">
			<button class="btn btn-danger" id="del_btn">글 삭제하기</button>
		</div>
		</c:if>
		<table  class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th width="20%">조회수</th>
					<th width="10%">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${notice_list}" varStatus="status">
				<tr>
					<td>${dto.bno}</td>
					<td width="40%">
					<a href="${root}/notice/detail_page?bno=${dto.bno}" id="clicked_title"> ${dto.title} </a>
					</td>
					<td width="20%">${dto.view_cnt}</td>
					<td width="10%">${dto.write_date}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>