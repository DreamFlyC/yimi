<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat();
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
   pageContext.setAttribute("lotteryid",request.getParameter("lotteryid").trim());
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
		<title>${appName}_配送跟踪线路图信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>traceabilitytype">朔源系统网点信息管理</a></li>
	    		<li>朔源系统网点列表信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>traceabilitytype/edit.html" id="userForm">
	 		<input type="hidden" name="id" value="${traceabilityType.id}"/>
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">朔源系统网点信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>:</td>
						    	<td class="col-md-11">
						    		<lw:RestaurantSelTag style="class='form-control' name='id'" value="${traceabilityType.id}"/>
								</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">name:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="${traceabilityType.name}" maxlength="50" placeholder="name" autocomplete="off">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">parent_id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="parent_id" value="${traceabilityType.parent_id}" maxlength="20" placeholder="parent_id" autocomplete="off"    >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">point_id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="point_id" value="${traceabilityType.point_id}" maxlength="50" placeholder="point_id" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">type_id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="type_id" value="${traceabilityType.type_id}" maxlength="20" placeholder="type_id" autocomplete="off"    >
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
			$("#page_traceabilityType").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>