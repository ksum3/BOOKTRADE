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

		request.setCharacterEncoding("UTF-8");
		String book_regist_Id = request.getParameter("book_regist_Id");
		String book_lend_start = request.getParameter("book_lend_start");
		String book_lend_end = request.getParameter("book_lend_end");

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			Statement stmt2 = conn.createStatement();
			stmt.executeUpdate("INSERT trade_info value('"+person_id+"','"+book_regist_Id+"','"+book_lend_start+"','"+book_lend_end+"',1,0) ");
			stmt.close();
			stmt2.executeUpdate( "UPDATE book_regist_info SET lend_possible=1 where book_regist_Id=" + book_regist_Id);
			stmt2.close();
			conn.close();
	%>
	<script language=javascript>
		self.window.alert("신청되었습니다.");
		location.href = "booksearch-main.jsp";
	</script>
	<%
		} catch (Exception e) {
			e.printStackTrace();
	%>
	<script language=javascript>
		self.window.alert("신청 실패 했습니다.");
		location.href = "booksearch-main.jsp";
	</script>
	<%
		}
	%>


</body>

</html>