<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
					
					let tel = $("#tel1").val() + $("#tel3").val() + $("#tel3").val();
					$("#tel").val(tel);
					
					if( $.trim( $("#email").val() ) == "" ){
						alert("이메일을 확인해 주세요.");
						return;
					}
	
					$("#jform").submit();
				});//click
			});//ready : 현재 페이지 로딩 완료.
		</script>	
	 	
	 </form>
	 	
	 	<form id="jform" method="post"
				action="${pageContext.request.contextPath}/join">
			<table class="table">
				<tr>
					<td style = "text-align:left">ID</td>
					<td>
					<div class="form-inline ml-2">
						<input type="text" class="form-control inputEng mr-1" style="width: 40%;" 
									id="id" name="id" maxlength="30"  placeholder="아이디">
									
							<button type="button" id="btn_idchk" class="btn btn-warning ml-2" >중복확인</button>
							<div class="ml-1" style="font-size: 11px;color: #767b86;letter-spacing: -0.6px;padding-top: 6px;padding-left: 3px;float: left;">
						최소 6자이상, 최대 12자이내에서 영문/숫자를 사용해주세요.
						</div>
					</div>
					</td>
				</tr>
				<tr>
					<td style = "text-align:left">PWD</td>
					<td>
						<div class="form-inline ml-2">
							<input type="password" class="form-control inputEng mr-3" style="width: 40%;" id="pwd" name="pwd" maxlength="30" value="" 
							placeholder="비밀번호">
							<input type="password" class="form-control inputEng" style="width: 50%;" id="pwdre" name="pwdre" maxlength="20" value="" 
							placeholder="비밀번호 재입력"><br>
						</div>
						<div class = "ml-2" style="font-size: 11px;color: #767b86;letter-spacing: -0.6px;padding-top: 6px;padding-left: 3px;float: left;">
						8~15자내에서&nbsp;<span style="color: rgb(255, 102, 51);">영문+숫자+특수문자 모두사용</span>&nbsp;하여 만들어주세요.
						</div>
					</td>
				</tr>
				
				<tr>
					<td style = "text-align:left">NAME</td>
					<td>
						<div class = "form-inline">
						 	 
							<input type="text" class="form-control inputEng ml-2" id="name" name="name" maxlength="5" value="" 
							placeholder="이름" style="width: 30%;">
							
							<div class="ml-2" style="font-size: 11px;color: #767b86;letter-spacing: -0.6px;padding-top: 6px;padding-left: 3px;float: left;">
							커뮤니티 활동등에 사용, 언제든 변경/수정 가능
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style = "width:20%; text-align:left">TEL</td>
					<td class="form-inline">
						<input type="text" class="form-control ml-2 mr-1 inputNum" id="tel1" name="tel1" 
							value="" size="3" maxlength="3" placeholder="010">
							-<input type="text" class="form-control ml-2 mr-1 inputNum" id="tel2" name="tel2" 
							value="" size="4" maxlength="4" placeholder="1234">
							-<input type="text" class="form-control ml-2 mr-1 inputNum" id="tel3" name="tel3" 
							value="" size="4" maxlength="4" placeholder="5678">
						<input type="text" style="display:none;" name="tel" id="tel">
					</td>
				</tr>
				<tr>
					<td style = "text-align:left">EMAIL</td>
					<td class="form-inline ml-1"> 
						<input type="text" class="form-control ml-1 inputEmail inputEng" id="email" name="email" 
						size="20" value="" maxlength="40"  placeholder="yangpa@help.com">
					</td>
				</tr>		
			</table>
				<div class="text-right mb-3">
					<button type="button" class="btn btn-primary"
							id="btn_join"> 회 원 가 입 </button>
				</div>
		</form>	
					
	
</div>	

</div>
</div>
</form>
</div>
</td>
<td></td>
</tr>
</table>
</div>
</div>





</body>
</html>