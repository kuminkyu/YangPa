<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>양파_로그인</title>

<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<body>

<%@ include file="../header.jsp" %>
	
		<div class="ABA-wrap-box AB-cr ABA-layout-align" id="ABA-column-wrap"
			style="padding: 50px 0 30px 0;">
			
			<div class="ABA-container-box-1080">
				<table width=100% cellpadding=0 cellspacing=0 border=0>
					<tr>
						<td></td>
						
						<td width=550><div id='AB_contents'
								style="padding: 0 30px; background-color: #ffffff;">
								<form>

									<div class="ABA-content-box pageMember"
										style="padding-bottom: 0;">
										<div class="container p-3 my-3 border"
											style="font-family: NanumGothic; text-align: center; padding: 30px 20px 20px 20px;">
											<div
												style="color: #617484; letter-spacing: -1px; margin-bottom: 22px;">"당신의
												양도를 파세요, 양파"</div>
											<div
												style="font-size: 30px; color: #000000; margin-bottom: 50px;">로그인
												해주세요</div>
											<div style="margin-bottom: 20px;">
												<div class="-inputWrap" >
													<input type="text" name="user_id" value=""
														class="hs_txtline1"
														style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold;"
														placeholder="아이디" maxlength="50" tabindex="1" />
												</div>
												<div class="-inputWrap" >
													<input type="password" name="user_passwd" value=""
														class="hs_txtline1"
														style="width: 100%; color: #; padding: 15px 10px; font-size: 13px; font-weight: bold;"
														placeholder="비밀번호" maxlength="50" tabindex="2" />
												</div>
											</div>
											<div>
												<div class="-btnWrap">
													<input type="submit" name="submit_OK" value="로그인"
														
														class="btn-tpl"
														style="padding: 15px 0; width: 100%; background-color: #FF9900; font-size: 16px; color: #fff"
														tabindex="3" />
												</div>
												<div style="padding-top: 10px; padding-bottom: 20px;">
													<table width=100% cellpadding=0 cellspacing=0 border=0>
														<tr>

															<td style="text-align: right;">&nbsp;<a
																href="insiter.php?design_file=find_id_pw.php"><span
																	class="btn-tpl"
																	style="font-size: 11px; color: #757c8a; padding: 3px 8px; letter-spacing: -1px; border: 1px solid #dbe0e5; border-radius: 30px;">ID/PW
																		찾기</span></a></td>
														</tr>
													</table>
												</div>
											</div>
										</div>
									</div>
								</form>
								<div style="text-align: center;">
									<div style="letter-spacing: -0.6px;"></div>
									<div style="padding-bottom: 30px;">
										<a href="insiter.php?design_file=MemJoinChs.php"><span
											class="btn-tpl"
											style="font-size: 14px; color: #757c8a; padding: 3px 5px; letter-spacing: -1px; border-bottom: 1px solid #9b9da4;">회원가입</span></a>
									</div>
								</div>

							</div>
							<div style="text-align: center; padding-top: 16px;">
								<div style="color: #a8a8a8; letter-spacing: -0.6px;">가입문의
									0507-1412-7235</div>
							</div></td>
						<td></td>
					</tr>

				</table>


			</div>
		</div>

	<%@ include file="../footer.jsp" %>
</body>
</html>

