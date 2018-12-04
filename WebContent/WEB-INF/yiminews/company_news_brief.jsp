<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="公司新闻,柜人,e食柜人,外卖速度,送餐互联网餐饮,快速送达外卖,智园点餐平台,微信点餐平台">
		<meta name="description" content="公司新闻-e食柜人 据悉，伊米餐饮拥有美食研发部、中央厨房、智能点餐平台、储餐平台等一体化配设，采用手机“指尖”订餐、中央厨房生产、自有门店新鲜制作及配送.">
		<title>公司新闻-e食柜人</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/nav.css"/>
	</head>
	<body>
		<%@include file="../header.jsp"%>
		<!-- 内容 -->
		<div class="main main_help">
			<%@include file="../content.jsp"%>
			<div class="about_content">
				<div class="about_tt"><h2>公司新闻</h2></div>
				<dl class="news_list">
					<img style="padding-left:5px;" src="${pageContext.request.contextPath}/images/img/gsby.png">
					<c:forEach items="${pager.datas}" var="item" >
					<div class="news_listone">
						<img src="${item.img}">
						<dt><a href="<%=basePath%>yiminews/${item.id}" title="${item.title}" target="_blank">${item.title}</a></dt>
						<dd>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.seoDescribe}</dd>
						<a href="<%=basePath%>yiminews/${item.id}" title="${item.title}" target="_blank"><button class="ydbutton">阅读全文</button></a>
					</div>
					<hr/>
					</c:forEach>
					<div style="float:right;">
					</br>
					<a href="<%=basePath%>yiminews/company_news_brief?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>yiminews/company_news_brief?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>yiminews/company_news_brief?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
					</div>
				</dl>
			</div>
		</div>
		<%@ include file="../foot.jsp"%>
	</body>
</html>