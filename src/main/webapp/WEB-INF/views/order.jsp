<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
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
	href="./resources/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="./resources/css/slick.css">
<link rel="stylesheet" href="./resources/css/slick-theme.css">
<link rel="stylesheet" href="./resources/css/helpers.css">
<link rel="stylesheet" href="./resources/css/style.css">
<link rel="stylesheet" href="./resources/css/landing-2.css">
<link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
<link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css">

<style>
.menu_service {
	width: 80px;
	height: 60px;
	margin-right: 10px;
	font-size: 16px;
	border: 2px solid rgb(137, 201, 244);
	background-color: rgb(137, 201, 244);
	color: white;
}

.menu_service2 {
	width: 80px;
	height: 60px;
	margin-right: 10px;
	font-size: 16px;
	border: 2px solid rgb(0, 120, 240, 0.2);
	background-color: rgb(0, 120, 240, 0.4);
	color: white;
}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


<script type="text/javascript">
	var flag = true;
	var totalFlag = true;
	var flag2 = 0;
	var flag3 = 0;
	
	var col_kor = [
        { title: "No." },
        { title: "메뉴" },
        { title: "가격" },
        { title: "수량" },
        { title: "비고" }
    ];
	
	var lang_kor = {
	        "emptyTable" : "주문한 메뉴가 없습니다.",
	        "loadingRecords" : "로딩중...",
	        "processing" : "처리중...",
	        "aria" : {
	            "sortAscending" : " :  오름차순 정렬",
	            "sortDescending" : " :  내림차순 정렬"
	        }
	    };
	
	$(function() {
		table = $('#orderList').DataTable({
            columns: col_kor,
            language : lang_kor,
            paging: false,
            searching: false,
            select: {
                style: 'single'
            },
            info: false,
            infoEmpty: false,
            scrollY: 250
		});
		
		$('#orderList tbody').on( 'click', 'tr', function () {
		  $('#orderList tbody tr').css('background', '');
		  $(this).css('background', 'white');
		});

		$('#1').attr('class', 'tab-pane active');

		$('#myTab a').click(function() {
			var tabid = $(this).attr('href');
			$('.tab-content .active').attr('class', 'tab-pane');
			$('#' + tabid.substr(1, 1)).attr('class', 'tab-pane active');
		});

		$('#allcancle').click(function(){
			var result = confirm("모든 메뉴를 취소 하시겠습니까?");
			if(result){
				for(var i=0; i < table.rows().count(); i++){
					table.cell( i, 3 ).data(0).draw();
					table.cell( i, 4 ).data('취소됨').draw();
				}
				$('#total').val('0');
				$('#pay').val('0');
			}else{
				
			}
		});
		
		$('#rowcancle').click(function(){
			var result = confirm("선택한 메뉴를 취소 하시겠습니까?");
			if(result){
				var canclecash = $('#orderList tbody tr[style*="background"] > td:eq(2)').text() * $('#orderList tbody tr[style*="background"] > td:eq(3)').text();
				if(table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data() != '서비스'){
					table.cell( $('#orderList tbody tr[style*="background"]'), 3 ).data(0).draw();
					table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data('취소됨').draw();
				}else{
					table.cell( $('#orderList tbody tr[style*="background"]'), 3 ).data(0).draw();
					table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data('취소됨').draw();
				}
				calc();
			}else{
				
			}
		});
		
		$('#servicebtn').click(function(){
			if(table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data() != '서비스'){
				table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data('서비스').draw();
			}else{
				table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data('').draw();
			}
			calc();
		});
		
		$('#delivery').click(function(){
			table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data('포장').draw();
		});
		
		$('#minusbtn').click(function(){
			var itemamount = parseInt(table.cell( $('#orderList tbody tr[style*="background"]'), 3 ).data());
			
			if(itemamount > 0){
				table.cell( $('#orderList tbody tr[style*="background"]'), 3 ).data(itemamount - 1).draw();
			}
			
			if(itemamount-1 == 0){
				table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data('취소됨').draw();
			}
			calc();
		});
		
		$('#plusbtn').click(function(){
			var itemamount = parseInt(table.cell( $('#orderList tbody tr[style*="background"]'), 3 ).data());
			if(table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data() == '취소됨'){
				table.cell( $('#orderList tbody tr[style*="background"]'), 4 ).data('').draw();
			}
			table.cell( $('#orderList tbody tr[style*="background"]'), 3 ).data(itemamount + 1).draw();
			calc();
		});
		
		$('#downbtn').click(function(){
			var itemamount = parseInt(table.cell( $('#orderList tbody tr[style*="background"]'), 0 ).data());
			table.cell( itemamount, 0 ).data(itemamount).draw();
			table.cell( $('#orderList tbody tr[style*="background"]'), 0 ).data(itemamount + 1).draw();
		});
		
		$('#upbtn').click(function(){
			var itemamount = parseInt(table.cell( $('#orderList tbody tr[style*="background"]'), 0 ).data());
			table.cell( itemamount-2, 0 ).data(itemamount).draw();
			table.cell( $('#orderList tbody tr[style*="background"]'), 0 ).data(itemamount - 1).draw();
		});
		
	});
	
	function calc(){
		total = 0;
		service = 0;
		for(var i=0; i < table.rows().count(); i++){
			if(table.cell( i, 4 ).data() != '취소됨'){
				total += parseInt(table.cell( i, 2 ).data()) * parseInt(table.cell( i, 3 ).data());
			}
			
			if(table.cell( i, 4 ).data() == '서비스'){
				service += parseInt(table.cell( i, 2 ).data()) * parseInt(table.cell( i, 3 ).data());
			}
		}
		$('#total').val(total);
		$('#discount').val(service);
		$('#pay').val(total - service);
	}

	function rowAdd(item, price) {
		var menu = $('#menu_show td').text();
		var cash = parseInt($('#total').val());
		
		if(table.rows().count() !== 0){
			for(var i=0; i < table.rows().count(); i++){
				if(table.cell( i, 1 ).data() == item){
					if(table.cell( i, 4 ).data() == '서비스'){
						var count = 0;
						for(var j=0; j < table.rows().count(); j++){
							if(table.cell( i, 4 ).data() == '서비스'){
								count++;
							}
						}
						if(count > 1){
							if(table.cell( i, 4 ).data() != '서비스'){
								var amont = parseInt(table.cell( i, 3 ).data()) + 1;
								
								table.cell( i, 3 ).data(amont).draw();
								table.cell( i, 4 ).data('').draw();
								
								$('#total').val(cash + parseInt(price));
								break;
							}
						}else{
							table.row.add( [
								table.rows().count() + 1,
							    item,
							    price,
							    "1",
							    ""
							] ).draw();
							break;
						}
					}else{
						var amont = parseInt(table.cell( i, 3 ).data()) + 1;
						
						table.cell( i, 3 ).data(amont).draw();
						table.cell( i, 4 ).data('').draw();
						
						$('#total').val(cash + parseInt(price));
						break;
					}
				}else if (i == table.rows().count() - 1){
					table.row.add( [
						table.rows().count() + 1,
					    item,
					    price,
					    "1",
					    ""
					] ).draw();
					$('#total').val(cash + parseInt(price));
					break;
				}
			}
		}else{
			table.row.add( [
				table.rows().count() + 1,
			    item,
			    price,
			    "1",
			    ""
			] ).draw();
			$('#total').val(price);
		}
		
		$('#pay').val(parseInt($('#total').val()) - parseInt($('#discount').val()) - parseInt($('#paid').val()));
	}

	function logout() {
		if (confirm("로그아웃 하시겠습니까?")) {
			location.href = "logout.do";
		} else {
			return;
		}
	}

