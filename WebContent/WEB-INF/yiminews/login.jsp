<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta charset="utf-8" />
    <link href="<%=basePath%>resources/yiminews/css/index.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/ndex.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/animate.css"
	rel="stylesheet" />
	<link href="<%=basePath%>resources/yiminews/css/login.css"
	rel="stylesheet" />
<script src="<%=basePath%>resources/yiminews/js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>resources/yiminews/js/index.js"></script>
<script src="<%=basePath%>resources/yiminews/js/wySilder.min.js"></script>

</head>
<body>
<%@ include file="head.html" %>
<div class="main">
    <div class="header">
        <h1>登录或创建一个免费帐户！</h1>
    </div>
    <p></p>
    <form>
        <ul class="left-form" >
           	<h3>新账户:</h3>
            <li>
                <input type="text" placeholder="用户名" name="username" required />
                <a href="#" class="icon ticker"> </a>
                <div class="clear"> </div>
            </li>
            <li>
                <input type="text" placeholder="邮箱" name="email" required />
                <a href="#" class="icon ticker"> </a>
                <div class="clear"> </div>
            </li>
            <li>
                <input type="password" placeholder="密码" name="password1" required />
                <a href="#" class="icon into"> </a>
                <div class="clear"> </div>
            </li>
            <li>
                <input type="password" placeholder="确认密码" name="password2" required />
                <a href="#" class="icon into"> </a>
                <div class="clear"> </div>
            </li>
            <label class="checkbox">
                <input type="checkbox" name="checkbox" checked=""><i>
                </i>我已阅读并同意此协议
            </label>
            <input type="submit" onClick="myFunction()" value="创建账户">
            <div class="clear"> </div>
        </ul>
        <ul class="right-form">
            <h3>登录:</h3>
            <div>
                <li><input type="text" placeholder="用户名" name="username" id="username" required /></li>
                <li> <input type="password" placeholder="密码" name="password" id="password" required /></li>
                <h4>忘记密码</h4>
                <input type="submit" onClick="myFunction()" value="登录">
            </div>
            <div class="clear"> </div>
        </ul>
        <div class="clear"> </div>
    </form>
</div>


<%@ include file="foot.html" %>

</body>
</html>