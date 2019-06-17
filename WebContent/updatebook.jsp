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
		String person_id = (String)session.getAttribute("__id");
	
		request.setCharacterEncoding("utf-8");
		String book_info_Id = request.getParameter("book_info_Id");
		String book_regist_Id = request.getParameter("book_regist_Id");
		String member_id = request.getParameter("member_id");
		String book_title = request.getParameter("book_title");
		String book_author = request.getParameter("book_author");
		String book_publisher = request.getParameter("book_publisher");
		String lend_price = request.getParameter("lend_price");
		String book_publish_year = request.getParameter("book_publish_year");
		String book_condition = request.getParameter("book_condition");
		String book_detail = request.getParameter("book_detail");

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/mysql");

			Connection conn = ds.getConnection();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate("update book_info set book_title='" + book_title + "', book_author='" + book_author
					+ "', book_publisher='" + book_publisher + "', book_publish_year='" + book_publish_year
					+ "' where book_info_Id=" + book_info_Id);
			stmt.close();
			Statement stmt2 = conn.createStatement();
			stmt2.executeUpdate(
					"update book_regist_info set lend_price='" + lend_price + "', book_condition='" + book_condition
							+ "', book_detail='" + book_detail + "' where book_regist_Id=" + book_regist_Id);
			stmt2.close();
			conn.close();
			
			if(person_id.equals("root")){
	%>
	<script language=javascript>
		self.window.alert("입력한 글을 수정하였습니다.");
		location.href = "adminpage-book.jsp";//OnClick="javascript:history.back(-1)"
	</script>
	<%}else{ %>
	<script language=javascript>
		self.window.alert("입력한 글을 수정하였습니다.");
		location.href = "mypage-system.jsp";
	</script>
	<%} %>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>