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
		<title>${appName}_运营商基本信息管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>manage/tpartnerbasicinfo.html">运营商基本信息管理列表</a></li>
	    		<li>添加运营商基本信息管理信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>manage/tpartnerbasicinfo/edit.html" id="userForm">
				<input type="hidden" name="id" value="${tPartnerBasicInfo.partnerId}">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">运营商基本信息管理信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>上级运营商:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="parentPartnerId" value="${tPartnerBasicInfo.parentPartnerId}" maxlength="50" placeholder="上级运营商" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>运营商编码:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="code" value="${tPartnerBasicInfo.code}" maxlength="50" placeholder="运营商编码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>运营商名称:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="name" value="${tPartnerBasicInfo.name}" maxlength="50" placeholder="运营商名称" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>所在地省:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="province" value="${tPartnerBasicInfo.province}" maxlength="50" placeholder="所在地省" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>所在地市:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="city" value="${tPartnerBasicInfo.city}" maxlength="50" placeholder="所在地市" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>所在地区县:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="district" value="${tPartnerBasicInfo.district}" maxlength="50" placeholder="所在地区县" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>所在地详细地址:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="address" value="${tPartnerBasicInfo.address}" maxlength="50" placeholder="所在地详细地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						      <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>联系人姓名:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="contacterName" value="${tPartnerBasicInfo.contacterName}" maxlength="50" placeholder="联系人姓名" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>联系人手机:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="contacterMobile" value="${tPartnerBasicInfo.contacterMobile}" maxlength="50" placeholder="联系人手机" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>联系人座机:</td>
						    	<td class="col-md-11">
						    		<input type="text" class="form-control" name="contacterTelephone" value="${tPartnerBasicInfo.contacterTelephone}" maxlength="50" placeholder="联系人座机" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							
							
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>联系人邮箱:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="contacterEmail" value="${tPartnerBasicInfo.contacterEmail}" maxlength="50" placeholder="联系人邮箱" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>联系人证件类型:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="contacterCertificateType" value="${tPartnerBasicInfo.contacterCertificateType}" maxlength="50" placeholder="联系人证件类型" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>联系人证件号码:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="contacterCertificateNo" value="${tPartnerBasicInfo.contacterCertificateNo}" maxlength="50" placeholder="联系人证件号码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>运营商性质(个人|单位):</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="property" value="${tPartnerBasicInfo.property}" maxlength="50" placeholder="运营商性质(个人|单位)" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>营业执照:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="tradingCertificate" value="${tPartnerBasicInfo.tradingCertificate}" maxlength="50" placeholder="营业执照" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>机构代码:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="companyCode" value="${tPartnerBasicInfo.companyCode}" maxlength="50" placeholder="机构代码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>负责人姓名:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="principalName" value="${tPartnerBasicInfo.principalName}" maxlength="50" placeholder="负责人姓名" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>负责人手机:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="principalMobile" value="${tPartnerBasicInfo.principalMobile}" maxlength="50" placeholder="负责人手机" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>负责人座机:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="principalTelephone" value="${tPartnerBasicInfo.principalTelephone}" maxlength="50" placeholder="负责人座机" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>负责人邮箱:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="principalEmail" value="${tPartnerBasicInfo.principalEmail}" maxlength="50" placeholder="负责人邮箱" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							
							
							
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>负责人证件类型:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="principalCertificateType" value="${tPartnerBasicInfo.principalCertificateType}" maxlength="50" placeholder="负责人证件类型" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>负责人证件号码:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="principalCertificateNo" value="${tPartnerBasicInfo.principalCertificateNo}" maxlength="50" placeholder="负责人证件号码" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>网址:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="companyWebsite" value="${tPartnerBasicInfo.companyWebsite}" maxlength="50" placeholder="网址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>创建者:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="createBy" value="${tPartnerBasicInfo.createBy}" maxlength="50" placeholder="创建者" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
								</td>
							</tr>
							<tr>
								<td class="info col-md-1 text-right"><span class="red">*</span>最后修改人:</td>
								<td class="col-md-11">
									<input type="text" class="form-control" name="lastModifyBy" value="${tPartnerBasicInfo.lastModifyBy}" maxlength="50" placeholder="最后修改人" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_tpartnerbasicinfo_list").parent().attr("class","active");
			$("#page_tpartnerbasicinfo_list").parent().parent().parent().parent().addClass("in");
			$(function(){LW.form.validate("userForm");});
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>