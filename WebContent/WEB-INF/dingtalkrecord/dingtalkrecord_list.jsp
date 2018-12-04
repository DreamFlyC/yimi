<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
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


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_钉钉消息管理</title>
		
		<style type="text/css">
		table thead tr th,table tbody tr td{
			text-align: center;
		}
		</style>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>dingtalkrecord.html">钉钉消息管理</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>dingtalkrecord/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>	
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th >序号</th>
						<th >考勤组ID<br>排班ID<br>用户ID</th>	
						<th >工作日<br>考勤类型<br>数据来源</th>	
						<th >时间结果<br>位置结果<br>设备ID</th>
                        <th >关联的审批ID<br>关联的审批实例ID<br>考勤班次ID</th>
						<th >基准时间<br>实际打卡时间<br>排班打卡时间</th>	
						<th >是否合法<br>定位方法</th>	
						<th >用户打卡地址<br>用户打卡经度<br>用户打卡纬度</th>
                        <th >用户打卡定位精度<br>用户打卡wifi SSID<br>用户打卡wifi Mac地址</th>
						<th >基准地址<br>基准经度<br>基准纬度</th>	
						<th >基准定位精度<br>基准wifi ssid<br>基准 Mac 地址</th>
                        <th >打卡备注</th>
                        <th >操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item">
						 
							<tr>
								<td>${item.id}</td>
								<td>${item.groupId}<br>${item.planId}<br>${item.userId}</td>
								<td>
									<fmt:formatDate value="${item.workDate}"
										pattern="yyyy-MM-dd HH:mm:ss" /><br>
										${item.checkType}<br>${item.sourceType}
								</td>
								<td>${item.timeResult}<br>${item.locationResult}<br>${item.deviceId}</td>
								<td>${item.approveId}<br>${item.procInstId}<br>${item.classId}</td>
								<td><fmt:formatDate value="${item.baseCheckTime}"
										pattern="yyyy-MM-dd HH:mm:ss" /><br><fmt:formatDate value="${item.userCheckTime}"
										pattern="yyyy-MM-dd HH:mm:ss" /><br><fmt:formatDate value="${item.planCheckTime}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>${item.isLegal}<br>${item.locationMethod}</td>
								<td>${item.userAddress}<br>${item.userLongitude}<br>${item.userLatitude}</td>
								<td>${item.userAccuracy}<br>${item.userSsid}<br>${item.userMacAddr}</td>
								<td>${item.baseAddress}<br>${item.baseLongitude}<br>${item.baseLatitude}</td>
								<td>${item.baseAccuracy}<br>${item.baseSsid}<br>${item.baseMacAddr}</td>
								<td>${item.outsideRemark}</td>
								<td>
					               <a href="<%=basePath%>dingtalkrecord/${item.id}.html">编辑</a> 
					   			   <a href="javascript:void(0)" onclick="LW.dingtalkrecord.del(${item.id})">删除</a>
				   			   	</td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>dingtalkrecord.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>dingtalkrecord.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>dingtalkrecord.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>dingtalkrecord.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_dingtalkrecord").parent().attr("class","active");
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>