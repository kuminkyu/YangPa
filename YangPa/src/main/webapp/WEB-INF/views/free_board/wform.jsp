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
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.15.0/full/ckeditor.js"></script>
</head>

 
 
<body>
    <%@ include file="../header.jsp" %>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_writer").click(function() {
			if( $.trim( $("#title").val() ) == "" ){
				alert("제목 입력하세요");
				return;
			}//if

			if( $.trim( $("#writer").val() ) == "" ){
				alert("작성자를 입력하세요!!");
				return;
			}//if

			if( $.trim( $("#pwd").val() ) == "" ){
				alert("비밀번호 입력하세요");
				return;
			}//if
			
			let ck = CKEDITOR.instances.cnts;
			if( ck.getData() == "" ){
				alert("contents!!!");
				return;
			}//if
			
			$("#wform").submit();
		});//click
	});//ready
	</script>
	
	<div class="container">
	<h1 class="text-center">자유게시판 쓰기</h1>
	<hr>
	<form id="wform"
			action="${root}/writer"
			method="post">
		<table border="1" class="table table-hover mr-5 ml-5" >
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title" name="title" class="form-inline"
							maxlength="50">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" id="writer" name="writer"
							maxlength="10">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="text" id="pwd" name="pwd"
							maxlength="20">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="10" cols="30"
							id="cnts" name="cnts"></textarea>
					<script>
						CKEDITOR.replace('cnts');
					</script>
				</td>
			</tr>
		</table>
		<div class="text text-right pb-1 ">
        <a href="${root}/free_board/list">
		<button type="button" class="btn btn-primary mr-3 ml-3">L I S T</button>
		</a>
		
		
		<button type="button" id="btn_writer"  class="btn btn-primary mr-3 ml-3">S E N D</button>
		</div>
	</form>
	</div>
	            <hr>
			<%@ include file="../footer.jsp" %>
</body>
</html>


