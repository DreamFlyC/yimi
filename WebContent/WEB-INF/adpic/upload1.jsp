<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
   	<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/bootstrap.min.css" />
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/jquery.min.js"></script>
    <title>文件上传-带进度条</title>
	<style type="text/css">
		.file{
			width:80%;
			float: left;
			border-radius: 4px 0px 0px 4px;
		}
		.uploadbtn{
			float: left;
			border-radius: 0px 4px 4px 0px;
		}
		.con{
			width: 40%;
			height: 50px;
			margin-top:400px;
			float:left;
			position:relative;
			left:50%;
		}
		.wrap{	
			width: 100%;
			height: 50px;
			position:relative;
			left:-50%;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="con">
		<div class="wrap">
			<form id="uploadForm">
				<input type="file" name="file" id="file" class="form-control file">
				<button type="button" class="btn btn-primary uploadbtn" onclick="UploadFile()">上传</button>
			</form>
		</div>
	</div>
	<div class="progress" style="width: 40%;position: fixed;top: 300px;height: 30px;left:50%;margin-left: -20%;">
		<div id="progressactive"
			class="progress-bar progress-bar-striped active" role="progressbar"
			aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
			style="width: 0%">
		</div>
		<span id="sr-only"></span>
	</div> 
<script type="text/javascript">
	function UploadFile() {
		var fileObj = document.getElementById("file").files[0]; // js 获取文件对象
		var FileController = "http://127.0.0.1:8080/traceability/manage/adpic/uploadfile"; // 接收上传文件的后台地址 
		// FormData 对象
		var form = new FormData($("#uploadForm")[0]);//创建一个form对象
		// XMLHttpRequest 对象
		var xhr = new XMLHttpRequest();//创建XMLHttpRequest对象
		xhr.open("post", FileController, true);//打开连接，(访问类型，地址，是否异步)
		xhr.onload = function() {//请求完成后执行  里面可用
			if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
				//console.log(xhr.responseText);//后台返回的数据
			} else {
				//console.log("Request was unsuccessful: " + xhr.status);//状态
				//0	UNSENT (未打开),1	OPENED  (未发送),2 HEADERS_RECEIVED (已获取响应头),3	LOADING (正在下载响应体),4	DONE (请求完成)
			}
		};
		xhr.upload.addEventListener("progress", progressFunction, false);//添加上传监听器方法
		xhr.send(form);//发送请求
		$(".uploadbtn").attr("disabled","disabled");
	}
 
	function progressFunction(evt) {
 
		var progressBar = document.getElementById("progressactive");//获取进度条对象
		var percentageDiv = document.getElementById("sr-only");//获取展示进度数据对象
		if (evt.lengthComputable) {
			var max = evt.total;//文件总大小
			var loaded = evt.loaded;//已上传文件大小
			console.log(max);
			progressBar.style.width = Math.round(loaded / max * 100) + "%";
			percentageDiv.innerHTML = Math.round(loaded / max * 100) + "%";
			if (evt.loaded == evt.total) {
				percentageDiv.innerHTML = "上传完成";
				$(".uploadbtn").removeAttr("disabled");
			}
		}
 
	}
</script> 

</body>
</html>
