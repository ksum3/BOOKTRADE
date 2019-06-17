<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" %>
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
<body>
	<%
		String person_id = (String) session.getAttribute("__id");

		if (person_id.equals("root")) {
	%>
	<header class="navbar navbar-expand-lg bg-primary">
	<div class="container">
		<div class="dropdown button-dropdown">
			<a href="#pablo" class="dropdown-toggle" id="navbarDropdown"
				data-toggle="dropdown"> <span class="button-bar"></span> <span
				class="button-bar"></span> <span class="button-bar"></span>
			</a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
				<a class="dropdown-item" href="./logout.jsp">로그아웃</a>
			</div>
		</div>
		<div class="navbar-translate">
			<a class="navbar-brand" href="#" rel="tooltip"
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
				<li class="nav-item"><a class="nav-link"
					href="./adminpage-member.jsp">회원관리</a></li>
				<li class="nav-item"><a class="nav-link"
					href="adminpage-book.jsp">도서관리</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 보증금관리 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="adminpage-accept.jsp">보증금 입금 확인</a> <a
							class="dropdown-item" href="adminpage-deposit.jsp">보증금 반환 확인</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="./mainpage-main.jsp">Home</a></li>
			</ul>
		</div>
	</div>
	</header>
	<div class="card text-center">
		<div class="card-body">
				<%
					try {
						Context initCtx = new InitialContext();
						Context envCtx = (Context) initCtx.lookup("java:comp/env");
						DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

						Connection conn = ds.getConnection();
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery(
								"select * from trade_info, book_regist_info where deposit_check=2 and trade_info.trade_regist_id=book_regist_info.book_regist_Id");

						out.println("<table class='table table-hover'>");
						out.println("<thead><tr><th>도서ID</th><th>판매자</th><th>구매자</th><th>대여시작일</th><th>대여종료일</th><th>확인</th></tr></thead>");
						out.println("<tbody>");
						while (rs.next()) {
							String buyer_id = rs.getString("buyer_id");
							String book_member_id = rs.getString("book_member_id");
							String book_lend_start = rs.getString("book_lend_start");
							String book_lend_end = rs.getString("book_lend_end");
							String trade_regist_Id = rs.getString("trade_regist_Id");
							
							out.println("<tr>");
							out.println("<td width=100>" + trade_regist_Id + "</td>");
							out.println("<td width=100>" + buyer_id + "</td>");
							out.println("<td width=100>" + book_member_id + "</td>");
							out.println("<td width=150>" + book_lend_start + "</td>");
							out.println("<td width=150>" + book_lend_end + "</td>");
							out.println("<td width=50><a href='./deposit-done.jsp?buyer_id="+buyer_id+"&trade_regist_Id="+trade_regist_Id+"'>반환완료</a></td>");
							out.println("</tr>");
						}
						out.println("</tbody></table>");
						
						stmt.close();
						conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			
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
	<%
		}else{
	%>
	<script language=javascript>
		self.window.alert("권한이 없습니다.");
		location.href = "loginpage-login.jsp";
	</script>
	<%} %>
</body>
</html>