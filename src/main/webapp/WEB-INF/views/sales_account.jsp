<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>매출확인</title>

  <!-- Custom fonts for this template-->
  <link href="./resources2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="./resources2/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="./resources2/css/sb-admin.css" rel="stylesheet">
  <script>
     var SumCard=0, SumCash=0, SumAll=0;
  </script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script> 
	function dis(){
		//document.getElementById("test").style.display = "none";	
		document.getElementById("chart_div").style.display = "block";
	}
  </script> 
    
</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href='main.do'>Andamiro</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    

    <!-- Navbar -->
    

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>Pages</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">페이지 이동</h6>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href='order.do'>주문관리</a>
          <a class="dropdown-item" href='open_cash.do'>영업준비금</a>
          <a class="dropdown-item" href='table_settings.do'>테이블 관리</a>
          <a class="dropdown-item" href='end_cash.do'>마감관리</a>
          <a class="dropdown-item" href='menu_settings.do'>메뉴관리</a>
        </div>
      </li>
      
    </ul>

    <div id="content-wrapper">

      <div class="container-fluid">
      <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);
      
      var num=1;
      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', '매출'],
          ['1월',  16000],
          ['2월',  26500],
          ['3월',  25000],
          ['4월',  27000],
          ['5월',  11500],
          ['6월',  23500],
          ['7월',  17000],
          ['8월',  3000],
          ['9월',  18000],
          ['10월',  8500],
          ['11월',  14000],
          ['12월',  29500]
          
        ]);
       
        var options = {
          title : '단위 : 원',
          vAxis: {title: 'sales'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
        
        <!-- Breadcrumbs-->
        <!-- Icon Cards-->
        
        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            	매출표</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>날짜</th>
                    <th>카테고리</th>
                    <th>메뉴</th>
                    <th>현금</th>
                    <th>카드</th>
                    <th>합계</th>
                  </tr>
                </thead>
                
                <tbody>
				<c:forEach items="${replies}" var="dto">
					<tr>
						<td>${dto.duedate}</td>
						<td>${dto.menu}</td>
						<td>${dto.item}</td>
						<td>${dto.cash}<script>SumCash += ${dto.cash};</script></td>
						<td>${dto.card}<script>SumCard += ${dto.card};</script></td>
						<td>${dto.card+dto.cash}<script>SumAll += ${dto.card+dto.cash};</script></td>
					</tr>
				</c:forEach>
                  
                </tbody>
                <tfoot>
                  <tr>
                    <th>합계</th>
                    <th>-</th>
                    <th>-</th>
                    <th><script>document.write(SumCash);</script></th>
                    <th><script>document.write(SumCard);</script></th>
                    <th><script>document.write(SumAll);</script></th>
                  </tr>
                  <script>
			         SumCard=0, SumCash=0, SumAll=0;
			      </script>
                </tfoot>
              </table>
            </div>
          </div>
        </div>

      </div>
      &nbsp&nbsp&nbsp&nbsp&nbsp
      <button class="btn btn-primary" type="button" onclick='dis()'>차트보기
      </button>
      <br><br>
      <!--  Area Chart Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            	매출 차트
            	</div>
          <div class="card-body">
          	<!-- <div id="chart_div" style="width: 100%; height: 500px;"></div> -->
          </div>
          
        </div>
          
        
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="./resources2/vendor/jquery/jquery.min.js"></script>
  <script src="./resources2/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="./resources2/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="./resources2/vendor/chart.js/Chart.min.js"></script>
  <script src="./resources2/vendor/datatables/jquery.dataTables.js"></script>
  <script src="./resources2/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="./resources2/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="./resources2/js/demo/datatables-demo.js"></script>
  <script src="./resources2/js/demo/chart-area-demo.js"></script>

</body>

</html>