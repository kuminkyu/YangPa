<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
#footer{
	position:fixed;
}
</style>
</head>

<body>
	<%@include file="../header.jsp"  %>
	<a>패스워드는 : "${find_pwd.pwd}"입니다</a>
	<h2>
		<a href="${pageContext.request.contextPath}/find">
			ID/PWD 찾기 바로가기
		</a>
	</h2>
	<div id = "footer">
		<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>