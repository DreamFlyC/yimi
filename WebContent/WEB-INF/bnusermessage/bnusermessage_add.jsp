<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>${appName}_用户消息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/bnusermessage.html">用户消息列表</a></li>
	    		<li>添加用户消息信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/bnusermessage/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">用户消息信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
<table class="table table-bordered">
	<tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="type" value="" maxlength="50" placeholder="type" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>发送者用户名:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="postusername" value="" maxlength="50" placeholder="postusername" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>接收者用户名:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="acceptusername" value="" maxlength="50" placeholder="acceptusername" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>已读:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="isread" value="" maxlength="50" placeholder="isread" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="title" value="" maxlength="50" placeholder="title" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>内容:</td>
    	<td class="col-md-11">
    		<input type="text" class="form-control" name="content" value="" maxlength="50" placeholder="content" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>发送时间:</td>
    	<td class="col-md-11">
    	<input type="text" name="posttime" id="sdate" style="text-align: left;"
			placeholder="发送时间" autocomplete="off"
			onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
			class="form-control" required />
    	</td>
    </tr>
    <tr>
    	<td class="info col-md-1 text-right"><span class="red">*</span>读取时间:</td>
    	<td class="col-md-11">
    	<input type="text" name="readtime" id="sdate" style="text-align: left;"
			placeholder="读取时间" autocomplete="off"
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
			$("#page_bnusermessage_list").parent().attr("class","active");
			$("#page_bnusermessage_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>