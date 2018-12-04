<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
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
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_软件信息日志管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
				<li><a href="<%=basePath%>manage/restaurantsoftinfo.html">软件信息日志列表</a></li>
				<li><a href="<%=basePath%>manage/restaurantsoftinfo/post.html">编辑软件信息日志</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
        <script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js">
        </script>
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/restaurantsoftinfo/edit.html" id="userForm">
				<input type="hidden" name="id" value="${restaurantSoftInfo.id}" />
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">软件信息日志管理</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="${restaurantSoftInfo.name}" maxlength="50" placeholder="请输入名称" autocomplete="off" datatype="*1-50"  nullmsg="请输入名称！" errormsg="名称至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">地址:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="address" value="${restaurantSoftInfo.address}" 
						    		datatype="*1-50"  nullmsg="请输入地址！" errormsg="地址至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入地址" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">电话:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="phone" value="${restaurantSoftInfo.phone}" 
						    		datatype="*1-11"  nullmsg="请输入电话号码！" errormsg="电话号码输入有误！"
						    		maxlength="11" placeholder="请输入电话号码" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">纬度:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="longitude" value="${restaurantSoftInfo.longitude}" 
						    		datatype="*1-50"  nullmsg="纬度不能为空！" errormsg="纬度至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="纬度" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">经度:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="latitude" value="${restaurantSoftInfo.latitude}" 
						    		datatype="*1-50"  nullmsg="经度不能为空！" errormsg="经度至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入经度" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">标记:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="remark" value="${restaurantSoftInfo.remark}" 
						    		datatype="*1-50"  nullmsg="标记不能为空！" errormsg="标记至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入标记" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">authorkey:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="authorkey" value="${restaurantSoftInfo.authorkey}" 
						    		datatype="*1-50"  nullmsg="authorkey不能为空！" errormsg="authorkey至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入authorkey" autocomplete="off"   >
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">描述:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="description" value="${restaurantSoftInfo.description}" 
						    		datatype="*1-50"  nullmsg="描述不能为空" errormsg="描述至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入描述" autocomplete="off"   >
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">是否启用:</td>
						    	<td class="col-md-11">
						    		<input type="radio" name="enable" value="1"  />已启用
						    		<input type="radio" name="enable" value="0"  />未启用
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">最后登录时间:</td>
						    	<td class="col-md-11">
						    	<input type="text" name="lastlogindate" id="sdate" style="text-align: left;"
									placeholder="最后登录时间" 
									value="<fmt:formatDate value='${restaurantSoftInfo.lastlogindate}' pattern='yyyy-MM-dd HH:mm:ss' />"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									class="form-control" datatype="*1-50" nullmsg="最后登录时间不能为空" />
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right">最后登录IP:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="lastloginip" value="${restaurantSoftInfo.lastloginip}" 
						    		datatype="*1-50"  nullmsg="最后登录IP不能为空" errormsg="最后登录IP至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入最后登录IP" autocomplete="off"   >
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">状态码:</td>
						    	<td class="col-md-11">
						    		<input type="number" class="form-control" name="status" value="${restaurantSoftInfo.status}" 
						    		datatype="*1-50"  nullmsg="状态码不能为空" errormsg="状态码至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入状态码" autocomplete="off"   >
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">修改信息:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="upinfo" value="${restaurantSoftInfo.upinfo}" 
						    		datatype="*1-50"  nullmsg="修改信息不能为空" errormsg="修改信息至少1个字符,最多50个字符！"
						    		maxlength="50" placeholder="请输入修改信息" autocomplete="off"   >
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
			$("#page_restaurantsoftinfo").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
		
		<script type="text/javascript">
		$("input:radio[name='enable'][value='${restaurantSoftInfo.enable==true?'1':'0'}']").attr('checked','true');
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>