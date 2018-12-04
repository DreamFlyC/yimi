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
		<title>${appName}_留言通知管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/bnfeedback.html">留言通知管理列表</a></li>
	    		<li>修改留言通知管理信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/bnfeedback/edit.html" id="userForm">
				<input type="hidden" name="id" value="${bnFeedBack.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">留言通知管理信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="${bnFeedBack.title}" maxlength="50" placeholder="标题" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>留言内容:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="content" value="${bnFeedBack.content}" maxlength="50" placeholder="留言内容" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户名:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user_name" value="${bnFeedBack.user_name}" maxlength="50" placeholder="用户名" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>电话号码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user_tel" value="${bnFeedBack.user_tel}" maxlength="50" placeholder="telephone" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>QQ:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user_qq" value="${bnFeedBack.user_qq}" maxlength="50" placeholder="QQ" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>邮箱:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user_email" value="${bnFeedBack.user_email}" maxlength="50" placeholder="email" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>回应内容:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="reply_content" value="${bnFeedBack.reply_content}" maxlength="50" placeholder="回应内容" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>回应时间:</td>
						    	<td class="col-md-11">
						    	<input type="text" name="reply_time" id="reply_time" style="text-align: left;"
									placeholder="发送时间" autocomplete="off"
									value="<fmt:formatDate value='${bnFeedBack.reply_time}' pattern='yyyy-MM-dd HH:mm:ss' />"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>is_lock:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="is_lock" value="${bnFeedBack.is_lock}" maxlength="50" placeholder="is_lock" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_bnfeedback_list").parent().attr("class","active");
			$("#page_bnfeedback_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>