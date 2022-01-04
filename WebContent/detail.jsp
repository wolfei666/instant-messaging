<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人信息</title>
</head>
<body>
<% 
      String id=request.getParameter("id");//对话者的id
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
      Statement stat = conn.createStatement();
      ResultSet rs=stat.executeQuery("select * from mem where id="+id);   
      if(rs.next())
      {
    	  
      }
      %>
姓名：<%=rs.getString(2) %><br>
性别：<%=rs.getString(6) %><br>
专业：<%=rs.getString(10) %><br>
特长：<%=rs.getString(7) %><br>
爱好：<%=rs.getString(11) %><br>
电子邮箱：<%=rs.getString(5) %><br>
<%
rs.close();
stat.close();
conn.close();
%>
</body>
</html>