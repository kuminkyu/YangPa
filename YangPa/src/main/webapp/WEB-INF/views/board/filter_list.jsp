<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>필터 검색 결과</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">

</head>
<body>
   <%@ include file="../header.jsp" %>
   <div class="container-fluid">
         <div class="col-lg-12 mt-2 mb-2">
            <div class="cotainer mt-2 mb-2">
               <a href="${root}/write"><button class="btn btn-primary float-right"><b>판매등록</b></button></a>
               <a><button class="btn btn-warning float-right mr-2"><b>내 판매 서비스로 이동</b></button></a>
               <h4 class="ml-5">
               <b class="board-title">
               <i class="fas fa-seedling mr-2"></i><span style="color: green" class="mr-2">검색결과</span>판매목록</b>
               </h4>
            </div>
         
         <table class="table table-hover mt-4">
            <colgroup>
               <col width="5%">
               <col width="5%">
               <col width="10%">
               <col width="10%">
               <col width="30%">
               <col width="15%">
               <col width="10%">
               <col width="15%">
            </colgroup>
            <thead>
               <tr>
                  <th class="text-center">번호</th>
                  <th class="text-center">상태</th>
                  <th class="text-center">위치</th>
                  <th class="text-center">분류</th>
                  <th class="text-center">제목</th>
                  <th class="text-center">사용가능일/날짜</th>
                  <th class="text-center">금액</th>
                  <th class="text-center">등록일</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="dto" items="${filter_list}" varStatus="status">
                  <tr class="text-center">
                     <td><b>${dto.bno}</b></td>
                  <c:choose>
                     <c:when test="${dto.state == 0}">
                     <td><span class='badge badge-pill badge-success'>판매중</span></td>
                     </c:when>
                     <c:when test="${dto.state == 1}">
                     <td><span class='badge badge-pill badge-light'>판매완료</span></td>
                     </c:when>
                  </c:choose>
                     <td><b>${dto.addrname}</b></td>
                     <td>${dto.type}</td>
                     <td>
                        <a href="${pageContext.request.contextPath}/board/detail?bno=${dto.bno}&typeno=${dto.in_tel}">
                           ${dto.title}
                        </a>
                     </td>
                     <td>${dto.useday}</td>
                     <td>${dto.price}</td>
                     <td>${dto.write_date}</td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
            <ul class="pagination justify-content-center">
            </ul>
         </div>
      </div>
</body>
</html>