</script>
<script>
        function add(char) {
            var display = document.getElementById('paid'); // 우리가 식을 입력할 input 태그를 불러옵니다.
            // display.value는 input 태그 안에 들어 있는 값을 의미합니다.
            display.value = display.value + char;
            // display.value += char; 로 쓸 수도 있습니다.
            // input 태그의 값 뒤에 char 문자를 추가해 주는 역할을 합니다.
        }
        function calculate() {
            var display = document.getElementById('paid');
            var result = eval(display.value); // 식을 계산하고 result 변수에 저장합니다.
            document.getElementById('result').value = result;
        }
        function reset() {
            document.getElementById('paid').value = "";
            document.getElementById('result').value = "";
        }
</script>
<script>
    var numberClicked = false; // 전역 변수로 numberClicked를 설정
    function add (char) {
        if(numberClicked == false) { // 만약 이전에 연산자를 입력 했는데,
            if(isNaN(char) == true) { // 입력 받은 값이 또 다시 연산자면,
                // 아무것도 하지 않는다.
            } else { // 연산자가 아니라면!
                document.getElementById('paid').value += char; // 식 뒤에 값을 추가한다.
            }
        } else { // 만약에 이전에 숫자를 입력 했으면,
            document.getElementById('paid').value += char; // 식 뒤에 값을 추가한다.
        }
 
 
        // 다음 입력을 위해 이번 입력에 숫자가 눌렸는지 연산자가 눌렸는지 설정한다.
        if(isNaN(char) == true) { // "만약 숫자가 아닌게 참이라면" = "연산자를 눌렀다면"
            numberClicked = false; // numberClicked를 false로 설정한다.
        } else {
            numberClicked = true; // numberClicked를 true로 설정한다.
        }
    }
    function calculate() {
        
    }
    function reset() {
        
    }
