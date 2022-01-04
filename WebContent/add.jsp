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
    String id=request.getParameter("id"),bid=request.getParameter("bid");
    Class.forName("com.mysql.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fw?useUnicode=true&characterEncoding=utf8", "root", "123456");
    Statement stmt = conn.createStatement();
    String sql1="select * from friendadd";
    ResultSet rs=stmt.executeQuery(sql1);
    int flag=0;
    while(rs.next())
    {
    	if(rs.getString(2).equals(id)&&rs.getString(3).equals(bid))
    	{
    		flag=1;
    	}
    }
    if(flag==1)
    {
    	out.print("您已经申请过，请不要重复申请！<br>");
		out.print("<a href=list.jsp?id="+id+">返回好友列表</a>");
    }
    else{
    	String sql="insert into friendadd(f1id,f2id) values("+id+","+bid+")";
    	stmt.execute(sql);
    	out.print("申请成功！");
		out.print("<a href=list.jsp?id="+id+">返回好友列表</a>");
    }   
    rs.close();
    stmt.close();
    conn.close();
%>
</body>
</html>