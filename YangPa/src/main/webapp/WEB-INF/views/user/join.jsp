<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../header.jsp"%>
	<div class="container">
		<h1 class="text-center mb-4">Yang Pa</h1>
    
	<form id="jform" method="post" action="">
	 		<h5 class="text-center mb-3">회원가입 정보입력</h5>
	 	<script type="text/javascript">
			$(document).ready(function() {
				$("#btn_join").click(function() {
					if( $.trim( $("#id").val() ) == "" ){
						alert("아이디를 확인해 주세요.");
						return;
					}
					if( $.trim( $("#pwd").val() ) == "" ){
						alert("비밀번호를 확인해 주세요.");
						return;
					}
					if( $.trim( $("#pwdre").val() ) == "" ){
						alert("비밀번호 재입력을 입력해 주세요.");
						return;
					}
			
					if( $("#pwd").val() != $("#pwdre").val() ){
						alert("비밀번호와 재입력이 다릅니다.\n"
								+ "비밀번호를 다시 확인해 주세요.");
						return;
					}
					if( $.trim( $("#name").val() ) == "" ){
						alert("이름을 확인해 주세요.");
						return;
					}
					
					if( $.trim( $("#tel1").val() ) == ""
						|| $.trim( $("#tel2").val() ) == ""
						|| $.trim( $("#tel3").val() ) == "" ){
						alert("전화번호를 확인해 주세요.");
						return;
					}
					if( $.trim( $("#email1").val() ) == ""
						|| $.trim( $("#email2").val() ) == "" ){
						alert("이메일을 확인해 주세요.");
						return;
					}
	
					$("#jform").submit();
				});//click
			});//ready : 현재 페이지 로딩 완료.
		</script>	
	 	
	 		
		<table class="table table-borderless">
			<colgroup>
				<col width="25%">
				<col width="75%">
			</colgroup>
			<tbody>
				<tr>
					<td>
						<div class="form-inline">
							<input type="text" class="form-control inputEng mr-1" style="width: 30%;"
									id="id" name="id" maxlength="20"  placeholder="아이디">
							<button type="button" id="btn_idchk" class="btn btn-warning" >중복확인</button>
							<script type="text/javascript">
							$(document).ready(function() {
								$("#btn_idchk").click(function() {
								 alert();
								}
							}
							</script>
						</div>
						<div  style="font-size: 11px;color: #767b86;letter-spacing: -0.6px;padding-top: 6px;padding-left: 3px;float: left;">
						최소 6자이상, 최대 12자이내에서 영문/숫자를 사용해주세요.
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-inline">
							<input type="password" class="form-control inputEng mr-3" style="width: 30%;" id="pwd" name="password" maxlength="30" value="" 
							placeholder="비밀번호">
							<input type="password" class="form-control inputEng" style="width: 30%;" id="pwdre" name="pwdre" maxlength="20" value="" 
							placeholder="비밀번호 재입력"><br>
						</div>
						<div  style="font-size: 11px;color: #767b86;letter-spacing: -0.6px;padding-top: 6px;padding-left: 3px;float: left;">
						최소 8자이상, 최대 15자내에서&nbsp;<span style="color: rgb(255, 102, 51);">영문+숫자+특수문자를 모두사용</span>&nbsp;하여 비밀번호를 만들어주세요.
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control inputEng" id="name" name="name" maxlength="5" value="" 
						placeholder="이름" style="width: 25%;">
						<div  style="font-size: 11px;color: #767b86;letter-spacing: -0.6px;padding-top: 6px;padding-left: 3px;float: left;">
						커뮤니티 활동등에 사용, 언제든 변경/수정 가능
						</div>
						<br>
					</td>
				</tr>
				<tr>
					<td class="form-inline">
						<input type="text" class="form-control mr-1 inputNum" id="tel1" name="tel1" 
							value="" size="3" maxlength="3" placeholder="010">
						- <input type="text" class="form-control ml-1 mr-1 inputNum" id="tel2" name="tel2" 
							value="" size="4" maxlength="4" placeholder="1234">
						- <input type="text" class="form-control ml-1 inputNum" id="tel3" name="tel3" 
							value="" size="4" maxlength="4" placeholder="5678">
					</td>
				</tr>
				<tr>
					<td class="form-inline mb-3"> 
						<input type="text" class="form-control ml-1 inputEmail inputEng" id="email" name="email" 
						size="60" value="" maxlength="50"  placeholder="yangpa@help.com">
					</td>
				</tr>
			
<!-- 				<tr> -->
<!-- 						<td> <b>설명</b><div>가입시 인증이 아닌 사용중 기습인증제도를 취하고 있습니다. 인증실패시 계정보호 상태로 잠금되니 꼭 사용중인 이메일 및 휴대폰번호를 입력해주세요</div></td> -->
<!-- 				</tr> -->
			
			</tbody>
		</table>
			<div class="text-center mb-3">
					<button type="button" id="btn_join" class="btn btn-primary" style="margin-top: 25px;">회원가입</button>
			</div>
			
						
				

	</form>			
	
</div>	





</body>
</html>