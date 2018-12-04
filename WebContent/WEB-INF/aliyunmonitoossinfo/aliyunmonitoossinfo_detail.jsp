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
		<title>${appName}_阿里云预设监控管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manager/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>aliyunmonitoossinfo.html">阿里云预设监控管理</a></li>
	    		<li>添加阿里云预设监控信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
<script src="/resources/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>aliyunmonitoossinfo/edit.html" id="userForm">
				<input type="hidden" name="id" value="${aliyunmonitoossinfo.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">钉钉信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>阿里云预设监控:</td>
						    	<td class="col-md-11">
								<lw:RestaurantSelTag style="class='form-control' name='restaurantId'" value="1"/>	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>连接数使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="connectionusage" value="${aliyunmonitoossinfo.connectionusage}" maxlength="50" placeholder="连接数使用率" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>已用连接数:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="usedconnection" value="${aliyunmonitoossinfo.usedconnection}" maxlength="50" placeholder=">已用连接数" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>CPU使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="cpuusage" value="${aliyunmonitoossinfo.cpuusage}" maxlength="50" placeholder="CPU使用率" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>操作失败数:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="cailedcount" value="${aliyunmonitoossinfo.cailedcount}" maxlength="50" placeholder="操作失败数" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">写入网络带宽:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="intranetin" value="${aliyunmonitoossinfo.intranetin}" maxlength="50" placeholder="写入网络带宽" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">写入带宽使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="intranetinratio" value="${aliyunmonitoossinfo.intranetinratio}" maxlength="50" placeholder="写入带宽使用率" autocomplete="off"   >
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">读取网络带宽:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="intranetout" value="${aliyunmonitoossinfo.intranetout}" maxlength="50" placeholder="读取网络带宽" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">读取带宽使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="intranetoutratio" value="${aliyunmonitoossinfo.intranetoutratio}" maxlength="50" placeholder="读取带宽使用率" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">内存使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="memoryusage" value="${aliyunmonitoossinfo.memoryusage}" maxlength="50" placeholder="内存使用率" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">内存使用量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="usedmemory" value="${aliyunmonitoossinfo.usedmemory}" maxlength="50" placeholder="内存使用量" autocomplete="off" >
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
			$("#page_aliyunmonitoossinfo").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>