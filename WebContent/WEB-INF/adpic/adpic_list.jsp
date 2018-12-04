<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
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
		<title>${appName}_朔源系统网点信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>adpic.html">广告图片列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>adpic/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>	
			<div class="cls"></div>
			<form action="manage/adpic/adpic_list" method="post" id="form1" name="indexForm">
				<table class="table table-striped" >
					<tr>
						<td style="line-height: 2.8rem ;"><label>标题名称:</label></td>
						<td><input type="text" name="title" id="title" value="" class="form-control" /></td>
						<td style="line-height: 2.8rem ;"><label>类型:</label></td>
						<td><input type="text" name="component" id="component" value="" class="form-control" /></td>
						<td><input type="submit" value="查&nbsp;询" class="form-control" /></td>
					</tr>
				</table>
			</form>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th style="width: 5%">序号</th>
						<th style="width: 5%">类型</th>	
						<th style="width: 15%">小图</th>	
						<th style="width: 15%">大图</th>	
						<th style="width: 15%">标题</th>	
						<th style="width: 5%">描述</th>
                        <th style="width: 8%">是否展示</th>
						<th style="width: 8%">添加时间</th>
                        <th style="width: 8%">开始时间</th>
                        <th style="width: 8%">结束时间</th>
                        <th style="width: 8%">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item" varStatus="status">
						 
							<tr>
								<td>${status.index+1}</td>
								<td>${item.type}</td>
								<td><img alt="小图" id="smallpic" src="/upload/images/${item.smallpic}" width="200" height="100"></td>
								<td><img alt="大图" id="largepic" src="/upload/images/${item.largepic}" width="200" height="100"></td>
								<td>${item.title}</td>
								<td>${item.description}</td>
								<td>${item.isshow==true?"是":"否"}</td>
								<td>${fn:substring(item.addtime, 0, 19)}</td>
								<td>${fn:substring(item.starttime, 0, 19)}</td>
								<td>${fn:substring(item.endtime,0,19)}</td>
								<td>
					               <a href="<%=basePath%>adpic/${item.id}.html">编辑</a> 
					   			   <a href="javascript:void(0)" onclick="LW.adpic.del(${item.id})">删除</a></td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${pager.datas.size()<=0}">
				<p style="text-align: center;">没有找到数据记录</p>
			</c:if>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/adpic.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/adpic.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/adpic.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/adpic.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_adpic").parent().attr("class","active");
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>