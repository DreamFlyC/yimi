<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>参数</title>
 <!-- 加载Query文件-->
 <script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
 </script>
 <script type="text/javascript">
 $("#redpack").click(function () {
 	 //模拟30000个异步请求，进行并发
 var max = 30000;
 for (var i = 1; i <= max; i++) {
 //jQuery的post请求，请注意这是异步请求
 $.ajax({
 //请求抢id为1的红包
 //根据自己请求修改对应的url和大红包编号
 url: "../userRedPacket/grapRedPacket?redPacketId=1&userId=" + i,
	type:"post", 
 //成功后的方法
 success: function (result) {
	 console.log("成功了！！！")
 },
 error:function(){
	 console.log("失败了！！！")
 }
 });
 }
 });
 </script>
 </head>
 <body>
 	<div>
 		<button id="redpack">抢红包</button>
 	</div>
 </body>
</html>