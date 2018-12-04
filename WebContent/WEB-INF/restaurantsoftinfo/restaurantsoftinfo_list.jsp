<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>  
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
		<title>${appName}_软件信息日志管理</title>
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
	    		<li><a href="<%=basePath%>manage/restaurantsoftinfo.html">软件信息日志列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/restaurantsoftinfo/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>	
				
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th >ID </th>
						<th >名称</th>
						<th >地址</th>
                        <th >电话</th>
						<th >纬度</th> 
						<th >经度</th>
	                    <th >标记</th>
	                    <th >authorkey</th>
						<th >描述</th>
						<th >启用</th>
						<th >最后登录时间</th> 
						<th >最后登录IP</th>
	                    <th >状态码</th>
	                    <th >修改信息</th>
						<th >修改时间</th>
						<th >操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item">
							<tr>
								<td>${item.id}</td>
								<td>${item.name}</td>
								<td>${item.address}</td>
                                <td>${item.phone}</td>
                                <td>${item.longitude}</td>
                                <td>${item.latitude}</td>
                                <td>${item.remark}</td>
                                <td>${item.authorkey}</td>
								<td>${item.description}</td>
                                <td>${item.enable==true?"已启用":"未启用"}</td>
                                <td>
                               	 	<fmt:formatDate value="${item.lastlogindate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                </td>
                                <td>${item.lastloginip}</td>
                                <td>${item.status}</td>
                                <td>${item.upinfo}</td>
                                <td>
                               	 	<fmt:formatDate value="${item.update}" pattern="yyyy-MM-dd HH:mm:ss" />
                                </td>
								<td>
					               <a href="<%=basePath%>manage/restaurantsoftinfo/${item.id}.html">编辑</a> 
					               <a href="javascript:void(0)" onclick="LW.restaurantsoftinfo.del(${item.id})" >删除</a>
				               </td>
							</tr>	 
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>restaurantsoftinfo.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>restaurantsoftinfo.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>restaurantsoftinfo.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>restaurantsoftinfo.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_restaurantsoftinfo").parent().attr("class","active");	
			LW.restaurantsoftinfo=new Object();
			LW.restaurantsoftinfo.del=function(id)
			{
				LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/restaurantsoftinfo/del/"+id+".html");}});
			}
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
