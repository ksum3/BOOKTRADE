<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
	InhaTechnicalColleage - 도서 대여 사이트
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="./assets/css/now-ui-kit.css?v=1.2.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="./assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="login-page sidebar-collapse">
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
		<div class="container">

			<div class="navbar-translate"></div>
			<div class="collapse navbar-collapse justify-content-end"
				id="navigation" data-nav-image="./assets/img/blurred-image-1.jpg">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="./index.jsp">Back
							to FirstPage</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="Follow us on Twitter" data-placement="bottom"
						href="https://twitter.com/CreativeTim" target="_blank"> <i
							class="fab fa-twitter"></i>
							<p class="d-lg-none d-xl-none">Twitter</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="Like us on Facebook" data-placement="bottom"
						href="https://www.facebook.com/CreativeTim" target="_blank"> <i
							class="fab fa-facebook-square"></i>
							<p class="d-lg-none d-xl-none">Facebook</p>
					</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="Follow us on Instagram" data-placement="bottom"
						href="https://www.instagram.com/CreativeTimOfficial"
						target="_blank"> <i class="fab fa-instagram"></i>
							<p class="d-lg-none d-xl-none">Instagram</p>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- End Navbar -->
	<div class="page-header clear-filter" filter-color="blue">
		<div class="page-header-image"
			style="background-image: url(./assets/img/bookmarket.jpg)"></div>
		<div class="content">
			<div class="container">
				<div class="col-md-4 ml-auto mr-auto">
					<div class="card card-login card-plain">
						<form class="form" method="post" action="./logincheck.jsp">
							<div class="card-header text-center">
								<div class="logo-container">
									<img src="./assets/img/now-logo.png" alt="">
								</div>
							</div>
							<div class="card-body">
								<div class="input-group no-border input-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="now-ui-icons users_circle-08"></i>
										</span>
									</div>
									<input type="text" class="form-control" placeholder="ID" name="_id">
								</div>
								<div class="input-group no-border input-lg">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="now-ui-icons text_caps-small"></i>
										</span>
									</div>
									<input type="password" placeholder="PASSWORD" class="form-control" name="_pw" />
								</div>
							</div>
							<div class="card-footer text-center">
								<input type="submit"
									class="btn btn-primary btn-round btn-lg btn-block"
									value="Get Started">
								<div class="center">
									<h6>
										<a href="loginpage-create.jsp" class="link">Create Account</a>
									</h6>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer"> </footer>
	</div>
	<!--   Core JS Files   -->
	<script src="./assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="./assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="./assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
	<script src="./assets/js/plugins/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
	<script src="./assets/js/now-ui-kit.js?v=1.2.0" type="text/javascript"></script>
</body>

</html>