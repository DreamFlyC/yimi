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
		<title>${appName}_分类信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmstocktype/crmstocktype_list.html">进出货分类列表</a></li>
	    		<li>编辑分类</li>
    		</ul>
    	</div>
		<div class="rightContainer">
<script src="/resources/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmstocktype/post.html" id="userForm">
				<input type="hidden" name="id" id="id" value="${crmStockType.id}" />
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">分类信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="${crmStockType.name}" maxlength="50" nullmsg="请输入名称" placeholder="请输入名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>备注:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="remark" value="${crmStockType.remark}" maxlength="50" nullmsg="请输入备注" placeholder="请输入备注" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>权重:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="seq" value="${crmStockType.seq}" maxlength="50" nullmsg="请输入权重" placeholder="权重" autocomplete="off" datatype="*1-3" errormsg="至少1个字符,最多3个字符！">
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
			$("#page_crmstocktype_list").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>