<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login modal start -->
<div class="modal" id="login_modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<!-- modal header -->
			<div class="modal-header">
				<h4>LogIn</h4>
				<button type="button"
						class="close"
						data-dismiss="modal">&times;</button>
			</div>
			<!-- modal body -->
			<div class="modal-body">
				<form id="loginForm" method="post"
					action="${pageContext.request.contextPath}/login">
					<div class="form-group">
						<label for="login_id">Your Id.</label>
						<input class="form-control" type="text" id="login_id" name="login_id">
					</div>
					<div class="form-group">
						<label for="login_pwd">Your Password.</label>
						<input class="form-control" type="text" id="login_pwd" name="login_pwd">
					</div>
				</form>
			</div>
			<!-- modal footer -->
			<div class="modal-footer">
				<button type="button"
						class="btn btn-danger"
						data-dismiss="modal">Close</button>
				<button type="button" id="btn_login"
						class="btn btn-primary">LogIn</button>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	$("#login_pwd").keyup(function() {
		if(event.keyCode == 13) {
			$("#btn_login").click();
		}//if
	});//keyup

	$("#btn_login").click(function() {
		if( $.trim( $("#login_id").val() ) == "" ) {
			alert("Check Your Id.");
			return;//return 혼자 사용되면, 진행 중지!
		}//if
		if( $.trim( $("#login_pwd").val() ) == "" ) {
			alert("Check Your Password.");
			return;//return 혼자 사용되면, 진행 중지!
		}//if
		$("#loginForm").submit();
	});//click
});//ready
</script>
<!-- login modal end -->


















