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
		<h3 class="mt-3 mb-5">마이페이지</h3>
		<!-- Nav tabs -->
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#menu1">관심목록</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu2">내가쓴글</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#menu3">정보수정</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane container active" id="menu1">
				<table class="table table-hover" id="Like">
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
			<!-- menu1 -->
			<div class="tab-pane container fade" id="menu2">
				<table class="table table-hover" id="My_List">
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
			<!-- menu3 -->

			<div class="tab-pane container fade" id="menu3">

				<div class="ABA-wrap-box AB-cr ABA-layout-align"
					id="ABA-column-wrap" style="padding: 50px 0 30px 0;">

					<div class="ABA-container-box-1080">

						<table width=100% cellpadding=0 cellspacing=0 border=0>
							<tr>


								<td width=200>
									<div id='AB_contents'
										style="padding: 0 200px; background-color: #ffffff;">


										<div class="ABA-content-box pageMember"
											style="padding-bottom: 0;">

											<div class="container p-3 my-3 border"
												style="font-family: NanumGothic; text-align: center; padding: 30px 20px 20px 20px;">

												<form id="update" method="post"
													action="${pageContext.request.contextPath}/mypage">

													<table class"=text-center " style="width: 100;" id="MyInfo">
														<thead>
															<th><h1 class="text-center mt-3 mb-3">
																	Yang Pa
																	
																	<h6 class="text-center mb-3">회원정보수정</h6></h1></th>
														</thead>
														<tbody>
															<table class="table">
																<tr>
																	<td style="text-align: left">ID</td>
																	<td>
																		<div class="form-inline ml-2">
																			<input type="text" class="form-control inputEng mr-1"
																				style="width: 40%;" id="id" name="id" maxlength="30"
																				value="${login_id_session}">

																			<button type="button" id="btn_idchk"
																				class="btn btn-warning ml-2">중복확인</button>
																			<div class="ml-1"
																				style="font-size: 11px; color: #767b86; letter-spacing: -0.6px; padding-top: 6px; padding-left: 3px; float: left;">
																				최소 6자이상, 최대 12자이내에서 영문/숫자를 사용해주세요.</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td style="text-align: left">PWD</td>
																	<td>
																		<div class="form-inline ml-2">
																			<input type="password"
																				class="form-control inputEng mr-3"
																				style="width: 40%;" id="pwd" name="pwd"
																				maxlength="30" value="" placeholder="비밀번호">
																			<input type="password" class="form-control inputEng"
																				style="width: 50%;" id="pwdre" name="pwdre"
																				maxlength="20" value="" placeholder="비밀번호 재입력"><br>
																		</div>
																		<div class="ml-2"
																			style="font-size: 11px; color: #767b86; letter-spacing: -0.6px; padding-top: 6px; padding-left: 3px; float: left;">
																			8~15자내에서&nbsp;<span style="color: rgb(255, 102, 51);">영문+숫자+특수문자
																				모두사용</span>&nbsp;하여 만들어주세요.
																		</div>
																	</td>
																</tr>

																<tr>
																	<td style="text-align: left">NAME</td>
																	<td>
																		<div class="form-inline">

																			<input type="text" class="form-control inputEng ml-2"
																				id="name" name="name" maxlength="5" value=""
																				placeholder="이름" style="width: 30%;">

																			<div class="ml-2"
																				style="font-size: 11px; color: #767b86; letter-spacing: -0.6px; padding-top: 6px; padding-left: 3px; float: left;">
																				커뮤니티 활동등에 사용, 언제든 변경/수정 가능</div>
																		</div>
																	</td>
																</tr>
																<tr>
																	<td style="width: 20%; text-align: left">TEL</td>
																	<td class="form-inline"><input type="text"
																		class="form-control ml-2 mr-1 inputNum" id="tel1"
																		name="tel1" value="" size="3" maxlength="3"
																		placeholder="010"> -<input type="text"
																		class="form-control ml-2 mr-1 inputNum" id="tel2"
																		name="tel2" value="" size="4" maxlength="4"
																		placeholder="1234"> -<input type="text"
																		class="form-control ml-2 mr-1 inputNum" id="tel3"
																		name="tel3" value="" size="4" maxlength="4"
																		placeholder="5678"> <input type="text"
																		style="display: none;" name="tel" id="tel"></td>
																</tr>
																<tr>
																	<td style="text-align: left">EMAIL</td>
																	<td class="form-inline ml-1"><input type="text"
																		class="form-control ml-1 inputEmail inputEng"
																		id="email" name="email" size="20" value=""
																		maxlength="40" placeholder="yangpa@help.com">
																	</td>
																</tr>
															</table>
														</tbody>
													</table>
												<div class="text-center mb-3">
													<button type="button" id="btn_edit" class="btn btn-danger"
														style="margin-top: 25px;">수정하기</button>
												</div>
							</form>
							</div>
							</div>
							</div>
							</td>

							</tr>

						</table>


					</div>
					<!-- menu3 -->
				</div>
				<!-- tab-content -->
				<!-- 			<div class="text-center"> -->
				<!-- 				<input type="text" class="mr-3 text-center" value="관심목록" onclick="#Like"> -->
				<!-- 				<input type="text" class="mr-3 text-center"  value="내가쓴글" onclick="#My_List"> -->
				<!-- 				<input type="text" class="mr-3 text-center"  value="정보수정" onclick="#MyInfo"> -->
				<!-- 			</div> -->
			</div>
			<!-- container -->
		</div>
	</div>
</body>
</html>