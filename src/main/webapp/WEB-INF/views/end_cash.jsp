<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>영업준비금 페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Free Bootstrap 4 Template by uicookies.com">
<meta name="keywords"
	content="Free website templates, Free bootstrap themes, Free template, Free bootstrap, Free website template">
<!-- 부트스트랩 -->
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

<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
	function logout() {
		if (confirm("로그아웃 하시겠습니까?")) {
			location.href = "logout.do";
		} else {
			return;
		}
	}
</script>

<style>
.exam {
	width: 50% !important;
}
</style>
</head>

<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">
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
					<li><div class="nav-link active" style="color: white;">${user.getName()}님
							안녕하세요!</div></li>
					<li class="nav-item"><a class="nav-link active" href="home.do">Home</a></li>
					<li><a href="mypage.do" class="nav-link">my page</a></li>
					<li class="nav-item"><a href="#" onclick="logout();"
						class="nav-link" id="logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div
		class="pb_cover_v3 overflow-hidden cover-bg-indigo cover-bg-opacity text-left pb_gradient_v1">
		<br>
		<hr>

		<div class="container">
			<div class="relative align-self-center" id="login">
				<div class="bg-white rounded pb_form_v1">
					<fieldset>
						<legend>마감정산</legend>
						<div style="width: 100%;">
							<table class="table table-bordered exam" style="float: left;">
								<tbody>
									<tr class="">
										<th class="align-middle w-10 bg-light text-center">50000</th>

										<td class="w-20 pl-4"><input type="text" id="am_50000"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_type1_price" name="fn_type1_price" value=""
											placeholder="" readonly="readonly"></td>
									</tr>
									<tr>
										<th class="align-middle w-10 bg-light text-center">10000</th>

										<td class="w-20 pl-4"><input type="text" id="am_10000"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_type2_price" name="fn_type2_price" value=""
											placeholder="" readonly="readonly"></td>
									</tr>
									<tr>
										<th class="align-middle w-10 bg-light text-center">5000</th>

										<td class="w-20 pl-4"><input type="text" id="am_5000"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_one_price" name="fn_one_price" value="" placeholder=""
											readonly="readonly"></td>
									</tr>
									<tr>
										<th class="align-middle w-10 bg-light text-center">1000</th>

										<td class="w-20 pl-4"><input type="text" id="am_1000"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_flw_price" name="fn_flw_price" value="" placeholder=""
											readonly="readonly"></td>
									</tr>
									<tr>
										<th class="align-middle w-10 bg-light text-center">500</th>

										<td class="w-20 pl-4"><input type="text" id="am_500"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_flag_price" name="fn_flag_price" value=""
											placeholder="" readonly="readonly"></td>
									</tr>
									<tr>
										<th class="align-middle w-10 bg-light text-center">100</th>

										<td class="w-20 pl-4"><input type="text" id="am_100"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_etc_price" name="fn_etc_price" value="" placeholder=""
											readonly="readonly"></td>
									</tr>
									<tr>

										<th class="align-middle w-10 bg-light text-center">50</th>

										<td class="w-20 pl-4"><input type="text" id="am_50"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_change_price" name="fn_change_price" value=""
											placeholder="" readonly="readonly"></td>
									</tr>
									<tr>

										<th class="align-middle w-10 bg-light text-center">10</th>

										<td class="w-20 pl-4"><input type="text" id="am_10"
											class="form-control num_select"></td>
										<td class="w-70 pl-4"><input type="text"
											class="form-control num_only num_comma num_sum"
											id="fn_change2_price" name="fn_change2_price" value=""
											placeholder="" readonly="readonly"></td>
									</tr>

								</tbody>
							</table>
							<table class="table table-bordered exam">
								<tbody>
									<tr>
										<th class="align-middle bg-light text-center p-2">합계</th>
										<td class="pl-4" colspan="2"><input type="text"
											class="form-control text-right font-weight-bold num_only num_comma num_sum"
											id="fn_total" name="fn_total" value="" placeholder=""
											readonly="readonly">
											<div id="han_money" class="text-right"></div></td>
									</tr>
								</tbody>
							</table>
							<br>

							<table>
								<thead>
									<tr>
										<td>마감관리자 :</td>
										<td><input type="text" class="form-control"
											style="width: 100px;" required autofocus></td>
									</tr>
								</thead>
							</table>
							<br>
							<div>
								<h3>Memo</h3>
								<textarea rows="10" cols="45" style="resize: none;"></textarea>
								<button type="button" class="btn btn-info"
									style="float: right; width: 100px; height: 100px;">확인</button>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>
	</div>

	<!-- 테이블 계산 스크립트 -->
	<script>
		// 테이블 자동계산
		$(function() {
			$('input.num_select').on('change', function() {
				var am_50000 = parseInt($("#am_50000").val() || 0);
				var am_10000 = parseInt($("#am_10000").val() || 0);
				var am_5000 = parseInt($("#am_5000").val() || 0);
				var am_1000 = parseInt($("#am_1000").val() || 0);
				var am_500 = parseInt($("#am_500").val() || 0);
				var am_100 = parseInt($("#am_100").val() || 0);
				var am_50 = parseInt($("#am_50").val() || 0);
				var am_10 = parseInt($("#am_10").val() || 0);

				var mul_50000 = (50000 * $('#am_50000').val());
				var mul_10000 = (10000 * $('#am_10000').val());
				var mul_5000 = (5000 * $('#am_5000').val());
				var mul_1000 = (1000 * $('#am_1000').val());
				var mul_500 = (500 * $('#am_500').val());
				var mul_100 = (100 * $('#am_100').val());
				var mul_50 = (50 * $('#am_50').val());
				var mul_10 = (10 * $('#am_10').val());

				$("#fn_type1_price").val(mul_50000);
				$("#fn_type2_price").val(mul_10000);
				$("#fn_one_price").val(mul_5000);
				$("#fn_flw_price").val(mul_1000);
				$("#fn_flag_price").val(mul_500);
				$("#fn_etc_price").val(mul_100);
				$("#fn_change_price").val(mul_50);
				$("#fn_change2_price").val(mul_10);
			}).on(
					'change',
					function() {
						var cnt = $(".exam input.num_sum").length;
						console.log(cnt);

						for (var i = 1; i < cnt; i++) {
							var sum = parseInt($(this).val() || 0);
							sum++
							console.log(sum);
						}

						var sum1 = parseInt($("#fn_type1_price").val() || 0); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
						var sum2 = parseInt($("#fn_type2_price").val() || 0);
						var sum3 = parseInt($("#fn_one_price").val() || 0);
						var sum4 = parseInt($("#fn_flw_price").val() || 0);
						var sum5 = parseInt($("#fn_flag_price").val() || 0);
						var sum6 = parseInt($("#fn_etc_price").val() || 0);
						var sum7 = parseInt($("#fn_change_price").val() || 0);
						var sum8 = parseInt($("#fn_change2_price").val() || 0);

						var sum = sum1 + sum2 + sum3 + sum4 + sum5 + sum6
								+ sum7 + sum8;
						console.log(sum);
						$("#fn_total").val(sum);
					});
		});
	</script>
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