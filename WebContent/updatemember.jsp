<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String person_id = (String) session.getAttribute("__id");
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("_id");
		String pw = request.getParameter("_pw");
		String name = request.getParameter("_name");
		String major = request.getParameter("_major");
		String email = request.getParameter("_email");
		String phone = request.getParameter("_phone");

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();

			stmt.executeUpdate("update member set pw='" + pw + "', name='" + name + "', major='" + major
					+ "', email='" + email + "', phone='" + phone + "' where id='" + id + "'");

			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (person_id.equals("NULL")) {
	%>
	<script language=javascript>
		self.window.alert("로그인이 필요한 페이지 입니다.");
		location.href = "loginpage-login.jsp";
	</script>
	<%
		} else {
	%>
	<%
		if (person_id.equals("root")) {
	%>
	<script language=javascript>
		self.window.alert("입력한 글을 저장하였습니다.");
		location.href = "adminpage-member.jsp";
	</script>
	<%
		} else {
	%>
	<script language=javascript>
		self.window.alert("입력한 글을 저장하였습니다.");
		location.href = "mypage-main.jsp";
	</script>
	<%
		}
		}
	%>
</body>
</html>