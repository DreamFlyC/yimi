<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.awt.Image,java.awt.image.*,com.sun.image.codec.jpeg.*,java.sql.*,com.jspsmart.upload.*,java.util.*"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_官网新闻管理</title>
<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/bootstrap-fileinput.css" />
<script type="text/javascript" src="<%=basePath%>resources/adpic/js/bootstrap-fileinput.js"></script>
</head>

<body>
	<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>yiminews/index.html">首页</a></li>
    			<li><a href="<%=basePath%>yiminews.html">官网新闻管理</a></li>
	    		<li><a href="javascript:void(0);">添加官网新闻信息</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<form class="form-horizontal" role="form" name="form1" id="userForm"
			enctype="multipart/form-data" method="post"
			action="<%=basePath%>yiminews/post.html">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td class="info col-md-1 text-right"><span class="red">*</span>标&nbsp;&nbsp;题:</td>
					<td class="col-md-11">
						<input type="text" class="form-control" maxlength="50" name="title" id="title" placeholder="请输入标题" autocomplete="off" datatype="s1-10" nullmsg="请输入标题！">
					</td>
				</tr>
				<tr>
					<td class="info col-md-1 text-right"><span class="red">*</span>链&nbsp;&nbsp;接:</td>
					<td class="c  l-md-11">
						<input type="text" class="form-control" name="url" id="url" maxlength="100" placeholder="请输入链接" autocomplete="off" datatype="e" nullmsg="请输入链接！">
					</td>
				</tr>
				<tr>
					<td class="info col-md-1 text-right"><span class="red">*</span>新闻类型:</td>
					<td class="c  l-md-11">
						<input type="radio" name="type" value="2" id="wordtype" onclick="clickRadio(this.value)"  checked="checked" />文字新闻
						<input type="radio" name="type" value="1" id="pictype" onclick="clickRadio(this.value)" />图片新闻
					</td>
				</tr>
				<tr id="pic" style="display: none;">
					<td class="info col-md-1 text-right"><span class="red">*</span>图&nbsp;&nbsp;片:</td>
					<td class="col-md-11">
								<div class="fileinput fileinput-new" data-provides="fileinput">
									<div class="fileinput-preview fileinput-exists thumbnail"
										style="max-width: 200px; max-height: 150px;" runat="server"
										id="imgurl"></div>
									<div>
										<span class="btn btn-default btn-file"> 
										<span class="fileinput-new">选择文件</span>
										<span class="fileinput-exists">换一张</span>
										<input type="file" name="image" id="image" accept="image/gif,image/jpeg,image/x-png" /></span> 
										<a href="javascript:;"class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除 </a>
									</div>
								</div>
				</tr>
				<tr>
					<td class="info col-md-1 text-right"><span class="red">*</span>内&nbsp;&nbsp;容:</td>
					<td class="col-md-11">
						<textarea rows="50" class="form-control" name="content" id="content" 
						placeholder="请输入描述:" autocomplete="off" style="width: 100%;height: 300px;">
						</textarea>
					</td>
				</tr>
				<tr>
					<td class="info col-md-1 text-right">置顶级别:<br />
						(数字越小级别越大)
					</td>
					<td class="col-md-11">
						<select name="istop" class="form-control">
							<option value="99" selected="selected">不置顶</option>
							<option value="1">置顶1</option>
							<option value="2">置顶2</option>
							<option value="3">置顶3</option>
							<option value="4">置顶4</option>
							<option value="5">置顶5</option>
							<option value="6">置顶6</option>
							<option value="7">置顶7</option>
							<option value="8">置顶8</option>
							<option value="9">置顶9</option>
							<option value="10">置顶10</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="info col-md-1 text-right"><span class="red">*</span>关键字:</td>
					<td class="col-md-11">
						<input type="text" class="form-control" name="seoKeywords" id="seoKeywords" value="" maxlength="200" placeholder="请输入关键字" autocomplete="off">
					</td>
				</tr>
				<tr>
					<td class="info col-md-1 text-right">描述:</td>
					<td class="col-md-11">
						<input type="text" class="form-control" name="seoDescribe" id="seoDescribe" 
						placeholder="请输入描述:" autocomplete="off"  />
					</td>
				</tr>  
			</tbody>
		</table>
		<div class="col-md-12 text-center">
			<button type="submit" class="btn btn-primary btn-lg">保 存</button>
		</div>
	</form>
	<div class="cls"></div>
    	<%@ include file="../foot.jsp"%>
    	<script type="text/javascript">
    		LW.util.createSimpleEditor("content");
    	</script>
    	
    	<script type="text/javascript">
    	function clickRadio(value){
			var type=$("input[type='radio']:checked").val();
		//	LW.message.show(type);
			if(type==1){
				$("#pic").show();
			}else{
				 $("#pic").hide();
			}
    	}
    	</script>
    	
    	<script type="text/javascript">
			$("#page_yiminews").parent().attr("class","active");
		</script>
</body>
</html>