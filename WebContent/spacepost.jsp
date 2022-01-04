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
  String name=request.getParameter("user_name"),sex=request.getParameter("user_sex"),strong=request.getParameter("user_strong");
  String major=request.getParameter("user_major"),hobby=request.getParameter("user_hobby"),phone=request.getParameter("user_tel");
  String mail=request.getParameter("user_mail");
  String id=request.getParameter("id");
	  Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
      Statement stmt = conn.createStatement(); 
      String sql="UPDATE mem set uname='"+name+"',sex='"+sex+"',strongp='"+strong+"',major='"+major+"',hobby='"+hobby+"',phone='"+phone+"' where id="+id;
      stmt.execute(sql);
      stmt.close();
      conn.close();
      response.sendRedirect("space.jsp?id="+id);
%>
</body>
</html>