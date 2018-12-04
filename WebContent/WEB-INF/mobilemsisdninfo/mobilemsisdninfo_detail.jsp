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
		<title>${appName}_物联卡流量管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manager/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>mobilemsisdninfo.html">物联卡流量管理</a></li>
	    		<li>编辑物联卡流量信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>mobilemsisdninfo/edit.html" id="userForm">
				<input type="hidden" name="id" value="${mobilemsisdninfo.id}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">物联卡流量管理</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>返回结果类型:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="type" value="${mobilemsisdninfo.type}" required maxlength="50" placeholder="返回结果类型" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>号码信号列表:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="msisdninfolist" value="${mobilemsisdninfo.msisdninfolist}" required maxlength="50" placeholder="号码信号列表" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>号码信息:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="msisdninfo" value="${mobilemsisdninfo.msisdninfo}" required maxlength="50" placeholder="号码信息" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>号码:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="msisdn" value="${mobilemsisdninfo.msisdn}" required maxlength="50" placeholder="号码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>集成电路卡识别码:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="iccid" value="${mobilemsisdninfo.iccid}" required maxlength="50" placeholder="集成电路卡识别码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>查询结果:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="code" value="${mobilemsisdninfo.code}" required maxlength="50" placeholder="查询结果" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>APN信息列表:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="apnlist" value="${mobilemsisdninfo.apnlist}" required maxlength="50" placeholder="APN信息列表" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>APN信息:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="apninfo" value="${mobilemsisdninfo.apninfo}" required maxlength="50" placeholder="APN信息" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>APN名称:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="apnname" value="${mobilemsisdninfo.apnname}" required maxlength="50" placeholder="APN名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>个人套餐总流量(MB):</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="apninfoTotalflow" value="${mobilemsisdninfo.apninfoTotalflow}" required maxlength="50" placeholder="个人套餐总流量(MB)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>号码已用总流量(MB):</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="apninfoUsedflow" value="${mobilemsisdninfo.apninfoUsedflow}" required maxlength="50" placeholder="号码已用总流量(MB)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>号码剩余总流量(MB):</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="apninfoRestflow" value="${mobilemsisdninfo.apninfoRestflow}" required maxlength="50" placeholder="号码剩余总流量(MB)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐外流量(MB):</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="extrapkgflow" value="${mobilemsisdninfo.extrapkgflow}" required maxlength="50" placeholder="套餐外流量(MB)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>最后一次流量(MB)发生时间:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="lastflowtime" value="${mobilemsisdninfo.lastflowtime}" required maxlength="50" placeholder="最后一次流量(MB)发生时间" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐列表:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkginfolist" value="${mobilemsisdninfo.pkginfolist}" required maxlength="50" placeholder="套餐列表" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐流量(MB):</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkginfo" value="${mobilemsisdninfo.pkginfo}" required maxlength="50" placeholder="套餐流量(MB)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐编码:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkgcode" value="${mobilemsisdninfo.pkgcode}" required maxlength="50" placeholder="套餐编码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐名称:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkgname" value="${mobilemsisdninfo.pkgname}" required maxlength="50" placeholder="套餐名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>产品实例ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="subsprodid" value="${mobilemsisdninfo.subsprodid}" required maxlength="50" placeholder="产品实例ID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐总流量(MB):</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkginfoTotalflow" value="${mobilemsisdninfo.pkginfoTotalflow}" required maxlength="50" placeholder="套餐总流量(MB)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐剩余流量(MB):</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkginfoUsedflow" value="${mobilemsisdninfo.pkginfoUsedflow}" required maxlength="50" placeholder="套餐剩余流量(MB)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
					     	<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>查询错误描述:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="error" value="${mobilemsisdninfo.error}" required maxlength="50" placeholder="查询错误描述" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐生效日期:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkgeffdate" value="${mobilemsisdninfo.pkgeffdate}" required maxlength="50" placeholder="套餐生效日期" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>套餐失效日期:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="pkgexpiredate" value="${mobilemsisdninfo.pkgexpiredate}" required maxlength="50" placeholder="套餐失效日期" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_mobilemsisdninfo").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>