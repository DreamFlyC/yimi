<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="tag.jsp" %>
		<title>${appName}</title>
	</head>
	<body>
		<%@ include file="top.jsp"%>
   		<%@ include file="left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>home/index.html">首页</a></li>
	    		<li style="float:right;margin-right:20px;" id="weather"></li>
    		</ul>
    	</div>
	
    	</div>
    	<div class="cls"></div>
			
    	<%@ include file="foot.jsp"%>
	</body>
</html>