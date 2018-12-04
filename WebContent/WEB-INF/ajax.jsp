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
<title>ajax跨域</title>
<script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function access(){
		var user="吴慧";
		$.ajax({
			url:"localhost:8081/manage/crmstockinoroutlogitem/getuser?user="+user,
			error:function(){
				console.log("失败");
			},
			success:function(){
				console.log("成功");
			}
		});
	}
</script>
</head>
<body>
	<button onclick="access()">点击</button>
</body>
</html>