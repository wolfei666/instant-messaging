<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索结果</title>
<style>
  #head{
    font-family:隶书;
    font-size:20px;
    color:black;
  }
  #left{
  font-family:微软雅黑;
  font-size:15px;
  text-align:center;
  background-color:black;
  width:150px;
  height:600px;
  }
  #main{
  position:absolute;
  left:12%;
  top:15%;
  }
  #detail{
  position:absolute;
  left:12%;
  top:20%;
  }
   #footer{
 position:absolute;
 bottom:0%;
 left:40%;
 }
</style>
</head>
<body>
<%
    String name2=request.getParameter("name");
    String name=request.getParameter("so");
    String id = request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
    Statement stat = conn.createStatement(); 
    ResultSet rs=stat.executeQuery("SELECT * FROM mem where uname='"+name+"'");
    if(rs.next())
    {
    	out.print("<div id=\"head\"><h1>"+name2+"，欢迎您！</h1></div>");
    }
    
%>
<div id="left">
<br>
<h4><a href=space.jsp?id=<%=id %> style="color:white">个人信息</a></h4><br>
<h4><a href=list.jsp?id=<%=id %> style="color:white">在线聊天</a></h4><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<h4><a href=index.jsp style="color:white">退出登录</a></h4>
</div>
<div id="main">
<form action="search.jsp" method="get">
<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="name" value="<%=name2 %>">
<input type="text" name="so" value="输入名字查找好友">
<input type="submit" value="查找">
</form></div>
<div id="detail">
姓名：<%=name %><br>
性别：<%=rs.getString(6) %><br>
专业：<%=rs.getString(10) %><br>
特长：<%=rs.getString(7) %><br>
爱好：<%=rs.getString(11) %><br>
电子邮箱：<%=rs.getString(5) %><br>
<a href="add.jsp?id=<%=id %>&bid=<%=rs.getString(1) %>">添加好友</a>
<a href=hate.jsp>举报用户</a>
</div> 
<%
rs.close();
stat.close(); 
conn.close();
%>
<div id="footer">
<h4>浙ICP备888888号-1</h4>
</div>
</body>
</html>