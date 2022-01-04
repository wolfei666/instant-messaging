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
String id=request.getParameter("uid"),bid=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
Statement stmt = conn.createStatement();
String sql="UPDATE friendadd SET f2re=1 WHERE f1id="+id+" AND f2id="+bid;
stmt.execute(sql);
stmt.execute("delete from friendadd where f1id="+id+" AND f2id="+bid);
String sql1="select * from friendlist where id="+id;
ResultSet rs=stmt.executeQuery(sql1);
String fid="";
if(rs.next())
{
	fid=rs.getString(2)+","+bid;
	stmt.execute("update friendlist set friendid='"+fid+"'where id="+id);
}
else
{
	stmt.execute("insert into friendlist(id,friendid) values("+id+",'"+bid+"')");
}
rs.close();
String sql2="select * from friendlist where id="+bid;
ResultSet rss=stmt.executeQuery(sql2);
if(rss.next())
{
	fid=rss.getString(2)+","+id;
	stmt.execute("update friendlist set friendid='"+fid+"'where id="+bid);
}
else
{
	stmt.execute("insert into friendlist(id,friendid) values("+bid+",'"+id+"')");
}
response.sendRedirect("list.jsp?id="+bid);
rss.close();
stmt.close();
conn.close();
%>
</body>
</html>