<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<style>
a1 {
	color: #000000;
}
</style>

<body>
	<%@ include file="../header.jsp"%>


	<div class="ABA-container-box-1080">
		<table width=100% cellpadding=0 cellspacing=0 border=0>
			<tr>
				<td></td>

				<td width=550>
					<div id='AB_contents'
						style="padding: 0 30px; background-color: #ffffff;">
						<form>

							<div class="ABA-content-box pageMember"
								style="padding-bottom: 0;">
								<div class="container p-3 my-3 border"
									style="font-family: NanumGothic; text-align: center; padding: 30px 20px 20px 20px;">
									<div
										style="color: #FF9900; letter-spacing: -1px; background-color: #87CEFA; font-size: 20px; font-weight: bold; margin-bottom: 22px;"
										class="container p-3 my-3 border">
										YangPa
										<a1> 판매등록</a1>
									</div>

									<div class="container p-3 my-3 border">
										<p style="text-align: left;">구매자에게 연락 받을 번호</p>

										<input type="text"
											style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold;"
											placeholder="전화번호" maxlength="50" tabindex="2" />
									</div>

									<div class="container p-3 border">
										<p style="text-align: left;">매장정보</p>
										<div class="row">

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>매장유형 : </b>
													</h6></label> <select class="form-control mr-3" id="largelist">
												</select> <select class="form-control" id="middlelist">
												</select>
											</div>

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>매장이름 : </b>
													</h6></label> <input class="form-control col-6" type="text">
											</div>

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>매장위치 : </b>
													</h6></label> <select class="form-control mr-3" id="largelist">
												</select> <select class="form-control" id="middlelist">
												</select>
											</div>

										</div>

									</div>

									<div class="container p-3 my-3 border">
										<p style="text-align: left;">판매정보</p>
										<div class="row">

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>판매타입 : </b> <input class=ml-2 type="checkbox">
														기간제 <input type="checkbox"> 회차제

													</h6></label>
											</div>

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>판매금액 : </b>
													</h6></label> <input class="form-control col-6" type="text"> 원
											</div>

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>잔여기간 : </b>
													</h6></label> <input class="form-control col-4" type="text"> 월/회
											</div>

										</div>
									</div>

									<div class="container p-3 my-3 border">
										<p style="text-align: left;">사진첨부/내용</p>
										<div class="row">

											<div class="form-inline mt-1 mb-1 ml-3">
												<label for="sel1" class="mr-3"><h6 class="mt-3 ml-3">
														<b>파일선택 : </b>

													</h6></label>
											</div>

										</div>
									</div>
									<button type="button" class="btn btn-primary">글 등록하기</button>
						</form>
					</div>
				</td>
				<td></td>

			</tr>

		</table>
	</div>



</body>
</html>