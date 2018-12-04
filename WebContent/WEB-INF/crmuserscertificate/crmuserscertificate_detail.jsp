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
		<title>${appName}_证件管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/crmuserscertificate.html">证件管理列表</a></li>
	    		<li>修改证件管理信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/crmuserscertificate/edit.html" id="userForm">
				<input type="hidden" name="id" value="${crmUserScertificate.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">证件管理信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>userID:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user_id" value="${crmUserScertificate.user_id}" maxlength="50" placeholder="userID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>开始日期:</td>
						    	<td class="col-md-11">
						    		<input
									class="form-control" style="  text-align: left;" type="text" name="startdate" id="startdate" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${crmUserScertificate.startdate}' pattern='yyyy-MM-dd HH:mm:ss' />">
						    	</td>
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>结束日期:</td>
						    	<td class="col-md-11">
						    		<input
									class="form-control" style="  text-align: left;" type="text" name="enddate" id="enddate" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${crmUserScertificate.enddate}' pattern='yyyy-MM-dd HH:mm:ss' />">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>附件:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="appendix" value="${crmUserScertificate.appendix}" maxlength="50" placeholder="appendix" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>类型:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="type" value="${crmUserScertificate.type}" maxlength="50" placeholder="类型" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>性别:</td>
						    	<td class="col-md-11">
						    		<input type="radio" name="sex" value="1">男
						    		<input type="radio" name="sex" value="2">女
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>年龄:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="age" value="${crmUserScertificate.age}" maxlength="50" placeholder="年龄" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
    		$("input:radio[name='sex'][value='${crmUserScertificate.sex}']").attr('checked','true');
			$("#page_crmuserscertificate_list").parent().attr("class","active");
			$("#page_crmuserscertificate_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>