﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>  
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
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
   pageContext.setAttribute("id",request.getParameter("id").trim());
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
		<title>${appName}_配送分类管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/bndistribution.html">配送分类管理列表</a></li>
	    		<li>修改配送分类管理信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/bndistribution/edit.html" id="userForm">
				<input type="hidden" name="id" value="${bnDistribution.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">配送分类管理信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="${bnDistribution.title}" maxlength="50" placeholder="标题" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>备注:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="remark" value="${bnDistribution.remark}" maxlength="50" placeholder="备注" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="type" value="${bnDistribution.type}" maxlength="50" placeholder="类型" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>数量:</td>
						    	<td class="col-md-11">
						    		<input type="number" step="0.01" class="form-control" name="amount" value="${bnDistribution.amount}" maxlength="50" placeholder="amount" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>sort_id:</td>
						    	<td class="col-md-11">
						    		<input type="number" step="1" class="form-control" name="sort_id" value="${bnDistribution.sort_id}" maxlength="50" placeholder="sort_id" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>is_lock:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="is_lock" value="${bnDistribution.is_lock}" maxlength="50" placeholder="is_lock" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						   
					    </table>    			
					   <div class="col-md-12 text-center">
					      <button type="submit" class="btn btn-primary btn-lg">保 存</button>
					   </div>
				   </div>
			   	</div>
			</form>		
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_bndistribution_list").parent().attr("class","active");
			$("#page_bndistribution_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>