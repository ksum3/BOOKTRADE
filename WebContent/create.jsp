<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("_id");
		String pw = request.getParameter("_pw");
		String name = request.getParameter("_name");
		String jumin1 = request.getParameter("_jumin1");
		String jumin2 = request.getParameter("_jumin2");
		String email = request.getParameter("_email");
		String major = request.getParameter("_major");

		//System.out.println(major);

		String phone = request.getParameter("_phone");

		String addr1 = request.getParameter("_addr1");
		String addr2 = request.getParameter("_addr2");
		String admin = request.getParameter("_admin");
		String join_date = request.getParameter("_join_date");

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

			Connection conn = ds.getConnection();
			//Statement stmt = conn.createStatement();
			//stmt.executeUpdate("insert into member values ('" + id + "','"+ pw + "','" + name + "','"+ jumin1 +"','"+ jumin2 +"','"+ email +"','"+ major +"','"+ phone +"','"+ zipcode +"','"+ addr1 +"','"+ addr2 +"')");
			String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, now())";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, jumin1);
			pstmt.setString(5, jumin2);
			pstmt.setString(6, email);
			pstmt.setString(7, major);
			pstmt.setString(8, phone);

			pstmt.setString(9, addr1);
			pstmt.setString(10, addr2);
			//pstmt.setString(11,admin);
			//pstmt.setString(12,join_date);
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
	%>
	<script language=javascript>
		self.window.alert("회원가입 되었습니다.");
		location.href = "loginpage-login.jsp";
	</script>
	<%
		} catch (Exception e) {
			e.printStackTrace();
	%>
	<script language=javascript>
		self.window.alert("회원가입에 실패했습니다.");
		location.href = "loginpage-login.jsp";
	</script>
	<%
		}
	%>

</body>
</html>