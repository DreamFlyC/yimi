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
		<title>${appName}_规则管理</title>
		<style type="text/css">
			table thead tr th,table tbody tr td{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/bnmanagerrolevalue.html">规则管理列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<button class="btn btn-primary" onclick="javascript:window.location.reload()">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</button>
			<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/bnmanagerrolevalue/post.html')">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</button>	
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th>ID</th>
                        <th >role_id</th>
                        <th >channel_name</th>
                        <th >channel_id</th>
                        <th >行为类型</th>
                        <th >操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item" varStatus="status">
						 
							<tr>
								<td>${item.id}</td>
								<td>${item.role_id}</td>
								<td>${item.channel_name}</td>
								<td>${item.channel_id}</td>
								<td>${item.action_type}</td>
								<td>
					               <a href="<%=basePath%>manage/bnmanagerrolevalue/${item.id}.html">编辑</a> 
					   			   <a href="javascript:void(0)" onclick="LW.bnmanagerrolevalue.del(${item.id})">删除</a></td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/bnmanagerrolevalue.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/bnmanagerrolevalue.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/bnmanagerrolevalue.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/bnmanagerrolevalue.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_bnmanagerrolevalue_list").parent().attr("class","active");
			$("#page_bnmanagerrolevalue_list").parent().parent().parent().parent().addClass("in");
			LW.bnmanagerrolevalue=new Object();
			LW.bnmanagerrolevalue.del=function(id)
			{
				//LW.message.show(id);
				LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/bnmanagerrolevalue/del/"+id+".html");}});
			}
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>