<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.15.0/full/ckeditor.js"></script>
</head>
<body>

  <%@include file="../header.jsp" %>
  <script type="text/javascript">
	$(document).ready(function() {
		$("#btn_update").click(function() {
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
			///////
		if( $.trim( $("#cnts").val() ) == "" ){
				alert("contents!!!");
				return ;
			}//if
			let ck = CKEDITOR.instances.cnts;
			$.post(
				"${root}//free_board/update"
				,{
					bno : "${free_boardDTO.bno}"
				  , pwd : 	$("#pwd").val()
				  , writer : $("#writer").val()
					, title : $("#title").val()
					, cnts : ck.getData()
					
				}
				,function(data , status ){
					if(status == "success"){
						if(data == 1){
							alert("글등록완료");
							location.href = "${root}/free_board/list"
						}else{
							alert("글등록 실패 다시 시도");
						}
						
					}else{
						alert("통신문제");
					}
				}
			);//post
		});//click
	});//ready
	</script>
	
	<div class="container">
	<h1 class="text-center">자유게시판 수정</h1>
	<hr>
	<form id="uform"
			action="${root}//free_board/update"
			method="post">
		<table border="1" class="table table-hover mr-5 ml-5" >
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title" name="title" class="form-inline"
							maxlength="50" value="${free_boardDTO.title}">
				</td>
			</tr>
			
			<tr>
			
				<td>작성자</td>
				<td>
					<input type="text" id="writer" name="writer" value="${free_boardDTO.writer}"
							maxlength="10">
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
					<textarea rows="10" cols="80"
							id="cnts" name="cnts" >${free_boardDTO.cnts}</textarea>
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
		
		<button type="button" id="btn_update"  class="btn btn-primary mr-3 ml-3">U P D A T E</button>
		</div>
	</form>
	</div>
	
      
       
   <%@include file="../footer.jsp" %>	
</body>
</html>










