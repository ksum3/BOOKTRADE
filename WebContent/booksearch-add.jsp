<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<script language="javascript">
	// 자바 스크립트 시작 
	function writeCheck() {
		var form = document.writeform;
		if (!form.book_title.value) // form 에 있는 name 값이 없을 때 
		{
			alert("도서명을 적어주세요"); // 경고창 띄움
			form.title.focus(); // form 에 있는 name 위치로 이동 
			return;
		}
		if (!form.book_author.value) {
			alert("저자명을 적어주세요");
			form.author.focus();
			return;
		}
		if (!form.book_publisher.value) {
			alert("출판사명을 적어주세요");
			form.publisher.focus();
			return;
		}
		if (!form.lend_price.value) {
			alert("대여가격을 적어주세요");
			form.lend_price.focus();
			return;
		}
		if (!form.book_publish_year.value) {
			alert("출판년도을 적어주세요");
			form.book_publish_year.focus();
			return;
		}
		if (!form.book_condition.value) {
			alert("상태정보를 적어주세요");
			form.book_condition.focus();
			return;
		}
		if (!form.book_detail.value) {
			alert("상세정보를 적어주세요");
			form.book_detail.focus();
			return;
		}
		form.submit();
	}
</script>
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
		if (person_id==null) {
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
			<!--도서 표를 여기다 넣으면 되나..? db때문에 실행 해도 보이질 않음 그리고 삭제 부분도 고치면 현아가 줄 예정-->
			<table class="table table-bordered">
				<form name=writeform action="addbook.jsp" method="post">
					<tr>
						<th scope="row">도서명</th>
						<td><input type=text name=book_title size=20 maxlength=19></td>
					</tr>
					<tr>
						<th scope="row">저자명</th>
						<td><input type=text name=book_author size=20 maxlength=19></td>
					</tr>
					<tr>
						<th scope="row">출판사명</th>
						<td><input type=text name=book_publisher size=20 maxlength=19></td>
					</tr>
					<tr>
						<th scope="row">대여 가격</th>
						<td><input type=number name=lend_price size=20 maxlength=19></td>
					</tr>
					<tr>
						<th scope="row">출판년도</th>
						<td><input type=text name=book_publish_year size=20
							maxlength=19 placeholder="(ex)2018"></td>
					</tr>
					<tr>
						<th scope="row">상태정보</th>
						<td>	
						<div class="form-check form-check-radio">
							<label class="form-check-label"> 
								<input class="form-check-input" type="radio" name="book_condition" value="미흡"> 
								<span class="form-check-sign"></span>
								 미흡
							</label>					
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="book_condition" value="보통" checked>
									<span class="form-check-sign"></span>
									 보통
							</label>
							<label class="form-check-label"> 
								<input class="form-check-input" type="radio" name="book_condition"  value="양호"> 
								<span class="form-check-sign"></span>
								양호
							</label>
							<label class="form-check-label">
								<input class="form-check-input" type="radio" name="book_condition"  value="최상" >
									<span class="form-check-sign"></span>
									최상
							</label>
						</div>
							
					</tr>
					<tr>
						<th scope="row">상세 정보</th>
						<td><textarea name=book_detail rows="10" cols="50"></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><div align="right">
								<input type=button value="등록" class="btn btn-primary"
									OnClick="javascript:writeCheck();"> 
								<input type=button
									value="취소" class="btn btn-primary"
									OnClick="javascript:history.back(-1)">

							</div></td>
					</tr>
				</form>
			</table>
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
		}
	%>
</body>
</html>