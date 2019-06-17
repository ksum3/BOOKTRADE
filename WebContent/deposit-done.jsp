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
		String buyer_id = request.getParameter("buyer_id");
		String trade_regist_Id = request.getParameter("trade_regist_Id");

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			Statement stmt2 = conn.createStatement();
			stmt.executeUpdate("UPDATE trade_info SET deposit_check=3 where buyer_id='"+buyer_id+"' and trade_regist_Id='"+trade_regist_Id+"'");
			stmt.close();
			conn.close();
	%>
	<script language=javascript>
		self.window.alert("완료되었습니다.");
		location.href = "adminpage-deposit.jsp";
	</script>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>


</body>

</html>