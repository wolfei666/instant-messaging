<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>拉黑好友</title>
</head>
<body>
<%
String id=request.getParameter("uid"),bid=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
Statement stmt = conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from friendlist where id="+id);
String fid="";
if(rs.next())
{
	fid=rs.getString(2);
}
String[] as = fid.split(",");
for (int i = 0; i < as.length; i++) {
    if(as[i].equals(bid))
    {
    	for(;i<as.length-1;i++)
    	{
    		as[i]=as[i+1];
    	}
    	break;
    }
}
fid="";
for(int i=0;i<as.length-1;i++)
{
	fid=fid+","+as[i];
}
stmt.execute("update friendlist set friendid='"+fid+"' where id="+id);
response.sendRedirect("list.jsp?id="+id);
%>
</body>
</html>