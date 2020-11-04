<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

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
						style="font-size: 30px;" href="${root}/mypage"> My페이지</a></li>
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;" href="${root}/logout"> 로그아웃</a></li>
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;" href="${root}/customer/notice">고객센터</a></li>
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
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;" href="${root}/board/search"> 리스트</a></li>
					<li><a class="nav-link text-white font-weight-bold"
						style="font-size: 30px;" href="${root}/customer/notice">고객센터</a></li>
					</ul>

				</c:otherwise>

			</c:choose>
	</div>
</nav>
<br>

