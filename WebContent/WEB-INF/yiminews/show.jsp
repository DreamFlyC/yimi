<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<%  
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻中心</title>
 <link href="<%=basePath%>resources/yiminews/css/index.css" rel="stylesheet" />
    <link href="<%=basePath%>resources/yiminews/css/ndex.css" rel="stylesheet" />
    <link href="<%=basePath%>resources/yiminews/css/animate.css" rel="stylesheet" />
    <script src="<%=basePath%>resources/yiminews/js/jquery-1.11.3.min.js"></script>
    <script src="<%=basePath%>resources/yiminews/js/index.js"></script>
    <script src="<%=basePath%>resources/yiminews/js/wySilder.min.js"></script>
    <style type="text/css">
		.place{height:40px; overflow:hidden;}
		.place span{line-height:40px; font-weight:bold;float:left; margin-left:12px;}
		.placeul li{float:left; line-height:40px; padding-left:7px; padding-right:12px; background:url(<%=basePath%>resources/yiminews/Images/rlist.gif) no-repeat right;}
		.placeul li:last-child{background:none;}
    </style>
</head>
<body>
	 <div class="Head">
                <div style="width:60%;float:left;">
                    <div id="logo" class="col-md-4" style="width:180px;height:60px;margin-top:19px;
                 background-size:100%;margin-left:20%">
                        <a href="#"><img src="<%=basePath%>resources/yiminews/Images/1-02.png" style="width:100%" /></a>
                    </div>
                </div>
                    <div style="width:40%;float:left;">
                        <ul>
                            <li style="float:left;height:90px;line-height:90px;">
                                <button type="button"  style="width:58px; display:inline-block;color:white;border:1px solid #52c252;background-color:#52c252;border-radius:0px;height:30px;">
                                   	 登录
                                </button>
                            </li>
                            <li style="float:left;height:90px;line-height:90px;">
                                <button type="button" style="width:58px;display:inline-block;border:1px solid #52c252;border-radius:0px;height: 30px;">
                                  	 注册
                                </button>
                            </li>
                            <li style="float:left;width:160px;margin-top:35px;margin-left:20px;">
                                <a href="#"><img src="<%=basePath%>resources/yiminews/Images/1-04.png"  alt="400-0755-917" /></a>
                            </li>
                        </ul>
                    </div>
            </div>
            <!-- 顶部导航 -->   
            <div class="Content">
                <div class="menu">
                    <div style="width:70%;margin:0px auto">
                        <nav role="navigation" style="background-color: rgb(238, 238, 239); padding-bottom: 0px !important;">
                            <ul class="nav navbar-nav">
                                <li class=""><a href="<%=basePath%>yiminews/index.html">首页</a></li>
                                <li class=""><a href="<%=basePath%>yiminews/index.html#solution">解决方案</a></li>
                                <li class="dropdown"><a href="<%=basePath%>yiminews/index.html#food" class="dropdown-toggle" data-toggle="dropdown">食品安全</a></li>
                                <li class="dropdown"><a href="<%=basePath%>yiminews/index.html#anli" class="dropdown-toggle" data-toggle="dropdown">案例</a></li>
                                <li class="dropdown"><a href="<%=basePath%>yiminews/index.html#news" class="dropdown-toggle" data-toggle="dropdown">新闻中心</a></li>
                                <li class="dropdown"><a href="<%=basePath%>yiminews/index.html#balk" class="dropdown-toggle" data-toggle="dropdown">招商加盟</a></li>
                                <li class="dropdown" style="border-right: 1px solid rgb(201, 202, 202);">
                                    <a href="<%=basePath%>yiminews/index.html#me" class="dropdown-toggle" data-toggle="dropdown">关于我们</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!--新闻内容展示区  -->
                <div style="background-color: #fff;">
				<div style="width:70%;margin-left: auto;margin-right: auto;">
                <div class="place">
					<span>位置：</span>
						<ul class="placeul" style="display: inline-block;">
							<li><a href="<%=basePath%>yiminews/index.html">首页</a></li>
							<li><a href="<%=basePath%>yiminews/showlist.html">新闻中心</a></li>
							<li><a href="javascript:void(0);">正文</a></li>
						</ul>
				</div>
					<h1 style="text-align: center;font-size: 30px;">${obj.title}</h1>
					<p style="text-align: center">时间：${fn:substring(obj.creatime, 0, 19)}</p>
					<p>&nbsp;</p>
					<p style="">${obj.content}</p>
				</div>
				</div>
				<div class="aboutus" style="margin-top: 100px;">
                    <div style="width:70%;margin:0px auto;">
                        <div name="me" id="me" style="width:100%;font-size:26px;color:#808080;height:60px;line-height:60px;"><a href="">关于一米云站&nbsp;&nbsp;>></a></div>
                        <div style="width:100%;">
                            <div style="float:left;width:150px;height:auto;">
                                <ul>
                                    <li><a href="#">公司简介</a></li>
                                    <li><a href="#">追溯体系</a></li>
                                    <li><a href="#">企业文化</a></li>
                                    <li><a href="#">业务入口</a></li>
                                    <li><a href="#">合作伙伴</a></li>
                                </ul>
                            </div>
                            <div style="float:left;width:150px;height:auto;">
                                <ul>
                                    <li><a href="#">新闻动态</a></li>
                                    <li><a href="#">公司活动</a></li>
                                    <li><a href="#">公司年报</a></li>
                                </ul>
                            </div>
                            <div style="float:left;width:150px;height:auto;">
                                <ul>
                                    <li><a href="#">行业资讯</a></li>
                                    <li><a href="#">行业研究</a></li>
                                    <li><a href="#">行业展望</a></li>
                                    <li><a href="#">创新技术</a></li>
                                </ul>
                            </div>
                            <div style="float:left;width:150px;height:auto;">
                                <ul>
                                    <li><a href="#">技术支持</a></li>
                                    <li><a href="#">支持单位</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Foot">
                <div style="width:55%;margin:0px auto;clear: both;">
                    <div style="width:200px;float:left;height:70px;line-height:70px;font-size:10px;color:#808080;"><a href="">深圳一米云站科技有限公司</a></div>
                    <div style="width:240px;float:left;text-align:center;margin-left:185px;margin-top:20px;font-size:10px;">
                        <ul>
                            <li style="float:left;"><a href="#" style="display: block; width: 80px; border-left: 1px solid; height: 20px;line-height:20px;color:#808080;">联系我们</a></li>
                            <li style="float: left;"><a href="#" style="display: block; width: 80px; border-left: 1px solid; height: 20px;line-height:20px;color:#808080;">法律声明</a></li>
                            <li style="float: left;"><a href="#" style="display: block; width: 80px; border-left: 1px solid; border-right: 1px solid; height: 20px;line-height:20px;color:#808080;">隐私保护</a></li>
                        </ul>
                    </div>
                </div>
            </div>
	 </div>
</body>
</html>