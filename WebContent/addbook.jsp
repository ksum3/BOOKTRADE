<%@page import="java.util.Random"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
//	String book_info_Id = request.getParameter("book_info_Id");
//	String book_regist_Id = request.getParameter("book_regist_Id");
	String member_id = request.getParameter("member_id");
	String book_title = request.getParameter("book_title");
	String book_author = request.getParameter("book_author");
	String book_publisher = request.getParameter("book_publisher");
	String lend_price = request.getParameter("lend_price");
	String book_publish_year = request.getParameter("book_publish_year");
	String book_condition = request.getParameter("book_condition");
	String book_detail = request.getParameter("book_detail");
	
	String person_id = (String) session.getAttribute("__id");
	String book_regist_Id;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
	Calendar c = Calendar.getInstance();
	String str = sdf.format(c.getTime());
	Random rand = new Random();
	int r = rand.nextInt(999);
	book_regist_Id = (String)str+r;	
	
	try{
		Context initCtx=new InitialContext();
		Context envCtx=(Context)initCtx.lookup("java:comp/env");
		DataSource ds=(DataSource)envCtx.lookup("jdbc/mysql");
		   
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();

		ResultSet rs = stmt.executeQuery("select* from book_info where book_title='"+book_title+"' and book_author='"+book_author+"' and book_publisher='"+book_publisher+"' and book_publish_year='"+book_publish_year+"'");
		if(rs.next()){
			int book_info_Id = rs.getInt("book_info_Id");
			stmt.executeUpdate("insert into book_regist_info values ('"+book_regist_Id+"','"+person_id+"', '"+book_info_Id+"','"+lend_price+"','"+book_condition+"','"+book_detail+"',0)");
		}else{
			rs.close();
			rs = stmt.executeQuery("select COUNT(*) as cnt from book_info");
			if(rs.next()){
				int cnt = rs.getInt("cnt");
				stmt.executeUpdate("insert into book_info values ("+(cnt+1)+",'"+book_title+"','"+book_author+"','"+book_publisher+"','"+book_publish_year+"')");
				stmt.executeUpdate("insert into book_regist_info values ('"+book_regist_Id+"','"+person_id+"', '"+(cnt+1)+"','"+lend_price+"','"+book_condition+"','"+book_detail+"',0)");
			}
			else{
				
			}
		}
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="booksearch-main.jsp"; 
</script>

</body>
</html>