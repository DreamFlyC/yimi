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
		
		<title>${appName}_套餐明细管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/foodsetmealitem.html">套餐明细列表</a></li>
	    		<li>修改套餐明细</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/foodsetmealitem/edit.html" id="userForm">
				<input type="hidden" name="id" value="${foodSetMealItem.id}"> 
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">配送跟踪线路图信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right">名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="${foodSetMealItem.name}" maxlength="50" placeholder="请输入名称" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">英文名:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="en_name" value="${foodSetMealItem.en_name}" maxlength="50" placeholder="请输入英文名" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">logo:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="logo" value="${foodSetMealItem.logo}" maxlength="50" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">type:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="type" value="${foodSetMealItem.type}" maxlength="50" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">单位:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="unit" value="${foodSetMealItem.unit}" maxlength="50"  autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">用量:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="used_val" value="${foodSetMealItem.used_val}" maxlength="50" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">food_set_meal_id:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="food_set_meal_id" value="${foodSetMealItem.food_set_meal_id}" maxlength="50" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
								<td class="info col-md-1 text-right">food_info_id:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="food_set_meal_id" value="${foodSetMealItem.food_info_id}" maxlength="50" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
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
			$("#page_foodsetmealitem_list").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>