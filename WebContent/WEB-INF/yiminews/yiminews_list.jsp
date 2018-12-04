<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String Fordate="";
String Todate="";
try 
{
  Fordate = request.getParameter("Fordate").trim();
 Todate = request.getParameter("Todate").trim();
}
catch (Exception e)
{

}

if(Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")){
 pageContext.setAttribute("Fordate",formatter.format(date));
pageContext.setAttribute("Todate",formatter.format(date));
}else{
pageContext.setAttribute("Fordate",Fordate);
pageContext.setAttribute("Todate",Todate);
}

 try 
 {
   pageContext.setAttribute("lotteryid",request.getParameter("lotteryid").trim());
 }
catch (Exception e)
{
 
}


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_官网新闻管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>yiminews.html">官网新闻管理</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<nav>
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<a href="<%=basePath%>yiminews/post">
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>yiminews/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button></a>			
			</nav>
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered" style="text-align: center;">
				<thead>
					<tr>
						<th width="20%">新闻标题</th>
						<th width="20%">新闻图片</th>
						<th width="10%">置顶级别</th>
						<th width="10%">关键词</th>
						<th width="20%">描述</th>
						<th width="20%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item">
						 
							<tr>
								<td title="${item.title}">
								<div style=" overflow: hidden; white-space: nowrap;text-overflow: ellipsis;
								width: 120px;margin-left: auto;margin-right: auto;">${item.title}</div>
								</td>
								<td><img alt="${item.img}" src="/upload/images/${item.img}" style="width: 20%;height: 60px;"></td>
								<td>${item.istop}</td>
								<td>${item.seoKeywords}</td>
								<td>${item.seoDescribe}</td>
								<td>
								 	<a href="<%=basePath%>yiminews/${item.id}.html">编辑</a> 
					   			    <a href="javascript:void(0)" onclick="LW.yiminews.del(${item.id})">删除</a>
				   			   </td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>yiminews.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>yiminews.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>yiminews.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>yiminews.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_yiminews").parent().attr("class","active");
		</script>

	</body>
</html>