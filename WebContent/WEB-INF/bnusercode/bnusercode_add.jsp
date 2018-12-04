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
		<title>${appName}_用户编号管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/bnusercode.html">用户编号列表</a></li>
	    		<li>添加用户编号信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/bnusercode/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">用户编号信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
<table class="table table-bordered">
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>userid</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="userid" value="" maxlength="50" placeholder="userid" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>用户名:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="username" value="" maxlength="50" placeholder="username" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="type" value="" maxlength="50" placeholder="type" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>strcode:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="strcode" value="" maxlength="50" placeholder="strcode" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>总数:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="count" value="" maxlength="50" placeholder="count" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>状态:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="status" value="" maxlength="50" placeholder="status" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>efftime:</td>
    	<td class="col-md-11">
    		<input type="text" name="efftime" id="sdate" style="text-align: left;"
			placeholder="efftime" autocomplete="off"
			onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
			class="form-control" required />
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
			$("#page_bnusercode_list").parent().attr("class","active");
			$("#page_bnusercode_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>