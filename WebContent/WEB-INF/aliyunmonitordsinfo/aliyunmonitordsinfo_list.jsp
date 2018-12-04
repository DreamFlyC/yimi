<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>${appName}_预设监控管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>aliyunmonitordsinfo.html">预设监控管理</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>aliyunmonitordsinfo/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>	
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th >序号</th>
						<th >CPU使用率</th>	
						<th >磁盘使用率</th>	
						<th>IOPS使用率</th>	
						<th >连接数使用率</th>	
						<th >只读实例延迟</th>
                        <th >内存使用率</th>
						<th >Mysql每秒网络入流量</th>
                        <th>Mysql每秒网络出流量</th>
                        <th >SQLServe每秒网络入流量</th>
                        <th >SQLServe每秒网络出流量</th>
                        <th >操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item">
						 
							<tr>
								<td>${item.id}</td>
								<td>${item.cpuusage}</td>
								<td>${item.diskusage}</td>
								<td>${item.iopsusage}</td>
								<td>${item.connectionusage}</td>
								<td>${item.datadelay}</td>
								<td>${item.memoryusage}</td>
								<td>${item.mysqlNetworkinnew}</td>
								<td>${item.mysqlNetworkoutnew}</td>
								<td>${item.sqlserverNetworkinnew}</td>
									<td>${item.sqlserverNetworkoutnew}</td>
								<td>
					               <a href="<%=basePath%>aliyunmonitordsinfo/${item.id}.html">编辑</a> 
					   			   <a href="javascript:void(0)" onclick="LW.aliyunmonitordsinfo.del(${item.id})">删除</a></td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>aliyunmonitordsinfo.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>aliyunmonitordsinfo.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>aliyunmonitordsinfo.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>aliyunmonitordsinfo.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_aliyunmonitordsinfo").parent().attr("class","active");
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>