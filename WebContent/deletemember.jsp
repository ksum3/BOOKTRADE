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

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("delete from member where id='" + id + "'");
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (person_id.equals("root")) {
	%>
	<script language=javascript>
		self.window.alert("입력한 글을 삭제하였습니다.");
		location.href = "adminpage-member.jsp";
	</script>
	<%
		} else {
	%>
	<script language=javascript>
		self.window.alert("회원 탈퇴가 완료되었습니다.");
		location.href = "loginpage-login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>