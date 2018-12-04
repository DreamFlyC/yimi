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
		<title>${appName}_套餐明细分类管理</title>
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
	    		<li><a href="javascript:void(0);">套餐明细分类管理</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/foodsetmealitemtype/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table  table-hover table-bordered">
				<thead>
					<tr>
						<th >id</th>
						<th width="12%">名称</th>
                        <th >英文名</th>
                        <th >logo</th>
						<th >添加时间</th>
                        <th >修改时间</th>
                        <th >parent_id</th>
                        <th width="15%">操作</th>
					</tr>
				</thead>
				<tbody>
                    <c:forEach items="${pager.datas}" var="item" varStatus="stauts" >
						<tr id="tr${item.id}">
							<%-- <td>${stauts.index+1}</td> --%>
							<td id="${item.id}">${item.id}</td>
							<td id="view" onclick="show(${item.id},1);">${item.name}
							</td>
							<td>${item.en_name}</td>
							<td>${item.logo}</td>
							<td><fmt:formatDate value="${item.adddate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td><fmt:formatDate value="${item.editdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
							<td>${item.parent_id}</td>
							<td>
				               <a href="<%=basePath%>manage/foodsetmealitemtype/${item.id}.html">编辑</a>  
				               <a href="javascript:void(0)" onclick="LW.foodsetmealitemtype.delete(${item.id},${item.parent_id})" >删除</a>
				            </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/foodsetmealitemtype.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/foodsetmealitemtype.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/foodsetmealitemtype.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/foodsetmealitemtype.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_foodsetmealitemtype_list").parent().attr("class","active");
			LW.foodsetmealitemtype=new Object();
			LW.foodsetmealitemtype.delete=function(id,parent_id)
			{
				LW.message.confirm("id","确定要删除吗？",function(r){if(r){LW.location.forward("manage/foodsetmealitemtype/del/"+id+".html");}});
			}
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>