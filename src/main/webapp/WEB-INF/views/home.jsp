<%@page import="com.andamiro.pos.model.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
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

<link rel="stylesheet" href="./resources/css/bootstrap/bootstrap.css">
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

<style>
#ImageSettings {
	max-width: 300px;
	max-height: 300px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function modal(index, id){
		$('#pwModal').modal('show');
		$('#Hidindex').val(index);
		$('#Hidid').val(id);
	}

	function goShop() {
		var form = "form" + $('#Hidindex').val();;

		$.ajax({
			type : "POST",
			url : "checkPw",
			data : {
				"id" : $('#Hidid').val(),
				"pw" : $('#pw').val()
			},
			success : function(data) {
				if ($.trim(data) == "YES") {
					$("#"+form).submit();
				} else {
					$('#pw').val('');
					alert("비밀번호를 다시 확인해 주세요!");
				}
			}
		});
		
	}
	
	function logout() {
		if (confirm("로그아웃 하시겠습니까?")) {
			location.href = "logout.do";
		} else {
			return;
		}
	}
</script>
</head>
<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">
	<header class="site-navbar js-sticky-header site-navbar-target"
		role="banner">
		<nav
			class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light"
			id="pb-navbar">
			<div class="container">
				<a href="main.do" class="navbar-brand">Andamiro</a>
				<button class="navbar-toggler ml-auto" type="button"
					data-toggle="collapse" data-target="#probootstrap-navbar"
					aria-controls="probootstrap-navbar" aria-expanded="false"
					aria-label="Toggle navigation">
					<span><i class="ion-navicon"></i></span>
				</button>
				<div class="collapse navbar-collapse" id="probootstrap-navbar">
					<ul class="navbar-nav ml-auto">
						<li><div class = "nav-link active" style = "color:white;">${user.getName()}님 안녕하세요!</div></li>
						<li class="nav-item"><a class="nav-link active"
							href="home.do">Home</a></li>
						<li><a href="mypage.do" class="nav-link">my page</a></li>
						<li class="nav-item"><a href="#" onclick="logout();"
							class="nav-link" id="logout">Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<section
		class="pb_cover_v3 overflow-hidden cover-bg-indigo cover-bg-opacity text-left pb_gradient_v1">

		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-md-6">
					<table>
					<c:forEach items="${list}" var="shop" varStatus="i">
						<c:choose>
							<c:when test="${i.index % 3 == 0}">
								<tr>
							</c:when>
						</c:choose>
						<td>
							<form action="settings.do?index=${i.index}" method="post"
								name="form${i.index}" id="form${i.index}" >
								<input type="hidden" value="${shop.id}" 
										name="shops[${i.index}].id"> 
								<input type="hidden" value="${shop.name}"
										name="shops[${i.index}].name"> 
								<input type="hidden" value="${shop.type}"
										name="shops[${i.index}].type"> 
								<input type="image" src="./resources/image/defualt.jpg" 
									width="150px" height="150px" 
									onclick="modal('${i.index}', '${shop.id}');return false;">
							</form>
							${shop.name}
					</c:forEach>
					</table>
				</div>

			</div>
		</div>
	</section>

	<div class="modal fade" id="pwModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">Login</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<form>
					<input type="hidden" id="Hidindex">
					<input type="hidden" id="Hidid">
					<div class="modal-body">
						<div class="form-group">
							<label for="message-text" class="control-label"></label> 
							<input type="password" class="form-control" name="pw" id="pw"
								placeholder="비밀번호를 입력해 주세요." required autofocus>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						<input class="btn btn-success" type="button" value="login" onclick="goShop()">
					</div>
				</form>


			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="bg- py-3 fixed-bottom">
		<div class="small text-center text-muted">Copyright &copy; 2019
			- Andamiro</div>
	</footer>
	<!-- END Footer -->

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