</script>

<script>
function add2(char) {
    var display = document.getElementById('Input_Price'); // 우리가 식을 입력할 input 태그를 불러옵니다.
  
    // display.value는 input 태그 안에 들어 있는 값을 의미합니다.
    display.value = display.value + char;
    
    // display.value += char; 로 쓸 수도 있습니다.
    // input 태그의 값 뒤에 char 문자를 추가해 주는 역할을 합니다.
}
function reset2() {
    document.getElementById('Input_Price').value = "";
    document.getElementById('phoneNumber').value = "";
    document.getElementById('result').value = "";
}
</script>

<script>
// 테이블 자동계산
$(function() {
	$('input.num_select').on('change', function() {
		var sub_cash = parseInt($("#sub_cash").val() || 0);
		var sub_count = parseInt($("#sub_count").val() || 0);
		
		$("#sub_cash").val(sub_cash);
		$("#sub_count").val(sub_count);
		
		var result = sub_cash/sub_count;
		
		$("#fn_total").val(result);
		});
	});
</script>

<script>
// 테이블 자동계산
$(function() {
	$('input.num_select').on('change', function() {
		var modal_totalcash = parseInt($("#modal_totalcash").val() || 0);
		var modal_price = parseInt($("#modal_price").val() || 0);
		
		$("#modal_totalcash").val(modal_totalcash);
		$("#modal_price").val(modal_price);
		
		var result = modal_totalcash-modal_price;
		
		$("#result_cash").val(result);
		});
	});
