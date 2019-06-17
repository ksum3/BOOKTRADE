<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
</head>
<body>
	<%
		String person_id = (String) session.getAttribute("__id");
		if (person_id == null) {
	%>
	<script language=javascript>
		self.window.alert("로그인이 필요한 페이지입니다.");
		location.href = "loginpage-login.jsp";
	</script>
	<%
		} else {
	%>
	<header class="navbar navbar-expand-lg bg-primary">
	<div class="container">
		<div class="dropdown button-dropdown">
			<a href="#pablo" class="dropdown-toggle" id="navbarDropdown"
				data-toggle="dropdown"> <span class="button-bar"></span> <span
				class="button-bar"></span> <span class="button-bar"></span>
			</a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-header">마이 페이지</a> <a class="dropdown-item"
					href="mypage-system.jsp">내 책 관리</a> <a class="dropdown-item"
					href="mypage-main.jsp">내 정보 관리</a> <a class="dropdown-item"
					href="mypage-mytrade.jsp">내 거래 내역</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="./logout.jsp">로그아웃</a>
			</div>
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
				<li class="nav-item active"><a class="nav-link"
					href="./booksearch-main.jsp">책 대여 신청<span class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link"
					href="./mainpage-main.jsp">Home</a></li>
			</ul>
		</div>
	</div>
	</header>

	<%
		String book_info_Id = request.getParameter("book_info_Id");
			String book_regist_Id = "";
			try {

				Context initCtx = new InitialContext();
				Context envCtx = (Context) initCtx.lookup("java:comp/env");
				DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

				Connection conn = ds.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(
						"select * from book_info,book_regist_info where book_info.book_info_Id=book_regist_info.book_fore and book_info.book_info_Id="
								+ book_info_Id);
				while (rs.next()) {

					String book_detail = rs.getString("book_detail");
					int lend_price = rs.getInt("lend_price");
					String book_condition = rs.getString("book_condition");
					book_regist_Id = rs.getString("book_regist_Id");
					int possible = rs.getInt("lend_possible");
					String regist_member = rs.getString("book_member_Id");
	%>
	<div class="card" style="width: 20rem;">
		<div class="card-body">
			<h4 class="card-title"><%=book_regist_Id%></h4>
			<h6 class="card-subtitle mb-2 text-muted ">
				게시자 :
				<%=regist_member%></h6>
			<p class="card-text text-right">
				PRICE :<%=lend_price%>won
			</p>
			<p class="card-text">
				상태 : &nbsp<%=book_condition%></p>
			<p class="card-text"><%=book_detail%></p>
			<%
				if (regist_member.equals(person_id)) {
			%>
			<p class="text-right">
				<button type="button" class="btn btn-primary"
					onClick="window.location='booksearch-edit.jsp?book_regist_Id=<%=book_regist_Id%>'">수정하기</button>
				<%
					} else {
				%>
				<%
					if (possible == 0) {
				%>
				<button type="button" class="btn btn-primary " data-toggle="modal"
					data-target="#askModal">대여가능</button>
			</p>
			<%
				} else if (possible == 1) {
			%>
			<p class="text-right">
				<button type="button" class="btn btn-default " data-toggle="modal"
					data-target="#askModal" disabled>대여대기</button>
			</p>
			<%
				} else {
			%>
			<p class="text-right">
				<button type="button" class="btn btn-default " data-toggle="modal"
					data-target="#askModal" disabled>대여불가</button>
			</p>
			<%
				}
							}
			%>
		</div>
	</div>

	<%
		}
				stmt.close();
				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
	%>

	<!-- Modal -->
	<div class="modal fade" id="askModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">도서 대여 신청</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action='book_request.jsp' action=post>
					<div class="modal-body">
						대여기간을 골라주세요.
						<p>
							대여기간 : <input type=date name="book_lend_start" size=20
								maxlength=19>-<input type=date name="book_lend_end"
								size=20 maxlength=19> <input type=hidden
								name="book_regist_Id" value=<%=book_regist_Id%>>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">신청</button>
					</div>
				</form>
			</div>

		</div>
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

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/jasny-bootstrap.min.js"></script>
	<%
		}
	%>
</body>
</html>