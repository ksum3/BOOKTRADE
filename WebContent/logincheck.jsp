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
		String id = request.getParameter("_id");
		String pw = request.getParameter("_pw");
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");
			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from member where id = '" + id + "' and pw='" + pw + "' ");
			if (rs.next()) {
				response.sendRedirect("./mainpage-main.jsp");
				session.setAttribute("__id", id);
				session.setAttribute("__pw", pw);

			} else {
				response.sendRedirect("./loginpage-login.jsp");
			}
			stmt.close();
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>