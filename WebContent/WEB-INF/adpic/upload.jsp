<!DOCTYPE html>
<html>
<head>
    <title>文件上传</title>
    <meta charset="utf-8" />
	<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
	<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<%=basePath%>resources/adpic/css/fileinput.min.css" />
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/fileinput.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>resources/adpic/js/zh.js"></script>
</head>
<body>
  <!-- 按钮触发模态框 -->
    <div style="margin:100px auto;width:15%;">
        <button  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
            点击上传
        </button>
    </div>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align:center;">
                        <label style="text-align: center;font-size: 22px;">文 件 上 传</label>
                    </h4>
                </div>
                <div class="modal-body">
                	 <div class="container-fluid">
				        <form id="form" action="/manage/adpic/doupload" method="post" enctype="multipart/form-data">
				            <div class="row form-group">
				                <div class="panel panel-primary">
				                    <div class="panel-body">
				                        <div class="col-sm-12">
				                            <input id="input-id" class="myfile" name="myfile" multiple type="file" data-show-caption="true">
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </form>
				    </div>
                </div>
               <!--  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary">
                        提交更改
                    </button>
                </div> -->
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
   
    <script>
	    $(function () {
	        initFileInput("input-id");
	    })

	    function initFileInput(ctrlName) {
	        var control = $('#' + ctrlName);
	        control.fileinput({
	            language: 'zh', //设置语言
	            uploadUrl: "doupload", //上传的地址
	            //allowedFileExtensions: ['jpg', 'gif', 'png','doc','docx','pdf','ppt','pptx','txt','zip'],//接收的文件后缀
	            maxFilesNum : 5,//上传最大的文件数量
	            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
	            uploadAsync: true, //默认异步上传
	            showUpload: true, //是否显示上传按钮
	            showRemove : true, //显示移除按钮
	            showPreview : true, //是否显示预览
	            showCaption: false,//是否显示标题
	            browseClass: "btn btn-primary", //按钮样式
	            //dropZoneEnabled: true,//是否显示拖拽区域
	            //minImageWidth: 50, //图片的最小宽度
	            //minImageHeight: 50,//图片的最小高度
	            //maxImageWidth: 1000,//图片的最大宽度
	            //maxImageHeight: 1000,//图片的最大高度
	            maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
	            //minFileCount: 0,
	            maxFileCount: 8, //表示允许同时上传的最大文件个数
	            enctype: 'multipart/form-data',
	            validateInitialCount:true,
	            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
	            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

	        }).on('filepreupload', function(event, data, previewId, index) {     //上传中
	            var form = data.form, files = data.files, extra = data.extra,
	            response = data.response, reader = data.reader;
	            console.log('文件正在上传');
	        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
	            console.log('文件上传成功！'+data.id);

	        }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
	            console.log('文件上传失败！'+data.id);
	        })
	        //异步上传返回结果处理
	        $('.myfile').on('fileerror', function(event, data, msg) {
	            console.log("fileerror");
	            console.log(data);
	        });
	        //异步上传返回结果处理
	        $(".myfile").on("fileuploaded", function(event, data, previewId, index) {
	            console.log("fileuploaded");
	            var ref = $(this).attr("data-ref");
	            $("input[name='" + ref + "']").val(data.response.url);

	        });

	        //同步上传错误处理
	        $('.myfile').on('filebatchuploaderror', function(event, data, msg) {
	            console.log("filebatchuploaderror");
	            console.log(data);
	        });

	        //同步上传返回结果处理
	        $(".myfile").on("filebatchuploadsuccess",
	                function(event, data, previewId, index) {
	                    console.log("filebatchuploadsuccess");
	                    console.log(data);
	                });

	        //上传前
	        $('.myfile').on('filepreupload', function(event, data, previewId, index) {
	            console.log("filepreupload");
	        });
			}
    </script>
</body>
</html>