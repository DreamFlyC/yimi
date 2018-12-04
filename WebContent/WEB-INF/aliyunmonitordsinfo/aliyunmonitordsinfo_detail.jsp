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
	    		<li><a href="<%=basePath%>aliyunmonitordsinfo.html">阿里云预设监控管理</a></li>
	    		<li>编辑阿里云预设监控信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
<script src="/resources/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>aliyunmonitordsinfo/edit.html" id="userForm">
				<input type="hidden" name="id" value="${aliyunmonitordsinfo.id}">
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
						    	<td class="info col-md-1 text-right"><span class="red">*</span>CPU使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="cpuusage" value="${aliyunmonitordsinfo.cpuusage }" maxlength="50" placeholder="CPU使用率" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>磁盘使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="diskusage" value="${aliyunmonitordsinfo.diskusage }" maxlength="50" placeholder="磁盘使用率" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>IOPS使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="iopsusage" value="${aliyunmonitordsinfo.iopsusage }" maxlength="50" placeholder="IOPS使用率" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>连接数使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="connectionusage" value="${aliyunmonitordsinfo.connectionusage }" maxlength="50" placeholder="连接数使用率" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">只读实例延迟:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="datadelay" value="${aliyunmonitordsinfo.datadelay }" maxlength="50" placeholder="只读实例延迟" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">内存使用率:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="memoryusage" value="${aliyunmonitordsinfo.memoryusage }" maxlength="50" placeholder="内存使用率" autocomplete="off"   >
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">Mysql每秒网络入流量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="mysqlNetworkinnew" value="${aliyunmonitordsinfo.mysqlNetworkinnew }" maxlength="50" placeholder="Mysql每秒网络入流量" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">Mysql每秒网络出流量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="mysqlNetworkoutnew" value="${aliyunmonitordsinfo.mysqlNetworkoutnew }" maxlength="50" placeholder="Mysql每秒网络出流量" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">SQLServe每秒网络入流量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="sqlserverNetworkinnew" value="${aliyunmonitordsinfo.sqlserverNetworkinnew }" maxlength="50" placeholder="SQLServe每秒网络入流量" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">SQLServe每秒网络出流量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="sqlserverNetworkoutnew" value="${aliyunmonitordsinfo.sqlserverNetworkoutnew }" maxlength="50" placeholder="SQLServe每秒网络出流量" autocomplete="off" >
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
			$("#page_aliyunmonitordsinfo").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>