</script>
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

	<!-- 이거 안에 무적권  -->
	<div
		class="pb_cover_v3 overflow-hidden cover-bg-indigo cover-bg-opacity text-left pb_gradient_v1">

		<br>
		<hr>

		<!-- 전체 컨테이너 -->
		<div class="container"
			style="float: left; width: 50%; text-align: center;">

			<!-- 비율 1:1 왼쪽 -->
			<section style="text-align: center;">

				<!-- table -->
				<div style="width: 100%">
					<table class="table table-bordered dataTable" id="orderList"
						width="50%" cellspacing="0" role="grid"
						aria-describedby="dataTable_info;">
						<colgroup>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
						</colgroup>
						<thead>

						</thead>

						<tbody id="menu_show">

						</tbody>
					</table>
				</div>


				<div style="width: 100%;">
					<table>
						<colgroup>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
							<col style="width: *%"></col>
						</colgroup>
						<tbody>
							<tr>
								<td>
									<button type="button" class="menu_service" id="allcancle">전체취소</button>
								</td>
								<td>
									<button type="button" class="menu_service" id="rowcancle">한줄취소</button>
								</td>
								<td>
									<button type="button" class="menu_service" id="servicebtn">서비스</button>
								</td>
								<td>
									<button type="button" class="menu_service" id="delivery">포장</button>
								</td>
								<td>
									<button type="button" class="menu_service" id="minusbtn">-</button>
								</td>
								<td>
									<button type="button" class="menu_service" id="plusbtn">+</button>
								</td>
								<td>
									<button type="button" class="menu_service" id="downbtn">▽</button>
								</td>
								<td>
									<button type="button" class="menu_service" id="upbtn">△</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<br>
				<!-- section 하단 -->
				<div style="float: left; width: 50%; align: center;">
					<div style="float: left; text-align: center;">
						<div class="nav-link" style="color: white;">총금액</div>
						<br>
						<div class="nav-link" style="color: white;">할인 금액</div>
						<br>
						<div class="nav-link" style="color: white;">받을 금액</div>
						<br>
						<div class="nav-link" style="color: white;">받은 금액</div>
						<br>
					</div>

					<div style="float: right; width: 50%; text-align: center;">
						<input type="text" id="total" name="total" class="form-control" required autofocus readonly value=0> <br> 
						<input type="text" id="discount" name="discount" class="form-control" required autofocus readonly value=0> <br> 
						<input type="text" id="pay" name="pay" class="form-control" required autofocus readonly value=0> <br> 
						<input type="text" id="paid" name="paid" class="form-control" required autofocus readonly> <br>
					</div>
				</div>

				<div style="float: right; width: 50%;">

					<table class="table table-bordered">
						<tr>
							<td onclick="add(7)" class="menu_service2">7</td>
							<td onclick="add(8)" class="menu_service2">8</td>
							<td onclick="add(9)" class="menu_service2">9</td>
						</tr>
						<tr>
							<td onclick="add(4)" class="menu_service2">4</td>
							<td onclick="add(5)" class="menu_service2">5</td>
							<td onclick="add(6)" class="menu_service2">6</td>
						</tr>
						<tr>
							<td onclick="add(1)" class="menu_service2">1</td>
							<td onclick="add(2)" class="menu_service2">2</td>
							<td onclick="add(3)" class="menu_service2">3</td>
						</tr>
						<tr>
							<td colspan="2" onclick="add(0)" class="menu_service2">0</td>
							<td onclick="reset()" class="menu_service2">AC</td>
						</tr>
					</table>

				</div>
			</section>
		</div>

		<div class="container"
			style="float: right; width: 50%; text-align: center;">
			<section style="float: left; width: 100%; text-align: center;">
				<article style="clear: both;">
					<div role="tabpanel">
						<ul class="nav nav-pills" role="tablist" id="myTab">
							<c:forEach items="${category}" var="category" varStatus="i">
								<li class="presentation"><a aria-controls="${category.id}"
									role="tab" data-toggle="tab" href="#${category.id}">${category.name}</a>
								</li>
							</c:forEach>
						</ul>

						<!-- 탭 누르면 바뀜 -->
						<div class="tab-content">
							<c:forEach items="${category}" var="category" varStatus="i">
								<c:set var="x" value="0" />
								<div role="tabpanel" class="tab-pane" id="${category.id}">
									<table class="table table-bordered dataTable" id="menubtn"
										style="width: 100%; height: 80%;" cellspacing="0" role="grid">
										<colgroup>
											<col style="width: 20%"></col>
											<col style="width: 20%"></col>
											<col style="width: 20%"></col>
											<col style="width: 20%"></col>
											<col style="width: 20%"></col>
										</colgroup>
										<thead>
											<tr style="border-collapse: collapse;">
												<c:forEach items="${menu}" var="menu" varStatus="j">
													<c:if test="${x%5 == 0}">
														<tr>
													</c:if>
													<c:if test="${category.id == menu.category_id}">
														<c:set var="x" value="${x + 1}" />
													</c:if>

													<c:if test="${category.id == menu.category_id}">
														<th><button type="button" class="btn btn-default"
																id="addbtn" name="addbtn"
																onclick="rowAdd('${menu.item}', '${menu.price}');">${menu.item}</button></th>
													</c:if>
												</c:forEach>
										</thead>
									</table>
								</div>
							</c:forEach>

						</div>
					</div>
				</article>

				<div style="width: 100%;">
					<div style="float: left; margin-right: 10px; text-align: center;">
						<button type="button" class="btn btn-success"
							style="width: 150px; height: 210px;">주문</button>
					</div>

					<div style="float: left; margin-right: 10px; text-align: center;">
						<button type="button" class="btn btn-success"
							style="width: 150px; height: 100px; margin-bottom: 10px;">영수증
							관리</button>
						<br>

						<button type="button" class="btn btn-success"
							style="width: 150px; height: 100px; margin-bottom: 10px;">중간
							계산서</button>
					</div>

					<div style="float: left; margin-right: 10px; text-align: center;">
						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#card_payment" data-whatever="@mdo"
							style="width: 150px; height: 210px;">카드</button>
					</div>
					<div style="float: left; margin-right: 10px; text-align: center;">

						<button type="button" class="btn btn-warning" data-toggle="modal"
							data-target="#cash_payment" data-whatever="@mdo"
							style="width: 150px; height: 210px;">현금</button>
					</div>

					<div style="float: left; margin-right: 10px; text-align: center;">
						<table class="table table-bordered">
							<thead>
								<tr class="">
									<th class="align-middle w-10 bg-light text-center">더치페이</th>

									<td class="w-20 pl-4"><input type="text" id="sub_cash"
										class="form-control num_select">원</td>
									<td class="w-20 pl-4"><input type="text" id="sub_count"
										class="form-control num_select">명</td>
								</tr>
								<tr class="">
									<th class="align-middle w-10 bg-light text-center">합계</th>
									<td class="pl-4" colspan="2"><input type="text"
										class="form-control text-right font-weight-bold num_only num_comma num_sum"
										id="fn_total" name="fn_total" value="" placeholder=""
										readonly="readonly">
										<div id="han_money" class="text-right"></div></td>
								</tr>
							</thead>
						</table>

					</div>
				</div>
			</section>
		</div>
	</div>

	<!-- 모달창 -->
	<div class="modal fade" id="card_payment" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">카드 결제하기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">IC카드를 넣어주세요</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-success">결제하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 현금 모달창 -->
	<div class="modal fade" id="cash_payment" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		style="text-align: center;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">현금 결제하기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<div class="form-group form-group-sm">
							<label>총금액</label>
							<div class="col-sm-10">
								<input type="text" id="modal_totalcash"
									class="form-control num_select">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label>받은 금액</label>
							<div class="col-sm-10" id="pay">
								<input class="form-control" type="text" id="modal_price">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<label>결제금액</label>
							<div class="col-sm-10">
								<input type="text" id="result_cash"
									class="form-control num_select">
							</div>
						</div>
						<div class="form-group form-group-sm">
							<button type="button" class="btn btn-success">개인 소득공재용</button>
							<button type="button" class="btn btn-success">사업자 소득공재용</button>
						</div>
				</div>
				<table class="table table-bordered">
					<tr>
						<td onclick="add2(7)" class="menu_service2">7</td>
						<td onclick="add2(8)" class="menu_service2">8</td>
						<td onclick="add2(9)" class="menu_service2">9</td>
					</tr>
					<tr>
						<td onclick="add2(4)" class="menu_service2">4</td>
						<td onclick="add2(5)" class="menu_service2">5</td>
						<td onclick="add2(6)" class="menu_service2">6</td>
					</tr>
					<tr>
						<td onclick="add2(1)" class="menu_service2">1</td>
						<td onclick="add2(2)" class="menu_service2">2</td>
						<td onclick="add2(3)" class="menu_service2">3</td>
					</tr>
					<tr>
						<td colspan="2" onclick="add2(0)" class="menu_service2">0</td>
						<td onclick="reset2()" class="menu_service2">AC</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-success">결제하기</button>
			</div>
		</div>
	</div>
	</div>
	<!-- Footer -->
	<footer>
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
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
	<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
	<!-- 스크립트 모음 -->
</body>
</html>