﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>${appName}_钉钉考勤管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manager/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>dingtalkrecord.html">钉钉考勤管理理</a></li>
	    		<li>编辑钉钉考勤信息</li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<form class="form-horizontal" role="form" method="post" action="<%=basePath%>dingtalkrecord/post.html" id="userForm">
				<div class="list-group-item active glyphicon glyphicon-chevron-up" data-toggle="collapse" data-parent="#accordion" href="#panelInfo">钉钉考勤信息</div>				
				<div id="panelInfo" class="panel-collapse collapse in">
         			<div class="panel-body">
						<table class="table table-bordered">
							<tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>钉钉考勤信息:</td>
						    	<td class="col-md-3" colspan="5">
								<lw:RestaurantSelTag style="class='form-control' name='restaurantId'" value="1"/>	
						    	</td>
						    </tr>
						    <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>考勤组ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="groupId" value="${dingtalkRecord.groupId}" maxlength="50" placeholder="考勤组ID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>排班ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="planId" value="${dingtalkRecord.planId}" maxlength="50" placeholder="排班ID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="userId" value="${dingtalkRecord.userId}" maxlength="50" placeholder="用户ID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>工作日:</td>
						    	<td class="col-md-3">
						    		<input
									class="form-control" style="  text-align: left;" type="text" name="workDate" 
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${dingtalkRecord.workDate}' pattern='yyyy-MM-dd HH:mm:ss' />">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>考勤类型:</td>
						    	<td class="col-md-3">
						    		<input type="radio"  name="checkType" value="OnDuty">上班
						    		<input type="radio"  name="checkType" value="OffDuty">下班
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>数据来源:</td>
						    	<td class="col-md-3">
						    		<input type="radio"  name="sourceType" value="ATM">考勤机
						    		<input type="radio"  name="sourceType" value="BEACON">IBeacon
						    		<input type="radio"  name="sourceType" value="DING_ATM">钉钉考勤机<br>
						    		<input type="radio"  name="sourceType" value="APP_USER">用户打卡
						    		<input type="radio"  name="sourceType" value="APP_BOSS">老板改签
						    		<input type="radio"  name="sourceType" value="APP_APPROVE">审批系统<br>
						    		<input type="radio"  name="sourceType" value="SYSTEM">考勤系统
						    		<input type="radio"  name="sourceType" value="APP_AUTO_CHECK">自动打卡
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>时间结果:</td>
						    	<td class="col-md-3">
						    		<input type="radio" name="timeResult" value="Normal" >正常
						    		<input type="radio" name="timeResult" value="Early" >早退
						    		<input type="radio" name="timeResult" value="Late" >迟到
						    		<input type="radio" name="timeResult" value="SeriousLate" >严重迟到
						    		<input type="radio" name="timeResult" value="Absenteeism" >旷工迟到
						    		<input type="radio" name="timeResult" value="NotSigned" >未打卡
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>位置结果:</td>
						    	<td class="col-md-3">
						    		<input type="radio" name="locationResult" value="Normal" >范围内
						    		<input type="radio" name="locationResult" value="Outside" >范围外(外勤打卡)
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>是否合法:</td>
						    	<td class="col-md-3" colspan="1">
						    		<input type="text" class="form-control" name="isLegal" value="${dingtalkRecord.isLegal}" maxlength="50" placeholder="是否合法" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>关联的审批ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="approveId" value="${dingtalkRecord.approveId}" maxlength="50" placeholder="关联的审批ID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>关联的审批实例ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="procInstId" value="${dingtalkRecord.procInstId}" maxlength="50" placeholder="关联的审批实例ID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>考勤班次ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="classId" value="${dingtalkRecord.classId}" maxlength="50" placeholder="考勤班次ID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>基准时间:</td>
						    	<td class="col-md-3">
						    		<input
									class="form-control" style="  text-align: left;" type="text" name="baseCheckTime" 
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${dingtalkRecord.baseCheckTime}' pattern='yyyy-MM-dd HH:mm:ss' />">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>实际打卡时间:</td>
						    	<td class="col-md-3">
						    		<input
									class="form-control" style="  text-align: left;" type="text" name="userCheckTime" 
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${dingtalkRecord.userCheckTime}' pattern='yyyy-MM-dd HH:mm:ss' />">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>排班打卡时间:</td>
						    	<td class="col-md-3">
						    		<input
									class="form-control" style="  text-align: left;" type="text" name="planCheckTime" 
									onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss '})"
									value="<fmt:formatDate value='${dingtalkRecord.planCheckTime}' pattern='yyyy-MM-dd HH:mm:ss' />">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>设备ID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="deviceId" value="${dingtalkRecord.deviceId}" maxlength="50" placeholder="发送结果" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>定位方法:</td>
						    	<td class="col-md-3" colspan="3">
						    		<input type="text" class="form-control" name="locationMethod" value="${dingtalkRecord.locationMethod}" maxlength="50" placeholder="定位方法" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户打卡地址:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="userAddress" value="${dingtalkRecord.userAddress}" maxlength="50" placeholder="用户打卡地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户打卡经度:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="userLongitude" value="${dingtalkRecord.userLongitude}" maxlength="50" placeholder="用户打卡经度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户打卡纬度:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="userLatitude" value="${dingtalkRecord.userLatitude}" maxlength="50" placeholder="用户打卡纬度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						    
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户打卡定位精度:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="userAccuracy" value="${dingtalkRecord.userAccuracy}" maxlength="50" placeholder="用户打卡定位精度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户打卡wifi SSID:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="userSsid" value="${dingtalkRecord.userSsid}" maxlength="50" placeholder="用户打卡wifi SSID" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>用户打卡wifi Mac地址:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="userMacAddr" value="${dingtalkRecord.userMacAddr}" maxlength="50" placeholder="用户打卡wifi Mac地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>基准地址:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="baseAddress" value="${dingtalkRecord.baseAddress}" maxlength="50" placeholder="基准地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>基准经度:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="baseLongitude" value="${dingtalkRecord.baseLongitude}" maxlength="50" placeholder="基准经度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>基准纬度:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="baseLatitude" value="${dingtalkRecord.baseLatitude}" maxlength="50" placeholder="基准纬度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
						     <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>基准定位精度:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="baseAccuracy" value="${dingtalkRecord.baseAccuracy}" maxlength="50" placeholder="基准定位精度" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>基准wifi ssid:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="baseSsid" value="${dingtalkRecord.baseSsid}" maxlength="50" placeholder="基准wifi ssid" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>基准 Mac 地址:</td>
						    	<td class="col-md-3">
						    		<input type="text" class="form-control" name="baseMacAddr" value="${dingtalkRecord.baseMacAddr}" maxlength="50" placeholder="基准 Mac 地址" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
						    	</td>
						    </tr>
							   <tr>
						    	<td class="info col-md-1 text-right"><span class="red">*</span>打卡备注:</td>
						    	<td class="col-md-3" colspan="5">
						    		<input type="text" class="form-control" name="outsideRemark" value="${dingtalkRecord.outsideRemark}" maxlength="50" placeholder="打卡备注" autocomplete="off" datatype="*1-50" errormsg="至少1个字符,最多50个字符！">
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
			$("#page_dingtalkrecord").parent().attr("class","active");
			$(function(){LW.form.validate("userForm");});
		</script>
		<script type="text/javascript">
			$("input:radio[name='timeResult'][value='${dingtalkRecord.timeResult}']").attr('checked','true');
			$("input:radio[name='checkType'][value='${dingtalkRecord.checkType}']").attr('checked','true');
			$("input:radio[name='sourceType'][value='${dingtalkRecord.sourceType}']").attr('checked','true');
			$("input:radio[name='locationResult'][value='${dingtalkRecord.locationResult}']").attr('checked','true');
		</script>
		
		
		
    	<%@ include file="../foot.jsp"%>
	</body>
</html>