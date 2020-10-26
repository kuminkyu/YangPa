<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ include file="./searching/filter_modal.jsp" %>
<meta charset="utf-8">

<nav class="navbar navbar-expand-sm sticky-top" style="background-color: #3CB371">
  <div class="container-fluid" >
    <div class="navbar-header">
      <a class="navbar-brand" href="${root}/"> 
      	<img src="${root}/resources/img/yangpa2.jpg" alt="logo" title="546" style="width: 40px;">
      </a>
      <a class="navbar-brand text-white font-weight-bold" style="font-size: 28px;" href="${root}/">YangPa</a>
    </div>
    
	    <img src="${root}/resources/img/filter.jpg" id="filterlink" data-toggle="modal"
                  data-target="#filter_modal" href="${root}/" style="width: 280px;">
   
    <ul class="nav navbar-nav navbar-right">
	  <li><a href="#"><a class="nav-link text-white font-weight-bold" href="#"> 로그인</a></li>
	  
      <li><a href="#"><a class="nav-link text-white font-weight-bold" href="#"> 회원가입</a></li>
      <li><a href="#"><a class="nav-link text-white font-weight-bold" href="#"> My페이지</a></li>
      <li><a href="#"><a class="nav-link text-white font-weight-bold" href="${root}/board/search"> 리스트</a></li>
      <li><a class="nav-link text-white font-weight-bold" href="#">고객센터</a></li>
    </ul>
  </div>
</nav>
<br>

