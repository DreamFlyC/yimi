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
		<title>${appName}_相册图片管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
    			<li><a href="<%=basePath%>manage/bnarticlealbums.html">相册图片列表</a></li>
	    		<li>编辑相册图片</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" enctype="multipart/form-data"
			 action="<%=basePath%>manage/bnarticlealbums/edit.html" id="userForm">
				<input type="hidden" name="id" value="${bnArticleAlbums.id}" />
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">编辑相册图片信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						 	<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>articleID</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name=articleid  value="${bnArticleAlbums.articleid}" maxlength="50" nullmsg="articleID" placeholder="articleID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						   <tr>
							<td class="info col-md-1 text-right">上传小图(图片大小不超过2M):</td>
							<td class="col-md-11">
								<input type="file" name="file" id="titlePicFilesmall" style="display:none" onchange="LW.util.uploadImgAdsmall(this)">
								<img id="titlePicImgsmall" src="<%=basePath%>resources/images/no_picture.gif" width="145" height="136" style="cursor:pointer" onclick="$('#titlePicFilesmall').click()">
								<input type="hidden" name="smallimg" id="titlePicPathsmall" value="">
							</td>
						</tr>
						<tr>
							<td class="info col-md-1 text-right">上传大图(图片大小不超过2M):</td>
							<td class="col-md-11">
				                <input type="file" name="file" id="titlePicFilebig" style="display:none" onchange="LW.util.uploadImgAdbig(this)">
								<img id="titlePicImgbig" src="<%=basePath%>resources/images/no_picture.gif" width="145" height="136" style="cursor:pointer" onclick="$('#titlePicFilebig').click()">
								<input type="hidden" name="bigimg" id="titlePicPathbig" value="">
							</td>
						</tr>
					     <tr>
					    	<td class="info col-md-1 text-right"><span class="red">*</span>备注：</td>
					    	<td class="col-md-11">
					    		<input type="number" class="form-control" name="remark" value="${bnArticleAlbums.remark}" maxlength="50"  placeholder="uid" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_bnarticlealbums_list").parent().attr("class","active");
			$("#page_bnarticlealbums_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>