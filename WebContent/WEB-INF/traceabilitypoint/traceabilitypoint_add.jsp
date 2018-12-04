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
		<title>${appName}_朔源系统网点信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>traceabilitypoint/post.html">添加</a></li>
	    		<li>添加朔源系统网点</li>
    		</ul>
    	</div>
		<div class="rightContainer">
<script src="/resources/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>traceabilitypoint/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">朔源系统网点信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>朔源系统网点信息:</td>
						    	<td class="col-md-11">
								<lw:RestaurantSelTag style="class='form-control' name='restaurantId'" value="1"/>	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>name:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="" maxlength="50" placeholder="请输入name" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="address" value="" maxlength="50" placeholder="请输入地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>手机号码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="phone" value="" maxlength="50" placeholder="请输入手机号码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>logo:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="logo" value="" maxlength="50" placeholder="logo" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">经度:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="longitude" value="" maxlength="50" placeholder="请输入用户名" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">纬度:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="latitude" value="" maxlength="50" placeholder="请输入标志" autocomplete="off"   >
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">备注:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="remark" value="" maxlength="50" placeholder="请输入备注" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">authorkey:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="authorkey" value="" maxlength="50" placeholder="authorkey" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">用户名:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user_name" value="" maxlength="50" placeholder="请输入用户名" autocomplete="off" >
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">密码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="password" value="" maxlength="50" placeholder="请输入密码" autocomplete="off" >
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">salt:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="salt" value="" maxlength="50" placeholder="salt" autocomplete="off" >
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">是否有效:</td>
						    	<td class="col-md-11 ">
						    		<select name="enable" class="form-control">
						    		<option value="1" >有效</option>
						    		<option value="0" >无效</option>
						    		</select>					    		
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
			$("#page_traceabilitypoint").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>