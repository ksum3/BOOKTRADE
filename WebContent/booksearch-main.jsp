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
					href="mypage-system.jsp">내 책 관리</a> <a class="dropdown-item" href="mypage-main.jsp">내
					정보 관리</a> <a class="dropdown-item" href="mypage-mytrade.jsp">내 거래 내역</a>
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
	<div class="card text-center">
		<div class="card-body">
			<!--학과별로 보여주는게 다르게 할 수 있도록 해야할듯. 검색 기능도 추가하는게 좋을 것 같은뎅... -->
			<form action="<%=request.getContextPath()%>/book_select_result.jsp"
				method="post" class="form-group">
				<table border=0>
					<tr>
						<td><select name="search" style="height: 26px;">
								<option value="book_null"></option>
								<option value="book_title" selected>책제목</option>
								<option value="book_author">저자</option>
						</select></td>
						<td><input type="text" name="enter"></td>
						<td><input type="submit" class="btn btn-primary btn-sm"
							value="검색"></td>
					</tr>
				</table>
			</form>
			<%
				//int idx = Integer.parseInt(request.getParameter("idx"));
					try {

						Context initCtx = new InitialContext();
						Context envCtx = (Context) initCtx.lookup("java:comp/env");
						DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

						Connection conn = ds.getConnection();
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt
								.executeQuery("select * from book_info, book_regist_info group by book_info_Id ");

						out.println("<table  class='table table-hover'>");
						out.println("<caption>책 리스트</caption>");
						out.println("<thead><tr><th>번호</th><th>책이름</th><th>저자</th><th>출판사</th><th>출판년도</th></tr></thead>");
						out.println("<tbody data-link='row' class='rowlink'>");
						while (rs.next()) {
							int book_info_Id = rs.getInt("book_info_Id");
							String book_title = rs.getString("book_title");
							String book_author = rs.getString("book_author");
							String book_publisher = rs.getString("book_publisher");
							String book_publish_year = rs.getString("book_publish_year");

							out.println("<tr>");
							out.println("<td width=100><a href='booksearch-list.jsp?book_info_Id=" + book_info_Id + "'>"
									+ book_info_Id + "</a></td>");
							out.println("<td width=100>" + book_title + "</td>");
							out.println("<td width=100>" + book_author + "</td>");
							out.println("<td width=100>" + book_publisher + "</td>");
							out.println("<td width=100>" + book_publish_year + "</td>");
							out.println("</tr>");

						}
						out.println("</tbody></table>");
						stmt.close();
						conn.close();

					} catch (Exception e) {
						e.printStackTrace();
					}
			%>
			<form action="booksearch-add.jsp" method="post">
				<div align="right">
					<button class="btn btn-primary btn-icon btn-round"
						onClick="window.location='booksearch-add.jsp'"
						data-toggle="tooltip" data-placement="bottom" title="책 등록 페이지로 이동">
						<i class="now-ui-icons ui-1_simple-add"></i>
					</button>
				</div>
			</form>
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