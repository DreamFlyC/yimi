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
		<title>${appName}_物联卡流量管理</title>
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="<%=basePath%>mobilemsisdninfo.html">物联卡流量管理</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>mobilemsisdninfo/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button>	
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th >序号</th>
						<th >返回结果类型<br>号码信号列表<br>号码信息</th>	
						<th >号码<br>集成电路卡识别码<br>查询结果</th>	
                        <th>APN信息列表<br>APN信息<br>APN名称</th>
                        <th >个人套餐总流量<br>号码已用总流量<br>号码剩余总流量</th>
                        <th >套餐外流量<br>最后一次流量发生时间<br>套餐列表</th>
                        <th >套餐流量<br>套餐编码<br>套餐名称</th>
                        <th >产品实例ID<br>套餐总流量<br>套餐剩余流量</th>
                        <th >查询错误描述<br>套餐生效日期<br>套餐失效日期</th>
                        <th >操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item">
						 
							<tr>
								<td>${item.id}</td>
								<td>${item.type}<br>${item.msisdninfolist}<br>${item.msisdninfo}</td>
								<td>${item.msisdn}<br>${item.iccid}<br>${item.code}</td>
								<td>${item.apnlist}<br>${item.apninfo}<br>${item.apnname}</td>
								<td>${item.apninfoTotalflow}<br>${item.apninfoUsedflow}<br>${item.apninfoRestflow}</td>
								<td>${item.extrapkgflow}<br>${item.lastflowtime}<br>${item.pkginfolist}</td>
								<td>${item.pkginfo}<br>${item.pkgcode}<br>${item.pkgname}</td>
								<td>${item.subsprodid}<br>${item.pkginfoTotalflow}<br>${item.pkginfoUsedflow}</td>
								<td>${item.error}<br>${item.pkgeffdate}<br>${item.pkgexpiredate}</td>
								<td>
					               <a href="<%=basePath%>mobilemsisdninfo/${item.id}.html">编辑</a> 
					   			   <a href="javascript:void(0)" onclick="LW.mobilemsisdninfo.del(${item.id})">删除</a></td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>mobilemsisdninfo.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>mobilemsisdninfo.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>mobilemsisdninfo.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>mobilemsisdninfo.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_mobilemsisdninfo").parent().attr("class","active");
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>