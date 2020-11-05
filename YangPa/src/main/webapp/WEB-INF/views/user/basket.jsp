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
		<h3 class="mt-3 mb-5">마이페이지 - 관심목록</h3>

		<!-- Tab panes -->
		<div>
			<table class="table table-hover" id="basket">
				<thead>
					<tr>
						<th>번호</th>
						<th class="text-center">제목</th>
						<th class="text-right">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="5%">bno</td>
						<td width="50%" class="text-center">title</td>
						<td width="10%" class="text-right">2020-10-27</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- container -->
</body>
</html>