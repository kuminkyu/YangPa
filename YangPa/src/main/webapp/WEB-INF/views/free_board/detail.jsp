<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_delete").click(function() {

			if( !confirm("정말 삭제하시겠습니까?") ) {
				return;
			}

			if( $.trim( $("#pwd").val() ) == "" ){
				alert("비밀번호를 입력해 주세요.");
				return;
			}

			$.ajax({
				type : "delete"
				, contentType : "application/json"
				, url : "${root}/free_board/delete"
				, data : JSON.stringify({
							bno : "${free_board_dto.bno}"
							, pwd : $("#pwd").val()
				})
				, success : function(data, status) {
					if(data == 1) {
						alert("게시글이 삭제 되었습니다.");
     location.href="${root}/free_board/list";
					} else if(data == -1) {
						alert("비밀번호가 올바르지 않습니다.");
					} else {
						alert("관리자에게 문의 바랍니다.");
					}
				}//function
			});//ajax
		});//click

		$("#btn_wform").click(function() {
			
			if( !confirm("정말 수정하시겠습니까?") ) {
				return;
			}

			if( $.trim( $("#pwd").val() ) == "" ){
				alert("비밀번호를 입력해 주세요.");
				return;
			}
			$.ajax({
				type : "get"
					, contentType : "application/json"
					, url : "${root}/free_board/updateck"
					, data : {
							bno : "${free_board_dto.bno}"
							, pwd : $("#pwd").val()
					}
					, success : function(data, status) {
						if(data == 1) {
							location.href="${root}/free_board/uform?bno=${free_board_dto.bno}";
							
						} else if(data == 0) {
							alert("비밀번호가 올바르지 않습니다.");
						} else {
							alert("관리자에게 문의 바랍니다.");
						}
					}//function
				});//ajax
			
//location.assign(
	//"${root}/free_board/uform?bno=${free_board_dto.pwd}"
//		+ $("#bno").val()
//);
		});//click

	});//ready
	</script>
	<div class="container">
		<%@ include file="../header.jsp" %>
		<h1 class="text-muted text-center mt-3 mb-3">
			자유게시판 상세보기	</h1>
		<div class="form-inline mb-3 float-right">
			<input type="text" id="pwd"
				class="form-control mr-1"
				placeholder="input password for delete">
			
			<button type="button" id="btn_delete"
				class="btn btn-danger mr-1">
				D E L E T E </button>
			<button type="button" id="btn_wform"
				class="btn btn-primary">
				U P D A T E </button>
		</div>
		
		
		<table class="table table-hover mb-5">
			<colgroup>
				<col width="25%">
				<col width="75%">
			</colgroup>
			<tr>
				<th class="text-right">제목</th>
				<td id="td_title"> ${free_board_dto.title}</td>
			</tr>
			<tr>
				<th class="text-right">작성자</th>
				<td id="td_writer">${free_board_dto.writer}</td>
			</tr>
			<tr>
				<th class="text-right">내용</th>
				<td id="td_cnts">${free_board_dto.cnts}</td>
			</tr>
		</table>
		
				
		
	
	</div>
</body>
</html>












