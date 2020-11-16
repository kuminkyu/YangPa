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

</head>
<body>
<%@ include file="../header.jsp" %>
	<div class="container">
	
		
		<h1 class="text-center mt-3 mb-3 text-muted">
		      자유게시판 목록
		</h1>
        
        
		<div class="text-right mb-3">
			<a href="${root}/wform">
				<button type="button" class="btn btn-primary">
					글 쓰러 가기</button>
			</a>
		</div>

		<table class="table">
			<thead class="text-center">
				<tr class="text text-left">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${free_board_list}" varStatus="status">
					<tr>
						<td>${dto.bno}</td>
						<td>
							<a href="${root}/free_board/detail?bno=${dto.bno}">
								${dto.title}
							</a>
						</td>
						<td>${dto.writer}</td>
						<td>${dto.write_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
		
		
		
		
		<%@ include file="../footer.jsp" %>
</body>
</html>
