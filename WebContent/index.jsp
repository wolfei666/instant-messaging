<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎光临</title>
<style>
#head{
    font-family:隶书;
    font-size:30px;
    text-align:center;
}
 #left{
   position:absolute;
   left:10%;
   top:20%;
 }
 #right{
   position:absolute;
   left:60%;
   top:30%;
 }
 #footer{
 position:absolute;
 bottom:0%;
 left:40%;
 text-align:center;
 }
</style>
</head>
<body>
<script>
    function validate(){
	   if(registerform.uname.value==""||registerform.upwd.value==""){
	     alert("用户名或密码不能为空！");
	     return;
	   }
	   if(registerform.upwd.value.length<6|registerform.upwd.value.length>12)
		{
		alert("密码仅能为6-12位");
		return;
		}
	   if(registerform.upwd.value!=registerform.reform.value)
		{
		   alert("两次密码不同");
		   return;
		}
	   else if(registerform.phone.value==""){
		     alert("电话号码不能为空！");
		     return;
		   }
	   else
		{
		   document.registerform.submit(); 
		}
    }
    function uid_chk(){
    	var uid_str=document.getElementById("uid").value;
    	var logExp=/^[A-Za-z0-9]+$/;
    	if(logExp.test(uid_str)){
    		document.getElementById("uid_msg").innerHTML="用户名合法！";
    	}
    	else {
    		document.getElementById("uid_msg").innerHTML="用户名非法！";
    	}
    	
    }
  </script>
<div id="head">
<h1 >人人佳缘</h1>
</div>
<div id="left">
<img src="./img/left.png" height=400 width=550>
</div>
<div id="right">
<form name="registerform" action="register.jsp" method="get">
    <table>
    <caption style="color:brown">60秒注册成为会员!</caption>
        <tr>
            <td>用户名：</td>
            <td style="width:150px"><input type="text" name="uname" id="uid" onblur="uid_chk()"></td>      
         </tr>
         <tr>
            <td>密&emsp;码：</td>
            <td style="width:150px"><input type="password" name="upwd" pattern="^[A-Za-z0-9]+$"title="密码只能由数字和字母组成" ></td>      
         </tr>
         
         <tr>
            <td>确认密码：</td>
            <td style="width:150px"><input type="password" name="reform"></td>      
         </tr>
         <tr>
            <td>电子邮件：</td>
            <td style="width:150px"><input type="email" name="email"></td>      
         </tr>
         <tr>
            <td>电&emsp;话：</td>
            <td style="width:150px"><input type="text" name="phone" pattern="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(
            \d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" title="请输入正确的电话号码"></td>      
         </tr>
    </table>
    <div id="uid_msg" style="text-align:center ;color:red;"></div>
     <input type="button" value="注册" onClick="validate()"> &emsp;&emsp;&emsp;&emsp;
     <a href="login.jsp" style="color:grey" onmouseover="style.color='red'" onmouseout="style.color='purple'">已是会员？点此登录</a>
</form>
</div>
<div id="footer">
<a href=mng.jsp>管理员入口</a>
<h4>浙ICP备???????号-1</h4>
</div>
</body>
</html>