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
		<%-- <link href="<%=basePath%>resources/plugin/bootstrap3.3.2/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=basePath%>resources/css/system.css" rel="stylesheet" type="text/css" />
		<script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>resources/plugin/bootstrap3.3.2/js/bootstrap.min.js"></script>  
		<script src="<%=basePath%>resources/js/weixin.js"></script>
		<script src="<%=basePath%>resources/duty/js/My97DatePicker/WdatePicker.js"></script>
		<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/fileinput.min.css" />
		<script type="text/javascript" src="<%=basePath%>resources/adpic/js/fileinput.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>resources/adpic/js/zh.js"></script>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
		
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
	    		<li>添加广告图片信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" name="form1" id="userForm" enctype="multipart/form-data" method="post" action="<%=basePath%>adpic/post.html" >
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">广告图片信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
						    	<td class="col-md-10">
						    		<select name="type" id="type" class="form-control">
						    			<option value="0" selected="selected">请选择分类</option>
						    			<option value="1" >1</option>
						    			<option value="2" >2</option>
						    			<option value="3" >3</option>
						    			<option value="4" >4</option>
						    			<option value="5" >5</option>
						    		</select>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="" maxlength="50" placeholder="请输入标题" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">上传小图:</td>
						    	<td class="col-md-11">
						    		<input type="file" name="small" class="form-control" />
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">上传大图:</td>
						    	<td class="col-md-11">
						    		<input type="file" name="large" class="form-control" />
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">描述</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="description" style="width: 100%; height: 200px; text-align: left;" value=""  maxlength="50" placeholder="请详细描述" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">是否展示:</td>
						    	<td class="col-md-11 ">
						    		<select name="isshow" class="form-control">
						    		<option value="1" >是</option>
						    		<option value="0" >否</option>
						    		</select>					    		
						    	</td>
						    </tr>
							  <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>开始时间:</td>
						    	<td class="col-md-11">
						    	<input type="text" name="starttime" id="sdate" style="text-align: left;"
									placeholder="请选择开始时间"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>结束时间:</td>
						    	<td class="col-md-11">
								<input type="text" name="endtime" id="edate" style="text-align: left;"
									placeholder="请选择结束时间"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />						    	</td>
						    </tr>
					    </div>
					    </table>    			
				   </div>
					   <div class="col-md-12 text-center">
					      <button type="submit" class="btn btn-primary btn-lg">保 存</button>
					   </div>
			   	</div>
			</form>		
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_adpic").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>