<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>聊天界面</title>
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
  #add{
  position:absolute;
  left:17%;
  top:80%;
  }
   #footer{
 position:absolute;
 bottom:0%;
 left:40%;
 }
</style>
</head>
<body>
<script>
  function val()
  {
	  if(message.content.value=="")
		  {
		      alert("发送内容不能为空！");
		      return ;
		  }
	  else{
		   document.message.submit(); 
	   }
  }
</script>
<%
      String name=request.getParameter("name");
      String id2=request.getParameter("uid");
      String id=request.getParameter("id");//对话者的id
      Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
      Statement stat = conn.createStatement();
      ResultSet rss=stat.executeQuery("select * from mem where id="+id2);
      if(rss.next())
      {
    	  out.print("<div id=\"head\"><h1>"+rss.getString(2)+"，欢迎您！</h1></div>");
      }
      rss.close();
      if(id==null)//如果没有传入id,则根据name查找id
      {
    	  ResultSet rs=stat.executeQuery("select * from mem where uname='"+name+"';");//被发送的人名字
          if(rs.next())
          {
        	  id=rs.getString(1);
          } 
    	  rs.close();
      }
      String sql="select * from chat";
      ResultSet rs2=stat.executeQuery(sql);
      out.print("<div id=\"main\">");
      while(rs2.next())
      {
    	//与这个id有关的消息
    	  if((rs2.getString(2).equals(id)&&rs2.getString(6).equals(id2))||(rs2.getString(2).equals(id2)&&rs2.getString(6).equals(id)))
    	  {
    		  out.print("<h4>"+rs2.getString(3)+"  "+rs2.getString(5)+"</h4>");
        	  out.print("<p>"+rs2.getString(4)+"</p>");
    	  }    	  
      }
      out.print("</div>");
      stat.close();
      conn.close();
%>
<div id="left">
<br>
<h4><a href=space.jsp?id=<%=id2 %> style="color:white">个人信息</a></h4><br>
<h4><a href=list.jsp?id=<%=id2 %> style="color:white">在线聊天</a></h4><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<h4><a href=index.jsp style="color:white">退出登录</a></h4>
</div>
<div id="add">
<form name="message" action="chatpost.jsp" method="post">
<input type="hidden" name="id" value="<%=id %>"><!-- 被发送者的id -->
<input type="hidden" name="bname" value="<%=name %>"><!-- 被发送者的name -->
<input type="hidden" name="uid" value="<%=id2 %>"><!-- 发送者id -->
<textarea name="content" rows="" cols="40">请输入发送内容</textarea>
<input type="button" value="发送" onclick="val()">
</form>
</div>
<div id="footer">
<h4>浙ICP备888888号-1</h4>
</div>
</body>
</html>