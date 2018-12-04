<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>关于我们</title>
<link href="<%=basePath%>resources/yiminews/css/index.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/ndex.css"
	rel="stylesheet" />
<link href="<%=basePath%>resources/yiminews/css/animate.css"
	rel="stylesheet" />
	<link href="<%=basePath%>resources/yiminews/css/about.css"
	rel="stylesheet" />
<script src="<%=basePath%>resources/yiminews/js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>resources/yiminews/js/index.js"></script>
<script src="<%=basePath%>resources/yiminews/js/wySilder.min.js"></script>
<style type="text/css">
.place {
	height: 40px;
	overflow: hidden;
}

.place span {
	line-height: 40px;
	font-weight: bold;
	float: left;
	margin-left: 12px;
}

.placeul li {
	float: left;
	line-height: 40px;
	padding-left: 7px;
	padding-right: 12px;
	background: url(<%=basePath%>resources/yiminews/Images/rlist.gif)
		no-repeat right;
}

.placeul li:last-child {
	background: none;
}
.devlop p{font-size: 14px;} 
.developdv{
	    padding-top: 50px;
    position: relative;
    color: #666;
    margin-left: 22%;
    margin-right: 22%;
    height: 100%;
}
.developdv .img1{
	-webkit-transform: scale(0.6);
	position: absolute;;
	top:0px;
}
.developdv .img2{
	    -webkit-transform: scale(0.52);
    position: absolute;
    top: -41px;
}
.developdv .img3{
	    -webkit-transform: scale(0.47);
    position: absolute;
    top: -72px;
}
.devlop{width: 189px;}
.rongyu{width: 66%;margin:0px 22%;}
.rongyu p{
  line-height: 50px;
  width:88%;
}
.rongyu img{  
    width: 200px;
    float: left;
    margin: 15px 10px;
}
.head{width: 100%;height:100px;background-color:#f7f7f7;}
</style>
</head>
<body>
	
	<%@ include file="head.html" %>
		<!-- 顶部导航 -->
		<div class="Content">
		<!--main begin  -->
		<!--大图  -->
		<div style="width: 100%;position: relative;" >
			<img alt="" src="<%=basePath%>resources/yiminews/Images/about/3-01.png">
			<div style="position: absolute;left:55%;top:63%;width: 30%;color: white;margin-left: -15%;">
				<span style="font-size: 28px;letter-spacing: 3px;">中国智慧餐饮领导者</span><br>
				<div style="margin-top: 10px;">
					<span>个性化校园餐</span>
					<span style="margin-left: 25px;">智慧商业餐</span>
					<span style="margin-left: 20px;">企业团餐</span>	
				</div>
			</div>
		</div>
		<!--二图  -->
		<div style="width: 100%;background:#3bbf4f;height:500px;margin-top: 100px;position: relative;">
			<div style="width: 32%;position: absolute;left: 45%;margin-top: -100px;">
				<img src="<%=basePath%>resources/yiminews/Images/about/4-03.png"/>
			</div>
			<div style="position: absolute;left:22%;top:29%;letter-spacing: 3px;color: white;">
				<span style="font-size: 44px;">互联网</span>
				<span style="font-size: 44px;color: #fcf300">+物联网</span><br>
				<div style="width:70.5%;">
				<p style="font-size: 27px;line-height: 50px;">标准餐饮供应链+智能取餐终端&nbsp;&nbsp;&nbsp;专业打造智慧校园</p>
				<p>深圳市一米云站科技有限公司是专注于食品工业科技的现代化餐饮管理企业，公司核心团队具有近二十年的行业积
				累，致力于顶尖食品的现代化研发及实现，利用新的互联网和物联网技术，依托多点分布结构，最接近消费者的美食
				智能取餐柜和开放的食品研发平台，成为中餐美食新业态，该模式一经推出之后便获得业界和消费者认可，一米
				云站在此基础上继续开拓校园供餐新场景，成为校园个性化用餐的开创者。
				</p>
				</div>
			</div>
		</div>
		<!--我们的使命  -->
		<div style="margin-left: 22%;margin-right: 22%;height: 360px;">
			<div style="margin-top:40px;background: url(/traceability/resources/yiminews/Images/about/5-03.png);
			background-size: 100% 100%;position: relative;width: 100%;height:200px;top: 7%;">
				<div style="position: absolute;left: 41%; top: -7%;font-size: 30px; color: #666;font-family: 微软雅黑;">
					我们的使命
				</div>
				<div style="width: 125px;height: 125px;position: absolute;top: 76%;left: 12.3%;"	>
					<img alt="" src="<%=basePath%>resources/yiminews/Images/about/5-04.png">
				</div>
				<div style="width: 125px;height: 125px;position: absolute;top: 76%;left: 42.1%;">
					<img alt="" src="<%=basePath%>resources/yiminews/Images/about/5-05.png">
				</div>
				<div style="width: 125px;height: 125px;position: absolute;top: 76%;left: 71.8%;">
					<img alt="" src="<%=basePath%>resources/yiminews/Images/about/5-06.png">
				</div>
			</div>
		</div>
		
		<!--发展历程  -->
		<div style="background-color:#f7f7f7; width: 100%;height: 600px;">
			<div class="developdv">
				<p style="text-align: center;font-size: 30px;">发展历程</p>
				<div class="devlop devlop-1">
				<p>由麦当劳、华为、真功夫核心团队成立一米云站餐饮管理有限公司</p>
				<img class="img1" alt="" src="<%=basePath%>resources/yiminews/Images/about/6-03.png">
				</div>
				<div class="devlop devlop-2">
				<p>智能取餐柜研发成功，一经推出就获得资本青睐，完成天使融资。</p>
				<img  class="img2" alt="" src="<%=basePath%>resources/yiminews/Images/about/6-05.png">
				</div>
				<div class="devlop devlop-3">
			 	<p>进驻深圳并与万科达成战略合作，全面进驻万科旗下住宅、写字楼等场景供餐。</p>
				<img  class="img1" alt="" src="<%=basePath%>resources/yiminews/Images/about/6-07.png">
				</div>
				<div class="devlop devlop-4">
				 <p>作为校园个性化用餐开创者，进一步优化校园供餐方案，将智能取餐柜引进校园，提高学生就餐质量。</p>
	 			<img  class="img3" alt="" src="<%=basePath%>resources/yiminews/Images/about/6-09.png">
				</div>
				<div class="devlop devlop-5">
				<p>校园供餐模式得到行业认可，再次获得资本支持开始布局全国的校园用餐。</p>
				<img  class="img1" alt="" src="<%=basePath%>resources/yiminews/Images/about/6-11.png">
				</div>
			</div>
		</div>
		<!--合作伙伴  -->
		<div style="height: 200px;" class="section">
			<P style="font-size: 30px;color: #666;line-height: 100px;">主要合作伙伴&nbsp;></P>
			<img alt="" src="<%=basePath%>resources/yiminews/Images/about/7-03.png">
		</div>
		<!--公司资质荣誉  -->
		<div style="width: 100%;height:500px;background-color:#f7f7f7; ">
		<div class="rongyu">
			<P style="font-size: 30px;color: #666;line-height: 100px;">公司资质荣誉&nbsp;></P>
			<p style="color:#3bbf4f;">仲恺农业工程学院展开产学研合作</p>
			<p style="">仲恺农业工程学院为广州酒家经营管理及上市推进提供了全程的智力支持;仲恺农业工程学院与一米云站深度合作，在食品安全管控、食品工业及标准化、菜品口味研发等领域给予支持，同时成立一米仲恺研发中心。</p>
		    <div>
		   		<div>
		   			<img alt="" src="<%=basePath%>resources/yiminews/Images/about/8-05.png">
					<img alt="" src="<%=basePath%>resources/yiminews/Images/about/8-06.png">
					<img alt="" src="<%=basePath%>resources/yiminews/Images/about/8-07.png">
		   		</div>
			</div>
		
		</div>
		
		</div>
		
		<!--媒体报道  -->
		<div style="position: relative;height: 400px;">
			<div class="section" >
				<p style="font-size: 30px;color: #666;line-height: 100px;"">媒体报道</p>
				<img alt="" src="<%=basePath%>resources/yiminews/Images/about/9-03.png" style="width: 300px;position: absolute;left: 37%;top: 10%">
			</div>
		</div>
		<!--联系我们  -->
		<div style="width: 100%;height:400px;background:#f7f7f7;color: #666;">
		<div  class="section">
			<p style="font-size: 30px;color: #666;line-height: 100px;"">联系我们</p>
			<div style="width: 50%;float: left;">
				<p style="color:#3bbf4f;font-size: 28px;">400-0755-917</p>
				<div style="background-color:#3bbf4f;width: 35px;height: 4px;margin-top: 20px;" ></div>
				<div style="background-color:#666;width: 155px;height: 2px;margin-top: 25px;" ></div>
				<p style="margin-top: 55px;">一米云站</p>
				<p style="">广东省深圳市南山区琼宇路特发信息科技大厦7A</p>
				<div style="background-color:#3bbf4f;width: 365px;height: 4px;margin-top: 20px;" ></div>
			</div>
			<div style="width: 50%;float: left;">
				<img alt="" src="<%=basePath%>resources/yiminews/Images/about/10-06.png">
			</div>
		</div>
		</div>
		<!--main end  -->
		<%@ include file="foot.html" %>
	</div>
</body>
</html>