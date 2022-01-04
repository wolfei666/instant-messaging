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
      request.setCharacterEncoding("UTF-8");
      String name=request.getParameter("bname");
      String id=request.getParameter("id"),uid=request.getParameter("uid");
      String content=request.getParameter("content");
      String uname="";
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
      Statement stat = conn.createStatement();
      ResultSet rs=stat.executeQuery("select * from mem where id="+uid);
      if(rs.next())
      {
    	  uname=rs.getString(2);
      }      
      Statement stmt = conn.createStatement();  
      String sql="INSERT INTO chat(id,name,content,toid) VALUES("+uid+",'"+uname+"','"+content+"',"+id+")";
      stmt.execute(sql);
      rs.close();
      stmt.close();
      conn.close();
      response.sendRedirect("chat.jsp?id="+id+"&uid="+uid);
%>
</body>
</html>