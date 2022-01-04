<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
  String id=request.getParameter("uid"),bid=request.getParameter("id");
  Class.forName("com.mysql.jdbc.Driver"); 
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
  Statement stmt = conn.createStatement();
  stmt.execute("delete from friendadd where f1id="+id+" AND f2id="+bid);
  stmt.close();
  conn.close();
  response.sendRedirect("list.jsp?id="+bid);
%>
</body>
</html>