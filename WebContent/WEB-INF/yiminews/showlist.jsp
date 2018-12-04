<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻中心</title>
<link href="<%=basePath%>resources/yiminews/css/index.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/ndex.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/animate.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/showlist.css"
rel="stylesheet" />
<script src="<%=basePath%>resources/yiminews/js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>resources/yiminews/js/index.js"></script>
<script src="<%=basePath%>resources/yiminews/js/wySilder.min.js"></script>
</head>
<body>
<div  class="container">
	<%@ include file="head.html" %>
	<!-- 顶部导航 -->
	<div class="Content">
		<!--新闻中心展示区  -->
		<div>
		<img alt="" src="<%=basePath%>resources/yiminews/Images/newscenter/3-01.png">
		</div>
		<div style="background-color:#f7f7f7;width: 100%">
		<div style="margin-left: 22%;margin-right: 22%;">
			<P style="font-size: 26px;color: #666;line-height: 100px;">公司新闻</P>
			<c:forEach items="${pager.datas}" var="item">
			<div>
				<div class="left">
				<p class="p4">${fn:substring(item.creatime, 8, 10)}</p>
				<p class="p5">${fn:substring(item.creatime, 0, 7)}</p>
				</div>
				<div class="right">
					<p class="p1">${item.title}</p>
					<p class="p2">${item.seoDescribe}</p>
					<p class="p3"><a href="show/${item.id}" style="color: #3bbf4f;">查看详情>></a></p>
				</div>
			</div>
			<div class="cls"></div>
			</c:forEach>
		
				<nav>
					<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
					<div class="btn-group pull-right" role="group" style="width: 35%;  float: right;">
				      	<a href="<%=basePath%>yiminews/showlist.html" class="btn btn-default">首页</a>
				      	<a href="<%=basePath%>yiminews/showlist.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
				      	<a href="<%=basePath%>yiminews/showlist.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
				      	<a href="<%=basePath%>yiminews/showlist.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
				    </div>
				</nav>
				<div style="height: 50px;">&nbsp;</div>
			</div>
		</div>
		</div>
		<%@ include file="foot.html" %>
	</div>
</body>
</html>