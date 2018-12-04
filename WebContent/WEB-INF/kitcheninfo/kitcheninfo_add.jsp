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
		<title>${appName}_厨房管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/kitcheninfo.html">厨房管理列表</a></li>
	    		<li>添加厨房管理信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/kitcheninfo/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">厨房管理信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="" maxlength="50" placeholder="名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>地址:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="address" value="" maxlength="50" placeholder="地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>电话号码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="phone" value="" maxlength="50" placeholder="电话号码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>logo:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="logo" value="" maxlength="50" placeholder="logo" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>纬度:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="longitude" value="" maxlength="50" placeholder="纬度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>经度:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="latitude" value="" maxlength="50" placeholder="经度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>备注:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="remark" value="" maxlength="50" placeholder="remark" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						      <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>授权码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="authorkey" value="" maxlength="50" placeholder="授权码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>昵称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="nick_name" value="" maxlength="50" placeholder="昵称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户名:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="user_name" value="" maxlength="50" placeholder="用户名" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>密码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="password" value="" maxlength="50" placeholder="密码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>enable:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="enable" value="" maxlength="50" placeholder="enable" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>联系人:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="contacts" value="" maxlength="50" placeholder="联系人" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>最后登录时间:</td>
						    	<td class="col-md-11">
						    		<input type="text" name="last_login_date" id="edate" style="text-align: left;"
									placeholder="最后登录时间" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>最后登录IP:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="last_login_ip" value="" maxlength="50" placeholder="最后登录IP" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>状态:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="status" value="" maxlength="50" placeholder="状态" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>注册时间:</td>
						    	<td class="col-md-11">
						    		<input type="text" name="regist_date" id="edate" style="text-align: left;"
									placeholder="注册时间" autocomplete="off"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>注册IP:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name=regist_ip value="" maxlength="50" placeholder="注册IP" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>notice:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="notice" value="" maxlength="50" placeholder="notice" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_kitcheninfo_list").parent().attr("class","active");
			$("#page_kitcheninfo_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>