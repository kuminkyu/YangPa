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

<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<h3 class="mt-3 mb-5">마이페이지 - 내가쓴글</h3>


		<!-- Tab panes -->
		<div>
			<table class="table table-hover" id="mypage">
				<thead>
					<tr>
						<th width="10%" class="text-center">번호</th>
						<th width="15%" class="text-center">판매상태</th>
						<th width="50%" class="text-center">제목</th>
						<th width="10%"class="text-center">작성일</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${mylist}" varStatus="status">
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
							
							<td width="50%" class="text-center">
							<a href="${pageContext.request.contextPath}/board/detail?bno=${dto.bno}&typeno=${dto.type}">
	                           ${dto.title}
	                        </a>
							</td>
							
							<td width="10%" class="text-center">${dto.write_date}</td>
							
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	</div>

</body>
</html>