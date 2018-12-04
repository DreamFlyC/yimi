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
		<%-- <%@ include file="../tag.jsp" %> --%>
		<title>${appName}_朔源系统网点信息管理</title>
		<link href="<%=basePath%>resources/plugin/bootstrap3.3.2/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=basePath%>resources/css/system.css" rel="stylesheet" type="text/css" />
		<script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=basePath%>resources/plugin/bootstrap3.3.2/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>resources/duty/js/My97DatePicker/WdatePicker.js"></script>
		<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/bootstrap-fileinput.css" />
		<script type="text/javascript" src="<%=basePath%>resources/adpic/js/bootstrap-fileinput.js"></script>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>adpic.html">广告图片列表</a></li>
	    		<li>修改广告图片信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" name="form1" id=userForm enctype="multipart/form-data" method="post" action="<%=basePath%>adpic/edit.html" >
				<input type="hidden" name="id" id="id" value="${adpic.id}" />
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">广告图片信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"> 类型:</td>
						    	<td class="col-md-11">
						    		<select name="type" id="type" class="form-control">
						    			<option value="${adpic.type}" selected="selected">${adpic.type}</option>
						    			<option value="1" >1</option>
						    			<option value="2" >2</option>
						    			<option value="3" >3</option>
						    			<option value="4" >4</option>
						    			<option value="5" >5</option>
						    		</select>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"> 上传大图:</td>
						    	<td class="col-md-11">
						    		<img alt="大图" id="largepic" src="/upload/images/${adpic.largepic}" width="100" height="100">
						    		<div class="fileinput fileinput-new" data-provides="fileinput"
									id="large">
										<div class="fileinput-preview fileinput-exists thumbnail"
											style="max-width: 200px; max-height: 150px;" runat="server"
											id="imgurl"></div>
										<div id="lg">
											<span class="btn btn-default btn-file"> 
											<span class="fileinput-new">选择文件</span>
											<span class="fileinput-exists">换一张</span> 
											<input type="file"name="large" accept="image/gif,image/jpeg,image/x-png" />
											</span>
											 <a href="javascript:;"class="btn btn-warning fileinput-exists"
												data-dismiss="fileinput" id="lgremove">移除 </a>
										</div>
									</div>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"> 上传小图:</td>
						    	<td class="col-md-11">
						    		<img alt="小图" id="smallpic" src="/upload/images/${adpic.smallpic}" width="100" height="100">
						    		<div class="fileinput fileinput-new" data-provides="fileinput"
									id="small">
										<div class="fileinput-preview fileinput-exists thumbnail"
											style="max-width: 200px; max-height: 150px;" runat="server"
											id="imgurl"></div>
										<div id="sm">
											<span class="btn btn-default btn-file"> 
											<span class="fileinput-new" id="smallnew">选择文件</span>
											<span class="fileinput-exists">换一张</span>
											<input type="file" name="small" accept="image/gif,image/jpeg,image/x-png" /></span> 
											<a href="javascript:;"class="btn btn-warning fileinput-exists"
											 id="smremove" data-dismiss="fileinput">移除 </a>
										</div>
									</div>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"> 标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="${adpic.title}" maxlength="50" placeholder="请输入标题" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right">描述</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="description" 
						    		style="width: 100%; height: 200px; text-align: left;" value="${adpic.description}"  maxlength="50" placeholder="请详细描述" autocomplete="off" datatype="*1-50"  errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right">是否展示:</td>
						    	<td class="col-md-11 ">
						    		<select name="isshow" class="form-control">
						    		<option value="${adpic.isshow}" >${adpic.isshow==true?"是":"否"}</option>
						    		<option value="1" >是</option>
						    		<option value="0" >否</option>
						    		</select>					    		
						    	</td>
						    </tr>
							  <tr>
						    	<td class="info col-md-1 text-right"> 开始时间:</td>
						    	<td class="col-md-11">
						    	<input type="text" name="starttime" id="sdate" style="text-align: left;"
									placeholder="请选择开始时间" value="${adpic.starttime}"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"> 结束时间:</td>
						    	<td class="col-md-11">
								<input type="text" name="endtime" id="edate" style="text-align: left;"
									placeholder="请选择结束时间" value="${adpic.endtime}"
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" onchange=""
									class="form-control" required />						    	</td>
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
			$("#small").click(function(){
				$("#smallpic").hide();
			});
			$(document).on('click','#smremove',function(){ 
				$("#smallpic").show();
				/* $("#small").remove(); */
			});
			$("#large").click(function(){
				$("#largepic").hide();
			});
			$(document).on('click','#lgremove',function(){ 
				$("#largepic").show();
				/* $("#large").remove(); */
			});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>