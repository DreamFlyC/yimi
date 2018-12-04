<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
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
	    		<li><a href="<%=basePath%>/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>/yiminews.html">官网新闻</a></li>
	    		<li>编辑官网新闻信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="yiminews/edit" enctype="multipart/form-data" id="userForm">
	 			<input type="hidden" name="id" value="${yimiNews.id}"/>
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">官网新闻信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>官网新闻:</td>
						     	<td class="col-md-11">
						    	</td>
						    </tr>
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>新闻标题:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="title" value="${yimiNews.title}" maxlength="50" placeholder="请输入出品一级分类" autocomplete="off" datatype="*1-50"  nullmsg="请输入出品一级分类！" errormsg="出品一级分类至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <td class="info col-md-1 text-right"><span class="red">*</span>新闻类型:</td>
							<td class="c  l-md-11">
								${yimiNews.type==1?"图片新闻":"文字新闻"}
							</td>
							<c:if test="${yimiNews.type==1}">
						    <tr>
						    	<td class="info col-md-1 text-right"> 新闻图片:</td>
						    	<td class="col-md-11">
						    		<img alt="小图" id="smallpic" src="/upload/images/${yimiNews.img}" width="100" height="100">
						    		<div class="fileinput fileinput-new" data-provides="fileinput"
									id="small">
										<div class="fileinput-preview fileinput-exists thumbnail"
											style="max-width: 200px; max-height: 150px;" runat="server"
											id="imgurl"></div>
										<div id="sm">
											<span class="btn btn-default btn-file"> 
											<span class="fileinput-new" id="smallnew">选择文件</span>
											<span class="fileinput-exists">换一张</span>
											<input type="file" name="image" accept="image/gif,image/jpeg,image/x-png" /></span> 
											<a href="javascript:;"class="btn btn-warning fileinput-exists"
											 id="smremove" data-dismiss="fileinput">移除 </a>
										</div>
									</div>
						    	</td>
						    </tr>
						    </c:if>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>新闻内容:</td>
						    	<td class="col-md-11">
						    		<textarea rows="50" style="width: 100%;height: 300px;" class="form-control" name="content" id="content" > ${yimiNews.content}</textarea>
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right">置顶级别:<br />(数字越小级别越大)</td>
						    	<td class="col-md-11">
									<select name="istop" class="form-control">
										<option value="${yimiNews.istop}" selected="selected">置顶${yimiNews.istop}</option>
										<option value="0">不置顶</option>
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
						    	<td class="info col-md-1 text-right"><span class="red">*</span>新闻关键词:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="seoKeywords" value="${yimiNews.seoKeywords}" maxlength="50" placeholder="请输入出品一级分类" autocomplete="off" datatype="*1-50"  nullmsg="请输入出品一级分类！" errormsg="出品一级分类至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>新闻描述:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="seoDescribe" value="${yimiNews.seoDescribe}" maxlength="50" placeholder="请输入出品一级分类" autocomplete="off" datatype="*1-50"  nullmsg="请输入出品一级分类！" errormsg="出品一级分类至少1个字符,最多50个字符！">
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
    	
    	<script type="text/javascript">
			$("#small").click(function(){
				$("#smallpic").hide();
			});
			$(document).on('click','#smremove',function(){ 
				$("#smallpic").show();
			});
			
    		LW.util.createSimpleEditor("content");
    		
			$("#page_yiminews").parent().attr("class","active");
    	</script>
    	<div class="cls"></div>
	</body>
</html>