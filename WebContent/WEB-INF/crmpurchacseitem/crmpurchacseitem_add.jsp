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
		<title>${appName}采购明细管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/crmpurchacseitem/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmpurchacseitem/post.html">添加</a></li>
	    		<li>添加采购明细管理信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<%--<script src="<%=basePath%>/resources/My97DatePicker/WdatePicker.js"></script>--%>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmpurchacseitem/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">采购明细管理信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>采购编号:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="number" value="" maxlength="50" placeholder="请输入采购编号" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">采购数量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="num" value="" maxlength="50" placeholder="请输入采购数量" autocomplete="off" >
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">供应商ID:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="sid" value="" maxlength="50" placeholder="请输入供应商ID" autocomplete="off"   >
						    	</td>
						    </tr>					    
						    <tr>
						    	<td class="info col-md-1 text-right">标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="" maxlength="50" placeholder="请输入标题" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">产品名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="" maxlength="50" placeholder="请输入产品名称" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">申请日期:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="date" value=""  onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  maxlength="30" placeholder="请输入申请日期" autocomplete="off"    >
						    	</td>
						    </tr> 
							<tr>
						    	<td class="info col-md-1 text-right">申请人ID:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="uid" value="" maxlength="50" placeholder="请输入申请人ID" autocomplete="off"   >
						    	</td>
						    </tr>					    
						    <tr>
						    	<td class="info col-md-1 text-right">采购产品单价:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="price" value="" maxlength="50" placeholder="请输入采购产品单价" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">注解:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="note" value="" maxlength="50" placeholder="请输入注解" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">类型:</td>
						    	<td class="col-md-11">
						    		<select class='form-control' name="type" style="widows: 100%">
						    			<option value="0"  >0</option>
										<option value="1"  >1</option>
						    		</select>
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">仓库id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="stock_info_id" value="" maxlength="50" placeholder="请输入仓库id" autocomplete="off"   >
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
			$("#page_crmpurchacseitem").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>