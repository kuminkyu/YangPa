<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div style="background-color: #f4f5f7;">
		<div class="ABA-wrap-box AB-cr ABA-layout-align" id="ABA-column-wrap"
			style="padding: 150px 0 180px 0;">
			<div class="ABA-container-box-1080">
				<table width=100% cellpadding=0 cellspacing=0 border=0>
					<tr>
						<td></td>

						<td width=550><div id='AB_contents'
								style="padding: 0 30px; background-color: #ffffff;">
								<form>

									<div class="ABA-content-box pageMember"
										style="padding-bottom: 0;">

										<div class="container" style="width: 100%;">
											<h2 style="text-align: center;">Yang Pa</h2>
											<ul class="nav nav-tabs">
												<li class="active"><a data-toggle="tab" href="#home">아이디찾기</a></li>

												<li><a data-toggle="tab" href="#menu1">비밀번호찾기</a></li>
											</ul>

											<div class="tab-content">
												<div id="home" class="tab-pane fade in active">
													<div
														style="font-family: NanumGothic; padding: 30px 20px 20px 20px;">
														<div
															style="color: #FF3300; letter-spacing: -1px; margin-bottom: 10px;">아이디가
															기억나지 않으신가요?</div>
														<div style="color: #FF3300; margin-bottom: 30px;">
															회원가입시 입력한 <a>아래의 정보를 입력해주세요.</a>
														</div>
														<div style="margin-bottom: 20px;">
															<div style="padding-right: 22px;">
																<input type="text"
																	style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
																	placeholder="아이디" maxlength="50" />
															</div>
															<div style="padding-right: 22px;">
																<input type="password"
																	style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
																	placeholder="이메일" maxlength="50" />
															</div>
														</div>
														<div>
															<div>
																<input type="submit" value="입력완료"
																	style="padding: 15px 0; width: 100%; background-color: #FF9900; font-size: 16px; color: #fff" />
															</div>

														</div>
														<div style="text-align: center; padding-top: 16px;">
															<div style="color: #a8a8a8; letter-spacing: -0.6px;">가입문의
																0507-1412-7235</div>
														</div>
													</div>
												</div>
												<div id="menu1" class="tab-pane fade">
													<div
														style="font-family: NanumGothic; padding: 30px 20px 20px 20px;">
														<div
															style="color: #FF3300; letter-spacing: -1px; margin-bottom: 10px;">비밀번호가
															기억나지 않으신가요?</div>
														<div style="color: #FF3300; margin-bottom: 10px;">
															회원가입시 입력한 <a>아래의 정보를 입력해주세요.</a>
														</div>
														<div style="color: #FF3300; margin-bottom: 30px;">
															<a>비밀번호는 <a>가입시 입력한 이메일로 발송 <a>됩니다.</a>
														</div>
														<div style="margin-bottom: 20px;">
															<div style="padding-right: 22px;">
																<input type="text"
																	style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
																	placeholder="아이디" maxlength="50" />
															</div>
															<div style="padding-right: 22px;">
																<input type="text"
																	style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
																	placeholder="이름" maxlength="50" />
															</div>
															<div style="padding-right: 22px;">
																<input type="password"
																	style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold; border-radius:;"
																	placeholder="이메일" maxlength="50" />
															</div>
														</div>
														<div style="text-align: center; padding-bottom: 10px">
															<a>이메일이 정상적으로 수신되지 않을 시 문의전화 바랍니다.</a>
														</div>
														<div>
															<div>
																<input type="submit" value="입력완료"
																	style="padding: 15px 0; width: 100%; background-color: #FF9900; font-size: 16px; color: #fff"
																	tabindex="3" />
															</div>
														</div>
														<div style="text-align: center; padding-top: 16px;">
															<div style="color: #a8a8a8; letter-spacing: -0.6px;">가입문의
																0507-1412-7235</div>
														</div>
													</div>

												</div>

											</div>
										</div>

									</div>
								</form>
							</div></td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
