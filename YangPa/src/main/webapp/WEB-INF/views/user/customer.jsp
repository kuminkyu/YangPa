<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="container">
		<h3 class="mt-3 mb-5">고객센터</h3>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs">
			<li class="nav-item">
			<a class="nav-link active" data-toggle="tab" href="${root}/customer/notice">전체목록</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#menu5">자유게시판</a>
			</li>
			<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#menu6">공지사항</a>
			</li>
			</ul>
			
			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane container active" id="menu4">
					<table class="table table-hover" id="News_List">
						<thead>
							<tr>
								<th>번호</th>
								<th class="text-center">제목</th>
								<th class="text-right">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<c:forEach var="dto" items="${customer_list}">
								<td width="5%">${dto.bno}</td>
								<td width="50%" class="text-center">${dto.title}</td>
								<td width="10%" class="text-right">${dto.write_date}</td>
							</c:forEach>
							</tr>
						</tbody>		
					</table>
				</div><!-- menu4 -->
				<div class="tab-pane container fade" id="menu5">
					<table class="table table-hover" id="News_Free">
						<thead>
							<tr>
								<th>번호</th>
								<th class="text-center">제목</th>
								<th class="text-right">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr><!-- 글클릭해서 보기기능첨가 -> 자유게시판 쓰기기능 -->
							<c:forEach var="dto" items="${customer_list}">
								<td width="5%">${dto.bno}</td>
								<td width="50%" class="text-center">${dto.title}</td>
								<td width="10%" class="text-right">${dto.write_date}</td>
							</c:forEach>
							</tr>
						</tbody>		
					</table>
				</div><!-- menu5 -->
				<div class="tab-pane container fade" id="menu6">
					<table class="table table-hover" id="News_Info">
						<thead>
							<tr>
								<th>번호</th>
								<th class="text-center">제목</th>
								<th class="text-right">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr><!-- 글클릭해서 보기기능첨가 -> 공지사항글 보기 -->
								<div class="mt-2 mb-2">
								<p><a href="#">자주묻는 Q&A 1 - 링크걸어서 확인가능하게 구현</a></p>
								<p><a href="#">자주묻는 Q&A 2 - 링크걸어서 확인가능하게 구현</a></p>
								<p><a href="#">자주묻는 Q&A 3 - 링크걸어서 확인가능하게 구현</a></p>
								<p><a href="#">자주묻는 Q&A 4 - 링크걸어서 확인가능하게 구현</a></p>
								<p><a href="#">자주묻는 Q&A 5 - 링크걸어서 확인가능하게 구현</a></p>
								</div>
							<c:forEach var="dto" items="${customer_list}">
								<td width="5%">${dto.bno}</td>
								<td width="50%" class="text-center">${dto.title}</td>
								<td width="10%" class="text-right">${dto.write_date}</td>
							</c:forEach>
							</tr>
						</tbody>
					</table>
				</div><!-- menu6 -->
			</div><!-- tab-content -->
			<ul class="pagination justify-content-center">
				<c:if test="${beginPage} > 10">
					<li class="page-item">
						<a class="page-link" href="">Before</a>
					</li>
				</c:if><!-- before -->
				<c:forEach var="page_num" begin="${beginPage}" end="${endPage}">
					<li>
						<a class="page-link" href="">${page_num}</a>
					</li>						
				</c:forEach><!-- clicked page -->
				<c:if test="${endPage < maxPage}">
					<li class="page-item">
						<a class="page-link" href="">Next</a>
					</li>
				</c:if><!-- next -->
			</ul>
	</div><!-- container -->
 
</body>
</html>