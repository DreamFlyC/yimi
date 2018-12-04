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
		<title>${appName}_钉钉消息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manager/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>dingtalkmsg.html">钉钉消息管理</a></li>
	    		<li>添加钉钉消息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
<script src="/resources/My97DatePicker/WdatePicker.js"></script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>dingtalkmsg/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">钉钉信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>钉钉消息:</td>
						    	<td class="col-md-11">
								<lw:RestaurantSelTag style="class='form-control' name='restaurantId'" value="1"/>	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>errcode:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="errcode" value="" maxlength="50" placeholder="errcode" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>返回描述:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="errmsg" value="" maxlength="50" placeholder="返回描述" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>发送结果:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="send_result" value="" maxlength="50" placeholder="发送结果" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>无效用户id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="invalid_user_id_list" value="" maxlength="50" placeholder="无效用户id" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">过滤用户id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="forbidden_user_id_list" value="" maxlength="50" placeholder="过滤用户id" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">发送失败用户id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="failed_user_id_list" value="" maxlength="50" placeholder="发送失败用户id" autocomplete="off"   >
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">已读消息用户id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="read_user_id_list" value="" maxlength="50" placeholder="已读消息用户id" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">未读消息用户id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="unread_user_id_list" value="" maxlength="50" placeholder="未读消息用户id" autocomplete="off" >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">无效部门id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="invalid_dept_id_list" value="" maxlength="50" placeholder="无效部门id" autocomplete="off" >
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
			$("#page_dingtalkmsg").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>