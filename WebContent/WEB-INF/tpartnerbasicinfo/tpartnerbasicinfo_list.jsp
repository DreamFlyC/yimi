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
		<title>${appName}_运营商基本信息管理</title>
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
	    		<li><a href="<%=basePath%>manage/tpartnerbasicinfo.html">运营商基本信息管理列表</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
			<button class="btn btn-primary" onclick="javascript:window.location.reload()">
				<span class="glyphicon glyphicon-refresh"></span> 刷新
			</button>
			<button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>manage/tpartnerbasicinfo/post.html')">
				<span class="glyphicon glyphicon-plus"></span> 新增
			</button>	
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
						<th>ID</th>
                        <th >上级运营商</th>
                        <th >运营商编码</th>
                        <th >运营商名称</th>
                        <th >所在地省</th>
                        <th >所在地市</th>
                        <th >所在地区县</th>
                        <th >所在地详细地址</th>
                        <th >联系人姓名</th>
                        <th >联系人手机</th>
                        <th >联系人座机</th>
                        <th >联系人邮箱</th>
                        <th >联系人证件类型</th>
						<th >联系人证件号码</th>
						<th >运营商性质(个人|单位)</th>
						<th >营业执照</th>
						<th >机构代码</th>
						<th >负责人姓名</th>
						<th >负责人手机</th>
						<th >负责人座机</th>
						<th >负责人邮箱</th>
						<th >负责人证件类型</th>
						<th >负责人证件号码</th>
						<th >网址</th>
						<th >创建者</th>
						<th >创建时间</th>
						<th >最后修改人</th>
						<th >最后修改时间</th>
                        <th >操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pager.datas}" var="item" varStatus="status">
						 
							<tr>
								<td>${item.partnerId}</td>
								<td>${item.parentPartnerId}</td>
								<td>${item.code}</td>
								<td>${item.name}</td>
								<td>${item.province}</td>
								<td>${item.city}</td>
								<td>${item.district}</td>
								<td>${item.address}</td>
								<td>${item.contacterName}</td>
								<td>${item.contacterMobile}</td>
								<td>${item.contacterTelephone}</td>
								<td>${item.contacterEmail}</td>
								<td>${item.contacterCertificateType}</td>
								<td>${item.contacterCertificateNo}</td>
								<td>${item.property}</td>
								<td>${item.tradingCertificate}</td>
								<td>${item.companyCode}</td>
								<td>${item.principalName}</td>
								<td>${item.principalMobile}</td>
								<td>${item.principalTelephone}</td>
								<td>${item.principalEmail}</td>
								<td>${item.principalCertificateType}</td>
								<td>${item.principalCertificateNo}</td>
								<td>${item.companyWebsite}</td>
								<td>${item.createBy}</td>
								<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								<td>${item.lastModifyBy}</td>
								<td><fmt:formatDate value="${item.lastModifyTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
								
								<td>
					               <a href="<%=basePath%>manage/tpartnerbasicinfo/${item.partnerId}.html">编辑</a> 
					   			   <a href="javascript:void(0)" onclick="LW.tpartnerbasicinfo.del(${item.partnerId})">删除</a></td>
							</tr>
						 
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>manage/tpartnerbasicinfo.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>manage/tpartnerbasicinfo.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>manage/tpartnerbasicinfo.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>manage/tpartnerbasicinfo.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_tpartnerbasicinfo_list").parent().attr("class","active");
			$("#page_tpartnerbasicinfo_list").parent().parent().parent().parent().addClass("in");
			LW.tpartnerbasicinfo=new Object();
			LW.tpartnerbasicinfo.del=function(id)
			{
				//LW.message.show(id);
				LW.message.confirm("id","您确认要继续删除吗?",function(r){if(r){LW.location.forward("manage/tpartnerbasicinfo/del/"+id+".html");}});
			}
		</script>
    	<%@ include file="../foot.jsp"%>
	</body>
</html>