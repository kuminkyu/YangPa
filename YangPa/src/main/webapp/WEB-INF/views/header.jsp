<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<style type="text/css">
* {
	font-family: 'Nanum Pen Script', cursive;
	font-size: 20px;
	font-weight: bold;
} 
</style>
<%@ include file="./searching/filter_modal.jsp"%>


<meta charset="utf-8">


<nav class="navbar navbar-expand-sm sticky-top"
	style="background-color: #3CB371">
	<div class="container-fluid">

		<c:choose>
			<c:when
				test="${login_id_session != null && login_id_session.length()>0 }">

				<div class="navbar-header">
					<a class="navbar-brand" href="${root}/"> <img
						src="${root}/resources/img/yangpa5.jpg" src="${root}/" alt="logo"
						title="546" style="width: 40px;">
					</a> <a class="navbar-brand text-white font-weight-bold"
						style="font-size: 33px;" href="${root}/">YangPa</a>
				</div>
				<img src="${root}/resources/img/filter.jpg" id="filterlink"
					data-toggle="modal" data-target="#filter_modal" src="${root}/"
					style="width: 280px;">
				<ul class="nav navbar-nav navbar-right">

					<!-- 로그인 여부 묻고 되었을 때만 -->
					
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;"> ID : ${login_id_session}님</a></li>
					
					<li class="nav-item dropdown"><a href="#"
						class="nav-link dropdown-toggle text-white font-weight-bold"
						style="font-size: 30px;" data-toggle="dropdown">My페이지</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}/basket?bno=${login_mno_session}&reqNum=1"> 관심목록 </a> 
							<a class="dropdown-item" href="${root}/mypage?bno=${login_mno_session}&reqNum=1"> 내가쓴글 </a>
							<a class="dropdown-item" href="${root}/change"> 회원정보수정 </a>
						</div></li>
						
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;" href="${root}/logout"> 로그아웃</a></li>
						
					<li class="nav-item dropdown"><a href="#"
						class="nav-link dropdown-toggle text-white font-weight-bold"
						style="font-size: 30px;" data-toggle="dropdown">고객센터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}/notice"> 공지사항 </a> 
							<a class="dropdown-item" href="${root}/free_board/list">
								자유게시판 </a>
						</div></li>
				</ul>

			</c:when>

			<c:otherwise>
				<div class="navbar-header">
					<a class="navbar-brand" href="${root}/"> <img
						src="${root}/resources/img/yangpa4.jpg" src="${root}/" alt="logo"
						title="546" style="width: 40px;">
					</a> <a class="navbar-brand text-white font-weight-bold"
						style="font-size: 33px;" href="${root}/">YangPa</a>
				</div>
				<img src="${root}/resources/img/filter.jpg" id="filterlink"
					data-toggle="modal" data-target="#filter_modal" src="${root}/"
					style="width: 280px;">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;" href="${root}/allow"> 회원가입</a></li>
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;" href="${root}/loginform"> 로그인</a></li>
					<li class="nav-item dropdown"><a href="#"
						class="nav-link dropdown-toggle text-white font-weight-bold"
						style="font-size: 30px;" data-toggle="dropdown">고객센터</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${root}/notice"> 공지사항 </a> <a
								class="dropdown-item" href="${root}/free_board/list">
								자유게시판 </a>
						</div></li>
				</ul>

			</c:otherwise>

		</c:choose>
	</div>
</nav>
<br>

