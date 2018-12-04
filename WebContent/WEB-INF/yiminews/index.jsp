<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<link href="<%=basePath%>resources/yiminews/css/index.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/ndex.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/animate.css"
	rel="stylesheet" />
<script src="<%=basePath%>resources/yiminews/js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>resources/yiminews/js/index.js"></script>
<script src="<%=basePath%>resources/yiminews/js/wySilder.min.js"></script>
</head>
<body style="min-width: 1290px; overflow: auto;">
	<div class="container">
		<%@ include file="head.html" %>
		<!-- 顶部导航 -->
		<div class="Content">
			<!-- 主图 -->
			<div class="big_advertising">
				<div class="js-silder">
					<div class="silder-scroll">
						<div class="silder-main">
						<c:forEach items="${bannerList}" var="banner" begin="0" end="4">
							<div class="silder-main-img">
								<a href="#">
								<img src="/upload/images/${banner.largepic}"
									style="width: 100%;height:506px;" alt="" /></a>
							</div>
							
						</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 校园餐，商业餐，企业团餐滚动图片 -->
			<div class="case_advertising">
				<div class="well">
					<div class="well-item ">
						<div class="correct">
							<img src="<%=basePath%>resources/yiminews/Images/4-02.png" alt="" />
						</div>
						<div class="opposite">
							<div class="#">
								<div class="opposite-content">
									<div class="opposite-content-text col-md-12">
										<img src="<%=basePath%>resources/yiminews/Images/4-05.png"
											alt="" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="well-item">
						<div class="correct">
							<img src="<%=basePath%>resources/yiminews/Images/4-03.png" alt="" />
						</div>
						<div class="opposite">
							<div class="">
								<div class="opposite-content">
									<div class="opposite-content-text col-md-12">
										<img src="<%=basePath%>resources/yiminews/Images/4-06.png"
											alt="" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="well-item">
						<div class="correct">
							<img src="<%=basePath%>resources/yiminews/Images/4-04.png" alt="" />
						</div>
						<div class="opposite">
							<div class="">
								<div class="opposite-content">
									<div class="opposite-content-text col-md-12">
										<img src="<%=basePath%>resources/yiminews/Images/4-07.png"
											alt="" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 新闻中心 -->
			<div class="news" name="news" id="news"
				style="width: 100%; height: 400px;">
				<div style="width: 68%; margin: 0px auto;">
					<div
						style="margin-top: 5px; width: 100%; font-size: 26px; color: #808080; height: 60px; line-height: 60px;">
						<a href="showlist.html">新闻中心&nbsp;&nbsp;>></a>
					</div>
					<div style="width: 100%; height: auto;">
						<!-- 左边展示图 -->
						<div style="float: left; width: 458px;">
							<div class="js-silder">
								<div class="silder-scroll">
									<div class="silder-main">
										<c:forEach items="${imgList}" var="item">
										<div class="silder-main-img">
											<c:if test="${item.img!=null}">
											<a href="show/${item.id}" target="_blank">
											<img src="/upload/images/${item.img}"
												style="width:460px; height:318px;" alt="" />
												</a> 
											</c:if>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<div style="float: left; width: 450px; margin-left: 35px;">
							<div class="title"
								style="background: url(<%=basePath%>resources/yiminews/Images/5-05.png) no-repeat bottom center; background-size: 100%;height:80px;">
								<div
									style="font-size: 30px; width: 150px; color: #808080;">公司动态</div>
								<div style="font-size: 8px; margin-top: -5px;">COMPANY&nbsp;DYNAMIC</div>
							</div>
							<div
								style="width: 100%; height: 210px; overflow: hidden; position: relative;">
								<ul id="news-ul">
									<c:forEach items="${pager.datas}" var="item">
										<li title="${item.title}&nbsp;${item.creatime}">
											<a href="show/${item.id}" target="_blank">
													<div
														style="float: left; overflow: hidden; white-space: nowrap; text-overflow: ellipsis; width: 75%;">
														<div class="dot" style="border-radius: 2px;"></div>
														<span>${item.title}</span>
													</div>
													<div style="width: 20%; font-size: 12px; float: right;">
														<span>${fn:substring(item.creatime, 0, 10)}</span>
													</div>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
							<c:if test="${pager.datas.size()>=6}">
						    	<div style="float: right;font-size: 12px;"><a href="showlist.html">更多>></a></div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- 二图 -->
			<div class="fix_advertising">
				<a href="#">
				<img src="/upload/images/${bannertwo.largepic}" style="width:1400px; height: 328px;" /></a>
			</div>
			<!-- 创新校园 餐饮模式 -->
			<div class="school_advertising">
				<div style="width: 65%; margin: 0px auto;">
					<div
						style="width: 55%; float: left; height: 260px; padding-top: 2em; padding-bottom: 2em;">
						<img src="<%=basePath%>resources/yiminews/Images/7-02.png" alt="" />
					</div>
					<div
						style="width: 45%; float: left; height: 200px; padding-top: 3.5em; padding-bottom: 3.5em;">
						<img src="<%=basePath%>resources/yiminews/Images/7-03.png" alt="" />
					</div>
				</div>
			</div>
			<!--智能点餐平台  -->
			<div class="smartorder" style="width: 100%; height: 240px;">
				<div class="section">
					<div
						style="width: 100%; font-size: 26px; color: #808080; height: 60px; line-height: 60px;">
						<a href="#">智能点餐平台&nbsp;&nbsp;>></a>
					</div>
					<div>
						<ul>
							<li style="width: 30%; float: left;">
							<img src="/upload/images/${one.largepic}" style="width:235px; height: 140px;" /></li>
							<li style="width: 30%; float: left; margin-left: 3%;">
							<img src="/upload/images/${two.largepic}" style="width:235px; height: 140px;" /></li>
							<li style="width: 30%; float: left; margin-left: 3%;">
							<img src="/upload/images/${three.largepic}" style="width:235px; height: 140px;" /></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="food_safety">
				<div style="height: auto;" class="section">
					<div
						style="width: 100%; font-size: 26px; color: #808080; height: 60px; line-height: 60px;">
						<a href="#">食品安全管理体系&nbsp;&nbsp;>></a>
					</div>
					<div>
						<div style="width: 33%; float: left;">
							<div style="width: 97%; height: auto;">
								<img src="<%=basePath%>resources/yiminews/Images/9-03.png"
									width="100%" />
							</div>
							<div style="width: 97%; height: auto; margin-top: 10px;">
								<img src="<%=basePath%>resources/yiminews/Images/9-06.png"
									width="100%" alt="" />
							</div>
						</div>
						<div style="width: 33%; float: left;">
							<div style="width: 97%; height: auto;">
								<img src="<%=basePath%>resources/yiminews/Images/9-04.png"
									width="100%" />
							</div>
							<div style="width: 97%; height: auto; margin-top: 10px;">
								<img src="<%=basePath%>resources/yiminews/Images/9-07.png"
									width="100%" alt="" />
							</div>
						</div>
						<div style="width: 33%; float: left;">
							<div style="width: 97%; height: auto;">
								<img src="<%=basePath%>resources/yiminews/Images/9-05.png"
									width="100%" />
							</div>
							<div style="width: 97%; height: auto; margin-top: 10px;">
								<img src="<%=basePath%>resources/yiminews/Images/9-08.png"
									width="100%" alt="" />
							</div>
						</div>
					</div>
				</div>
				<div style="clear: both; height: 0px;"></div>
				<div style="width: 65%; margin: 25px auto; height: 700px;">
					<div
						style="width: 40%; height: 240px; float: left; background-color: white; margin-top: 30px; line-height: 35px; padding: 15px;">
						<a href="">
							专业化分工,整合全国各大食品企业和农产品龙头企业和一米云站进行战略合作,食材出厂后冷链配送到各城市的厨房，食材符
							合国家级乃至国际食品安全标准，可溯源同时整合当地蔬菜供应链，满足厨房所需所有原料。 </a>
					</div>
					<div style="width: 58%; height: 250px; float: left;">
						<img src="<%=basePath%>resources/yiminews/Images/9-10.png"
							width="100%" alt="" />
					</div>
				</div>
			</div>
			<div class="smartterminal">
				<div class="section">
					<div
						style="width: 100%; font-size: 26px; color: #808080; height: 60px; line-height: 60px;">
						<a href="#">智能取餐终端>></a>
					</div>
				</div>
				<div style="width: 65%; margin: 0px auto;">
					<img src="<%=basePath%>resources/yiminews/Images/10-03.png"
						width="100%" />
				</div>
			</div>
		</div>
		<%@ include file="foot.html" %>
	</div>
</body>
</html>
