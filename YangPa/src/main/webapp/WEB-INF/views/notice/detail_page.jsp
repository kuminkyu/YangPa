<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Detail</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="container">
		<h1 class="text-info text-center mt-3 mb-3">Detail page</h1>
		<div class="form-inline mb-3 float-right">
			<input type="hidden" id="bno">
		</div>
		<div class="form-inline mb-3" >
			<table class="table table-hover mb-5" >
				<colgroup>
					<col width="25%">
					<col width="75%">
				</colgroup>
				<tr>
					<th class="text-right">제목</th>
					<td>${notice_dto.title}</td>
				</tr>
				<tr>
					<th class="text-right">조회수</th>
					<td>${notice_dto.view_cnt}</td>
				</tr>
				<tr>
					<th class="text-right">작성일</th>
					<td>${notice_dto.write_date}</td>
				<tr>
					<th class="text-right">내용</th>
					<td>${notice_dto.cnts}</td>
				</tr>
				</tr>
			</table>			
		</div>
	</div><!-- container end -->
	<%@ include file="../footer.jsp" %>
</body>
</html>








