<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>InhaTechnicalColleage - 도서 대여 사이트</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="./assets/css/now-ui-kit.css?v=1.2.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="./assets/demo/demo.css" rel="stylesheet" />
</head>
<body class="landing-page sidebar-collapse">
	<%
		String person_id = (String) session.getAttribute("__id");
		if (person_id==null) {
	%>
	<script language=javascript>
		self.window.alert("로그인이 필요한 페이지입니다.");
		location.href = "loginpage-login.jsp";
	</script>
	<%
		} else {
	%>
	<!-- Navbar -->
	<nav
		class="navbar navbar-expand-lg bg-primary fixed-top navbar-transparent "
		color-on-scroll="400">
	<div class="container">
		<div class="dropdown button-dropdown">
			<a href="#pablo" class="dropdown-toggle" id="navbarDropdown"
				data-toggle="dropdown"> <span class="button-bar"></span> <span
				class="button-bar"></span> <span class="button-bar"></span>
			</a>
			<%
				if (person_id.equals("root")) {
			%>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item" href="./logout.jsp">로그아웃</a>
			</div>
			<%
				} else {
			%>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-header">마이 페이지</a> <a class="dropdown-item"
					href="mypage-system.jsp">내 책 관리</a> <a class="dropdown-item" href="mypage-main.jsp">내
					정보 관리</a> <a class="dropdown-item" href="mypage-mytrade.jsp">내 거래 내역</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="./logout.jsp">로그아웃</a>
			</div>
			<%
				}
			%>
		</div>
		<div class="navbar-translate">
			<a class="navbar-brand" href="./mypage-main.jsp" rel="tooltip"
				data-placement="bottom" target="_parent"> Welcome, <%=person_id%>!
			</a>
			<button class="navbar-toggler navbar-toggler" type="button"
				data-toggle="collapse" data-target="#navigation"
				aria-controls="navigation-index" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-bar top-bar"></span> <span
					class="navbar-toggler-bar middle-bar"></span> <span
					class="navbar-toggler-bar bottom-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse justify-content-end"
			id="navigation" data-nav-image="./assets/img/blurred-image-1.jpg">
			<ul class="navbar-nav">
				<%
					if (person_id.equals("root")) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="./adminpage-main.jsp">관리자 페이지</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link"
					href="./booksearch-main.jsp">책 대여 신청</a></li>
				<%
					}
				%>
				<li class="nav-item"><a class="nav-link" href="./index.jsp">Back
						to FirstPage</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- End Navbar -->
	<div class="wrapper">
		<div class="page-header page-header-small">
			<div class="page-header-image" data-parallax="true"
				style="background-image: url('./assets/img/bookmarket.jpg');">
			</div>
			<div class="content-center">
				<div class="container">
					<h1 class="title">도서 대여 사이트</h1>
					<div class="text-center">
						<a href="https://www.facebook.com/happyinhatc/"
							class="btn btn-primary btn-icon btn-round"> <i
							class="fab fa-facebook-square"></i>
						</a> <a href="#pablo" class="btn btn-primary btn-icon btn-round">
							<i class="fab fa-twitter"></i>
						</a> <a href="#pablo" class="btn btn-primary btn-icon btn-round">
							<i class="fab fa-google-plus"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="section section-about-us">
			<div class="container">
				<div class="row">
					<div class="col-md-8 ml-auto mr-auto text-center">
						<h2 class="title">공지사항</h2>
						<h5>인하공업 전문대학 학생들을 위한 책 대여 사이트 입니다.</h5>
						<h5 class="description">책 대여 신청>원하는 책 선택>기간선택 을 통해 책 대여를 신청 할 수 있습니다.</h5>
						<h6 class="description">단, 책 신청 후 일주일 이내로 보증금을 납부해주셔야 책 제공 당사자와 거래를 시작 하실 수 있습니다.</h6>
					</div>
				</div>
			</div>
		</div>
		<div class="section section-team text-center">
      <div class="container">
        <h2 class="title">Here is our team</h2>
        <div class="team">
          <div class="row">
            <div class="col-md-4">
              <div class="team-player">
                <h4 class="title">김수민</h4>
                <p class="category text-primary">201745044</p>
                <p class="description">컴퓨터 시스템과 2학년 B반</p>
                
              </div>
            </div>
            <div class="col-md-4">
              <div class="team-player">
                <h4 class="title">김현아</h4>
                <p class="category text-primary">201745047</p>
                <p class="description">컴퓨터 시스템과 2학년 B반</p>

                
              </div>
            </div>
            <div class="col-md-4">
              <div class="team-player">
                <h4 class="title">김세은</h4>
                <p class="category text-primary">201645078</p>
                <p class="description">컴퓨터 시스템과 2학년 B반</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	</div>
	<footer class="footer footer-default"> </footer>
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
	<%
		}
	%>
</body>
</html>