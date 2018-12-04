<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link href="<%=basePath%>resources/plugin/bootstrap3.3.2/css/bootstrap.min.css" rel="stylesheet" />
		<script src="<%=basePath%>resources/js/jquery.min.js" type="text/javascript"></script>
		<title></title>
		<style>
			<style>
			h1 {
				FONT-SIZE: 24px;
			}
			.js {
				font-size: 13px;
				line-height: 16px;
				width: 720px;
				margin: 15px  auto 10px auto;
			}
			.li{
				background: #ECF9ED;
				padding-right: 5px;
				color: #006600;
			}
			.table-bordered>tbody>tr>td{
				border: 1px solid green;
			}
			.biao {
				width: 40%;
				margin: 0px auto;
            }
			table>thead>tr>th,table>tbody>tr>td{
				text-align: center;
			}
			.table-bordered>thead>tr>th {
					border-bottom-width: 0;
				}
			.table-bordered>thead>tr>th {
					border: 1px solid green !important;
				}
			</style>
	</head>
	<body>
		<h1 style="text-align: center;font-size: 30px;">
		<strong>${title}</strong>
		</h1>
		<div class="biao">
			<table class="table table-bordered">
			<thead>
				<tr>
					<th class="li">序号</th>
					<th class="li">品名及规格</th>
					<th>单位</th>
					<th>单价</th>
				</tr>
			</thead>
			<tbody>
			<input type="hidden" name="fileName" value="${fileName}" id="fileName">
			<c:forEach items="${list}" var="list">
				<tr>
					<td class="li">${list.seq}</td>
					<td class="li">${list.name}</td>
					<td>${list.unit}</td>
					<td>${list.price}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div style="padding:20px" class="text-center">
			<div>
			</div>
			<button type="button" class="btn btn-success" id="success">确认无误，去提交</button>
			<button type="button" class="btn btn-danger" id="error">信息有误，重新上传</button>
		</div>
		</div>
		
		<script type="text/javascript">
		
		
		var fileName=$("#fileName").val();

			$("#success").click(function(){
				window.location.href="importexcel?fileName="+fileName;
			});
			$("#error").click(function(){
				window.location.href="quxiao?fileName="+fileName;
			});
		</script>
	</body>
</html>
