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
	
	$(document).ready(function() {
		$("#lblDisplay").empty();
		//해당 아이디를 클리어 한다.
		var strHtml;
		//해당 변수는 다음 링크를 가져 옵니다.
		$("#lblDisplay").append(strHtml);
		//해당 아이디에 해당 변수의 링크를 부여 합니다.
		$("#btnCreate").click(function() {
			//해당 아이디를 클릭 하면 다음 메서드를 실행 합니다.
			$("#lblTable").empty();
			$('#nxtTable').empty();
			//해당 아이디를 초기화 해 두고
			var row = $("#row").val();
			var col = $("#col").val();
			var floor = $("#floor").val();
			var strTable = "";
			if(floor == "" || floor == "0"){
				floor = 1;
				$("#floor").val("1");
			}
			for(var x=0; x<floor; x++){
				strTable += '<h1>' + (x+1) + '층</h1>';
				strTable += "<table>";
				//테이블 보더 값
				for (var i = 0; i < row; i++) {
					//i는 row변수 보다 작게 반복 한다.
					strTable += "<tr>";
					//tr테그를 계속 만든다.
					for (var j = 0; j < col; j++) {
						//j는 col변수 보다 작게 반복 한다.
						strTable += "<td>"
								+ "<input type='button' class='btn btn-info' value='0' "
								+ "onclick='clk(" + String(i) + "," + String(j) + "," + String(x) + ");' id='" + String(i) + String(j) + String(x) +"'>";
					}
				}
				strTable += "</table>";
				strTable += "<hr>";
			}
			//</table>로 마무리        
			$("#lblTable").append(strTable);
			$('#nxtTable').append('<input type="button" class="btn btn-info" id="plusbtn" value="+"/>');
			$('#nxtTable').append('<input type="button" class="btn btn-info" id="minusbtn" value="-"/>');
			$('#nxtTable').append('<input type="hidden" id="hidtable" value="+"/>');
			$('#nxtTable').append('<p id="hidp">' + $('#hidtable').val() + '</p>');
			
			$('#plusbtn').click(function(){
				$('#hidtable').val('+');
				$('#hidp').text($('#hidtable').val());
			});
			
			$('#minusbtn').click(function(){
				$('#hidtable').val('-');
				$('#hidp').text($('#hidtable').val());
			});
			
		});
	});
	
	function clk(i, j , x){
		if($('#hidtable').val() == '+'){
			$('#' + i + j + x).val(parseInt($('#' + i + j + x).val()) + 1);
		}else{
			if(parseInt($('#' + i + j + x).val()) != 0)
				$('#' + i + j + x).val(parseInt($('#' + i + j + x).val()) - 1);
		}
		
			/*
		$('[src="./resources/image/4.png"]').each(function(index,item){
			//$(item).attr('id');
		});*/
	}
</script>
</head>

<body data-spy="scroll" data-target="#pb-navbar" data-offset="200">
	<nav class="navbar navbar-expand-lg navbar-dark pb_navbar pb_scrolled-light"
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
				<div class="bg-white rounded pb_form_v1" style = "height:600px;overflow:auto;">
					<fieldset>
						<legend>테이블 세팅</legend>
						<!--동적으로 태그 추가 -->
						<input type="text" id="row" style="width: 50px;" placeholder="행"/> * 
						<input type="text" id="col" style="width: 50px;" placeholder="열" /> 
						<input type="text" id="floor" style="width: 50px;" placeholder="층" />
						<input type="button" class="btn btn-info" id="btnCreate" value="자리 생성" />
						<!-- 버튼 아이디만 변경 o 위에 id변경x -->
						<button type="button" class="btn btn-info"
							style="float: right; width: 100px; height: 50px;">확인</button>
						<div id="nxtTable"></div>
						<div id="lblTable" class="bg-white rounded pb_form_v1" style = "height:600px; overflow:auto;"></div>
					</fieldset>
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