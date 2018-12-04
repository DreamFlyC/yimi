<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <% 
	String path = request.getContextPath();     
	String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> --%>

<div class="leftContainer">
	<div class="lefttop"><span></span>管理中心</div>
    <dl class="leftmenu">
	
	<dd>  	
  	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion" 
					   href="#collapseOne">
						<span><img src="<%=basePath%>resources/images/leftico01.png" /></span>欢迎页
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in">
				<div class="panel-body">
					<ul class="menuson">
			        	<li><cite></cite><a href="<%=basePath%>manage/index.html" id="page_index">首页</a><i></i></li>
						<li><cite></cite><a href="<%=basePath%>manage/user/editpwd.html" id="page_editpwd">修改密码</a><i></i></li>
			        </ul> 
				</div>
			</div>
		</div>
	</div>
	</dd>
	  	<dd>
	    <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico01.png" /></span>欢迎页</summary>
	    	<ul class="menuson">
	        	<li><cite></cite><a href="<%=basePath%>manage/index.html" id="page_index">首页</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>manage/user/editpwd.html" id="page_editpwd">修改密码</a><i></i></li>
	        </ul>  
	          </details>  
	    </dd>

		<dd>
		<details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>小程序用户信息管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>miniprogram/memberinfo.html" id="page_pointsset">小程序用户信息</a><i></i></li>
		    </ul>
		      </details>
	    </dd>
	    <dd>
	    <details>
	    <summary class="title"><span><img src="<%=basePath%>resources/images/leftico01.png" /></span>权限管理管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>shiroaction/model.html" id="page_pointsset">模块管理</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>shiroaction/rolevalue.html" id="page_pointslog">权限管理</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>shiroaction/usersgroup.html" id="page_leveset">角色管理</a><i></i></li>
			</ul>
			  </details>
	    </dd>
	    <dd>
	    <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>官网新闻管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>yiminews.html" id="page_pointsset">官网新闻</a><i></i></li>
		    </ul>
		      </details>
	    </dd>
	    <dd>
	    <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>视频直播管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>livevideo/list.html" id="page_livevideolist">视频直播列表</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>livevideo/account.html" id="page_livevideoaccount">视频监控账户</a><i></i></li>
		    </ul>
		      </details>
	    </dd>
	    <dd>
	    <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>配送跟踪线路图</summary>
		    <%-- <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>traceabilitypoint.html" id="page_traceabilitypoint">配送跟踪线路图</a><i></i></li>
		    </ul> --%>
		      </details>
	    </dd>
  		<dd>
  		<details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>朔源系统</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>traceabilitytype.html" id="page_traceabilitytype">朔源系统类型</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>traceabilitypoint.html" id="page_traceabilitypoint">朔源系统网点</a><i></i></li>
		    </ul>
		      </details>
	    </dd>
		<dd> 
			<details>
	    		<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>库存系统管理</summary>
			    <ul class="menuson">
					<li><cite></cite><a href="<%=basePath%>manage/crm/crm_list.html" id="page_crm_list">库存列表</a><i></i></li>
			 		<li><cite></cite><a href="<%=basePath%>manage/crmproduct/crmproduct_list.html" id="page_crmproduct_list">产品列表</a><i></i></li>
					<li><cite></cite><a href="<%=basePath%>manage/crmsupplier/crmsupplier_list.html" id="page_crmsupplier_list">供应商列表</a><i></i></li>
					<li><cite></cite><a href="<%=basePath%>manage/crmuser/crmuser_list.html" id="page_crmuser_list">用户列表</a><i></i></li>
					<li><cite></cite><a href="<%=basePath%>manage/crmname/crmname_list.html" id="page_crmname_list">分类列表</a><i></i></li>
			    </ul>
		    </details>
	    </dd>
	    
	    <dd>
	    <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>出货记录管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>manage/crmstockinoroutlog/crmstockinoroutlog_list.html" id="page_crmstockinoroutlog_list">出货记录列表</a><i></i></li>
	  			<li><cite></cite><a href="<%=basePath%>manage/crmstockinoroutlogitem/crmstockinoroutlogitem_list.html" id="page_crmstockinoroutlogitem_list">出货记录明细</a><i></i></li>
		    </ul>
	    </details>
	    </dd>
	    
	     <dd>
	      <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>客户管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>manage/crmcompany/crmcompany_list.html" id="page_crmcompany_list">企业信息管理</a><i></i></li>
		    	<li><cite></cite><a href="<%=basePath%>manage/crmcontact/crmcontact_list.html" id="page_crmcontact_list">客户联系人管理</a><i></i></li>
		    	<li><cite></cite><a href="<%=basePath%>manage/crmsercustomer/crmsercustomer_list.html" id="page_crmsercustomer_list">客户回访管理</a><i></i></li>
		    	<li><cite></cite><a href="<%=basePath%>manage/crmbusiness/crmbusiness_list.html" id="page_crmbusiness_list">代理商管理</a><i></i></li>
		    </ul>
		    </details>
	    </dd>
	    <dd>
	      <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>采购系统管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>manage/crm/crm_find" id="page_crm_purchacse">采购信息列表</a><i></i></li>
		    </ul>
		    </details>
	    </dd>
	    <dd>
	    <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>收付款管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>manage/crmpayment.html" id="page_crmpayment">付款管理</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>manage/crmprice.html" id="page_crmprice">收款单管理</a><i></i></li>
		    </ul>
	     </details>
	    </dd>
	    
	    <dd>
	    <details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>工单系统管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>duty/duty_list.html" id="page_duty_index">工单列表</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>duty/feedback.html" id="page_duty_feedback">投诉统计</a><i></i></li>
				<li><cite></cite><a href="<%=basePath%>duty/case.html" id="page_duty_case">受理工单</a><i></i></li>
		    </ul>
		     </details>
	    </dd>
		<dd>
		<details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>广告图片管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>adpic.html" id="page_adpic_list">图片列表</a><i></i></li>
		    </ul>
		    </details>
	    </dd>
		<dd>
		<details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>钉钉管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>dingtalkmsg.html" id="page_dingtalkmsg">消息列表</a><i></i></li>
		    </ul>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>dingtalkrecord.html" id="page_dingtalkrecord">考勤列表</a><i></i></li>
		    </ul>
		     </details>
	    </dd>
		<dd>
		<details>
	    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>预设监控管理</summary>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>aliyunmonitordsinfo.html" id="page_aliyunmonitordsinfo">Aliyun_Monito_Rdsinfo</a><i></i></li>
		    </ul>
		    <ul class="menuson">
				<li><cite></cite><a href="<%=basePath%>aliyunmonitoossinfo.html" id="page_aliyunmonitoossinfo">Aliyun_Monito_Ossinfo</a><i></i></li>
		    </ul>
		    </details>
	    </dd>
	    <dd>
		    <details>
		    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>物联卡流量管理</summary>
			    <ul class="menuson">
					<li><cite></cite><a href="<%=basePath%>mobilemsisdninfo.html" id="page_mobilemsisdninfo">物联卡流量列表</a><i></i></li>
			    </ul>
		    </details>
	    </dd>	
	    <dd>
		    <details>
		    	<summary class="title"><span><img src="<%=basePath%>resources/images/leftico03.png" /></span>软件信息日志管理</summary>
			    <ul class="menuson">
					<li><cite></cite><a href="<%=basePath%>manage/restaurantsoftinfo.html" id="page_restaurantsoftinfo_list	">软件信息日志列表</a><i></i></li>
			    </ul>
		    </details>
	    </dd>	
       </dl>
</div>