<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Andamiro</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Free Bootstrap 4 Template by uicookies.com">
<meta name="keywords"
	content="Free website templates, Free bootstrap themes, Free template, Free bootstrap, Free website template">

<link
	href="https://fonts.googleapis.com/css?family=Crimson+Text:400,400i,600|Montserrat:200,300,400"
	rel="stylesheet">

<link rel="stylesheet"
	href="./resources/css/bootstrap/bootstrap.css">
<link rel="stylesheet"
	href="./resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="./resources/fonts/law-icons/font/flaticon.css">

<link rel="stylesheet"
	href="./resources/fonts/fontawesome/css/font-awesome.min.css">


<link rel="stylesheet" href="./resources/css/slick.css">
<link rel="stylesheet" href="./resources/css/slick-theme.css">

<link rel="stylesheet" href="./resources/css/helpers.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/landing-2.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
.error {
	color: red;
}
</style>

<script>
	var pwcheck = false;
	
	$(document).ready(function(){
        $("#id").attr("readonly",true);
        
        $('#btnSubmit').click(function(){
        	if ($('#pw').val() == '') {
        		$('#pwError').text("비밀번호를 입력해 주세요!");
        		$('#pw').focus();
        		return false;
        	} else if($('#checkPw').val() != ''){
        		if ($('#pw').val() == $('#checkPw').val()) {
        			$('#memberForm').submit();
    			} else {
    				$('#checkPw').val('');
    				$('#checkPwError').text("비밀번호가 일치 하지 않습니다!");
    				$('#checkPw').focus();
    				return false;
    			}
        	} else{
        		$('#memberForm').submit();
        	}
       	});
        
        
        $('#btnLeave').click(function(){
        	var delConfirm = confirm('정말로 탈퇴 하시겠습니까?');
    		if (delConfirm) {
    			if ($('#pw').val() == '') {
    	    		$('#pwError').text("비밀번호를 입력해 주세요!");
    	    		$('#pw').focus();
    	    		return false;
    	    	}
    			$('#memberForm').attr('action','leave.do');
    			$('#memberForm').submit();
    		}
    		else {
    			return false;
    		}
        });
    });
	
	$(function() {
		$('#pw').blur(function() {
			if ($('#pw').val() != '') {
				$('#pwError').text("");
			}
		})
	});

	$(function() {
		//비밀번호 확인
		$('#checkPw').blur(function() {
			if ($('#pw').val() != $('#checkPw').val() && $('#checkPw').val() != '') {
				if ($('#checkPw').val() != '') {
					$('#checkPwError').text("비밀번호가 일치하지 않습니다.");
					$('#checkPw').val('');
					$('#checkPw').focus();
					this.pwcheck = false;
				}
			} else {
				$('#checkPwError').text("");
				this.pwcheck = true;
			}
		})
	});

	function cancel() {
		location.href = "mypage.do";
	}

	document.addEventListener('keydown', function(event) {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
		;
	}, true);
</script>

</head>
<body>

	<div class="container">
		<br> <br> <br>
		<div class="card-title text-center">
			<h1>
				<span class="text-primary">My Page</span>
			</h1>
		</div>
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">회원 정보 수정</h5>

						<!-- form class="form-label-group"-->
						<form:form modelAttribute="memberDTO"
							class="form-horizontal" role="form" action="update.do"
							method="post" name="memberForm" id="memberForm">
							<div class="form-group">
								<label for="recipient-name" class="control-label"></label> <span
									class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								<form:input path="id" type="text" class="form-control" name="id"
									placeholder="아이디를 입력해 주세요." />
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label"></label> <span
									class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								<form:input path="pw" type="password" class="form-control"
									name="pw" placeholder="비밀번호를 입력해 주세요." />
									<form:errors path="pw" cssClass="error" />
								<div class="error" id="pwError"></div>
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label"></label> <span
									class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								<form:input path="checkPw" type="password" class="form-control"
									name="checkPw" placeholder="비밀번호를 재입력 해주세요." />
								<div class="error" id="checkPwError"></div>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label"></label> <span
									class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								<form:input path="name" type="text" class="form-control"
									name="name" placeholder="이름를 입력해 주세요." />
								<form:errors path="name" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label"></label> <span
									class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								<form:input path="email" type="text" class="form-control"
									name="email" placeholder="이메일를 입력해 주세요" />
								<form:errors path="email" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label"></label> <span
									class="glyphicon glyphicon-phone" aria-hidden="true"></span>
								<form:input path="phone" type="text" class="form-control"
									name="phone" placeholder="휴대폰 번호를 입력해주세요" />
								<form:errors path="phone" cssClass="error" />
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-danger" data-dismiss="modal"
									value="취소" onclick="cancel();" /> 
								<input type="button" class="btn btn-lg btn-dark btn-block text-uppercase"
									value="수정" id="btnSubmit" />
								<input type="button" class="btn btn-danger"
									value="회원탈퇴" id="btnLeave" />
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 부트스트랩 스크립트 지우면 사망 -->
	<script src="./resources/js/jquery.min.js"></script>

	<script src="./resources/js/popper.min.js"></script>
	<script src="./resources/js/bootstrap.min.js"></script>
	<script src="./resources/js/slick.min.js"></script>
	<script src="./resources/js/jquery.mb.YTPlayer.min.js"></script>

	<script src="./resources/js/jquery.waypoints.min.js"></script>
	<script src="./resources/js/jquery.easing.1.3.js"></script>

	<script src="./resources/js/main.js"></script>
	<!-- 스크립트 모음 -->
</body>
</html>