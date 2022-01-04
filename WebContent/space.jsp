<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>个人空间</title>
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
  top:17%;
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
  function validate()
  {
	  
		 alert("您的个人信息已更新！");
		   document.inform.submit(); 
  }
</script>
<%
      String name="",phone="",strongp="",hobby="",major="",birthday="0000-00-00",mail="",sex="男";
      String id=request.getParameter("id");
	  Class.forName("com.mysql.jdbc.Driver"); 
      Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
      Statement stat = conn.createStatement(); 
      ResultSet rs=stat.executeQuery("SELECT * FROM mem where id="+id);
      if(rs.next())
      {
    	  out.print("<div id=\"head\"><h1>"+rs.getString(2)+"，欢迎您！</h1></div>");
    	  name=rs.getString(rs.findColumn("uname"));
      	  phone=rs.getString(rs.findColumn("phone"));
      	  strongp=rs.getString(rs.findColumn("strongp"));
      	  hobby=rs.getString(rs.findColumn("hobby"));
      	  major=rs.getString(rs.findColumn("major"));
      	  birthday=rs.getString(rs.findColumn("birthdate"));
      	  mail=rs.getString(rs.findColumn("mail"));
      	  sex=rs.getString(rs.findColumn("sex"));
      }      
      rs.close();
      stat.close(); 
      conn.close();
%>
<div id="left">
<br>
<h4><a href=space.jsp?id=<%=id %> style="color:white">个人信息</a></h4><br>
<h4><a href=list.jsp?id=<%=id %> style="color:white">在线聊天</a></h4><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<h4><a href=index.jsp style="color:white">退出登录</a></h4>
</div>
<div id="main">
<h5>个人信息</h5>
<form name="inform" action="spacepost.jsp" method="get">
<input type="hidden" name="id" value="<%=id %>">
&emsp;用户名： 
<input type="text" name="user_name" value="<%=name %>"><br>
&emsp;&emsp;性别：
<input type="text" name="user_sex" value="<%=sex%>"><br>
&emsp;&emsp;特长：
<input type="text" name="user_strong" value="<%=strongp %>"><br>
&emsp;&emsp;专业：
<input type="text" name="user_major" value="<%=major %>"><br>
&emsp;&emsp;爱好：
<input type="text" name="user_hobby" value="<%=hobby %>"><br>
<h5>联系方式</h5>
&emsp;&emsp;电话：
<input type="text" name="user_tel" value="<%=phone %>"><br>
&emsp;&emsp;邮箱：
<input type="text" name="user_mail" value="<%=mail %>"><br><br>
<input type="button" value="提交" onclick="validate()">
<input type="reset" value="取消">
</form>
</div>
<div id="footer">
<h4 style="color:black">浙ICP备888888号-1</h4>
</div>
</body>
</html>