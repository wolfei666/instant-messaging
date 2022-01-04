<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎登录佳缘网站</title>
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
   top:40%;
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
    function validate(){
	   if(loginform.name.value==""||loginform.pwd.value==""){
	     alert("用户名或密码不能为空！");
	     return;
	  }
	   else{
		   document.loginform.submit(); 
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
<form name="loginform" action="loginval.jsp" method="get">
       <table>
         <tr>
            <td>用户名：</td>
            <td style="width:200px"><input type="text" name="name" id="uid" onblur="uid_chk()"></td>      
         </tr>
         <tr>
            <td>密&emsp;码：</td>
            <td style="width:200px"><input type="password" name="pwd" ></td>      
         </tr>
       </table>
       <div id="uid_msg" style="text-align:center ;color:red;">
       </div>       
       <input type="button" value="登录" onClick="validate()"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       <a href="index.jsp" style="color:grey" onmouseover="style.color='red'" onmouseout="style.color='purple'">注册新用户</a>
     </form>
     </div>
 <div id="footer">
<h4>浙ICP备???????号-1</h4>
</div>
</body>
</html>