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
    String name=request.getParameter("name"),pwd=request.getParameter("pwd");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
    Statement stat = conn.createStatement(); 
    ResultSet rs=stat.executeQuery("SELECT * FROM mem");
    while(rs.next())
    {
    	if(rs.getString(2).equals(name)&&rs.getString(3).equals(pwd))
    	{
    		response.sendRedirect("space.jsp?id="+rs.getString(1));
    	}
    }
    rs.close();
    stat.close(); 
    conn.close();
%>
登录失败，用户名或密码错误！
<a href=login.jsp>返回登录页</a>
</body>
</html>