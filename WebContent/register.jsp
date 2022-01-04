<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册结果</title>
</head>
<body>
<%
      String name=request.getParameter("uname"),pwd=request.getParameter("upwd"),mail=request.getParameter("email"),phone=request.getParameter("phone");
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
      Statement stmt = conn.createStatement();     
      ResultSet rs = stmt.executeQuery("select * from mem");
      rs.last();
      int id = rs.getRow();
      if(name!=null&&pwd!=null&&phone!=null)
      {
    	  
          String sql="INSERT INTO mem(uname,pwd,phone,mail) VALUES('"+name+"','"+pwd+"','"+phone+"','"+mail+"')";
          stmt.execute(sql);         
          //id=Integer.toString(count);         
      }
      stmt.close();
      conn.close();
%>
注册成功，即将跳转至个人空间……
<a href=space.jsp?id=<%=id+1 %>>个人空间</a>
当前已有<%=id %>个人注册
</body>
</html>