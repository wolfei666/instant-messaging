<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员入口</title>
</head>
<body>
<%
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
    Statement stat = conn.createStatement(); 
    ResultSet rs=stat.executeQuery("SELECT * FROM mem");
    response.getWriter().print("<table>");
    while(rs.next())
    {
    	
    	response.getWriter().print("<tr><td width=400px><a href=\"content.jsp?id="+rs.getString(1)+"\">"+rs.getString(2)+"</a></td><td width=300px>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td>");
      
    }//信用值
    response.getWriter().print("</table>");
    rs.close();
    stat.close(); 
    conn.close();
%>
</body>
</html>