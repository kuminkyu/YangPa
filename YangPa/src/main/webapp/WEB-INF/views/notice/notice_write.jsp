<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${root}/resources/ckeditor/ckeditor.js"></script>

</head>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#btn_writer").click(function() {
		let cntsData = CKEDITOR.instances.cnts.getData();
		if($.trim( $("#title").val() ) == "" ){
			alert("제목을 입력하세요");
			return;
		}else if($.trim( cntsData ) == ""){
			alert("내용을 입력하세요");
			return;
		}
		
		$.ajax({
			type : "POST"
			, url : "${root}/notice/write"
			, data :{
				title : $("#title").val()
				, contents : cntsData
			}
			,success : function(data , status) {
				if(status == "success"){
					if(data == 1){
						alert("글 등록 성공");
						location.href = "${root}/notice";
					}else{
						alert("글 등록 실패");
					}
				}else{
					alert("통신불량");
				}
			}
		});//ajax
	});//click
	
	
});//ready
</script>
<body>
	<%@ include file="../header.jsp" %>
	<div class="container">
			<h1 class="text-center mb-3">공지사항 글 등록</h1>
		<table border="1" class="table table-hover mr-5 ml-5" >
			<tr>
				<td>제목</td>
				<td>
					<input type="text" id="title" name="title" class="form-inline"
							maxlength="50">
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
        <a href="${root}/notice">
		<button type="button" class="btn btn-primary mr-3 ml-3">목록으로</button>
		</a>
		
		<button type="button" id="btn_writer"  class="btn btn-primary mr-3 ml-3">글등록하기</button>
		</div>
	</div>
	<%@ include file="../footer.jsp" %>
</body>
</html>