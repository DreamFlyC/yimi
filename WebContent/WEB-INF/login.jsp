<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>${appName}--后台登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link href="<%=basePath%>resources/css/login.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
		<div class="container">
			<section id="content">
				<form action="<%=basePath%>manage/submit.html" method="post">
					<h1>管理员登录</h1>
					<div>
						<input type="text" name="userName" placeholder="用户名" autocomplete="off"/>
					</div>
					<div>
						<input type="password" name="password" placeholder="密码" autocomplete="off"/>
					</div>
					<div class="">
						<span class="help-block u-errormessage" style="color:red">${errorMsg}&nbsp;</span>
					</div> 
					<div style="margin-left:100px;">
						<input type="submit" value="登录" class="btn btn-primary"/>
					</div>
				</form>
			</section>
		</div>
  </body>
</html>
