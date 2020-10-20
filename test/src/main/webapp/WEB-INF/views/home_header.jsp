<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- home_header start -->
<!-- header nav start -->
<%@ include file="./login_modal.jsp"%>
<!-- 		<div style="overflow: hidden;"> header 밖으로 빼려면 주석 해제 -->
<nav class="navbar navbar-expand-sm float-right">
	<ul class="navbar-nav">
		<c:choose>
			<c:when
				test="${login_id_session !=null && login_id_session.length() > 0 }">
				<li><a class="nav-link text-muted font-weight-bold" href="#">MyPage</a>
				</li>
				<li><a class="nav-link text-muted font-weight-bold"
					href="${pageContext.request.contextPath}/logout">LogOut</a></li>
			</c:when>
			<c:otherwise>
				<li><a class="nav-link text-muted font-weight-bold"
					href="${pageContext.request.contextPath}/joinform">SignUp</a></li>
				<li class="nav-item"><a
					class="nav-link text-muted font-weight-bold" data-toggle="modal"
					data-target="#login_modal" href="#">LogIn</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>
<!-- 		</div> -->
<!-- header nav end -->
<!-- header start -->
<header class="jumbotron bg-warning text-right mb-1">
	<h1>HAPPY JOBURO</h1>
	<h4>행복한 직업 소개소</h4>
</header>
<!-- header end -->
<!-- nav start -->
<nav class="navbar navbar-expand-sm bg-secondary rounded">
	<ul class="navbar-nav">
		<li class="nav-item"><a
			class="nav-link text-white font-weight-bold ml-3"
			href="${pageContext.request.contextPath}/">Home</a></li>
		<li class="nav-item"><a
			class="nav-link text-white font-weight-bold ml-3"
			href="${pageContext.request.contextPath}/fblist">자유게시판</a></li>
		<li class="nav-item"><a
			class="nav-link text-white font-weight-bold ml-3"
			href="${pageContext.request.contextPath}/mblist">회원게시판</a></li>
		<li class="nav-item"><a
			class="nav-link text-white font-weight-bold ml-3" href="#">Notice</a>
		</li>
		<li class="nav-item"><a
			class="nav-link text-white font-weight-bold ml-3" href="#">News</a></li>
		<li class="nav-item"><a
			class="nav-link text-white font-weight-bold ml-3" href="#">Contact</a>
		</li>
		<li class="nav-item dropdown"><a
			class="nav-link dropdown-toggle text-white font-weight-bold ml-3"
			href="" data-toggle="dropdown">소개소찾기</a>
			<div class="dropdown-menu bg-secondary">
				<a class="dropdown-item text-white font-weight-bold" href="#">지도
					검색</a> <a class="dropdown-item text-white font-weight-bold" href="#">이름
					검색</a> <a class="dropdown-item text-white font-weight-bold" href="#">직업
					검색</a>
			</div></li>
	</ul>
</nav>
<!-- nav end -->
<!-- home_header end -->
