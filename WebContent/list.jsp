<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索一下</title>
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
  left:17%;
  top:15%;
  }
  #list{
  position:absolute;
  left:17%;
  top:20%;
  }
  #add{
  position:absolute;
  left:17%;
  top:60%;
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
      String id=request.getParameter("id");
	  Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
      Statement stat = conn.createStatement(); 
      ResultSet rs=stat.executeQuery("SELECT * FROM mem where id="+id);
      if(rs.next())
      {
    	  out.print("<div id=\"head\"><h1>"+rs.getString(2)+"，欢迎您！</h1></div>");
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
<input type="hidden" name="name" value="<%=rs.getString(2) %>">
<input type="text" name="so" value="输入名字添加好友">
<input type="submit" value="查找">
</form>
</div>
<div id=list>
<h4>好友列表</h4>
<%
    ResultSet rs2=stat.executeQuery("SELECT * FROM mem WHERE FIND_IN_SET(id,(SELECT friendid  FROM friendlist WHERE id="+id+"))");
    out.print("<table>");
    while(rs2.next())
    {
    	out.println("<tr><td color=green width=\"300px\">"+rs2.getString(2)+"</td><td width=\"150px\"><a href=chat.jsp?name="+rs2.getString(2)+"&uid="+id+">聊天</a></td><td><a href=del.jsp?id="+rs2.getString(1)+"&uid="+id+">删除</a></td></tr>");
    }
    out.print("</table>");  
    rs2.close();
%>
</div>
<div id="add">
<h4>好友申请请求</h4>
<%
  String fid="";
  ResultSet rss=stat.executeQuery("select * from friendadd where f2id="+id);
  if(rss.next())
  {
	  fid=rss.getString(2);
  }  
  rss.close();
%>
<%
if(!fid.equals(""))
{
	  ResultSet rst=stat.executeQuery("select * from mem where id="+fid);
	  String fname="";  
	  out.print("<table>");
	  if(rst.next())
	  {
		  out.print("<tr><td width=\"300px\">"+rst.getString(2)+"</td><td><a href=detail.jsp?id="+fid+">查看个人信息</a></td><td><a href=add1.jsp?id="+id+"&uid="+fid+">同意</a></td><td><a href=refuse.jsp?id="+id+"&uid="+fid+">拒绝</a></td>");
	  }
	  out.print("</table>");
	  rst.close();
}
%>
<%
rs.close();
stat.close(); 
conn.close();
%>
</div>
<div id="footer">
<h4>浙ICP备888888号-1</h4>
</div>
</body>
</html>