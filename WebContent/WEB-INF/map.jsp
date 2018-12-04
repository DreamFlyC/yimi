<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta http-equiv="pragram" content="no-cache" />
<title>伊米餐饮服务作战地图</title>
<script type="text/javascript">
            var mengvalue = -1;
            //if(mengvalue<0){mengvalue=0;}
            var phoneWidth = parseInt(window.screen.width);
            var phoneScale = phoneWidth / 640;

            var ua = navigator.userAgent;
            if (/Android (\d+\.\d+)/.test(ua)) {
                var version = parseFloat(RegExp.$1);
                // andriod 2.3
                if (version > 2.3) {
                    document.write('<meta name="viewport" content="width=640, minimum-scale = ' + phoneScale + ', maximum-scale = ' + phoneScale + ', target-densitydpi=device-dpi">');
                    // andriod 2.3以上
                } else {
                    document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
                }
                // 其他系统
            } else {
                document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
            }
        </script>
</head>
<style type="text/css">
*{
    margin:0px;
    padding:0px;
}
body, button, input, select, textarea {
    font: 12px/16px Verdana, Helvetica, Arial, sans-serif;
}
#info {
    margin-top: 10px;
}
#container{
	min-width:600px;
	min-height:600px;
}
</style>
<style>
.bdboxwap{width:100%; margin: 20px auto;text-align: center; }
a{ text-decoration: none; }
a:hover{ text-decoration: underline; }
table{text-align: center;}
</style>

<script src="/resources/js/jquery.min.js"></script>

<script charset="utf-8" src="http://map.qq.com/api/js?v=2.exp"></script>
<script>
/*
$(function(){
	
		$.ajax({
				dataType:"json",
				url:"${pageContext.request.contextPath}/manage/loginlog/view",
				success:function(data){
				var markerArr = data; 
	}
});

*/
var markerArr = [           
 <c:forEach items="${pager.datas}" var="item" varStatus="vs" >
<c:choose>
	<c:when test="${vs.index==0}">
	{ title:"${item.weixin_no}",imageOffset: {width:0,height:3} , point: "${item.latitude},${item.longitude}", address:" ${item.content}"}
	</c:when>
	<c:otherwise>
	,{ title: "${item.weixin_no}",imageOffset: {width:0,height:3} , point:"${item.latitude},${item.longitude}", address: "${item.content}"}
	</c:otherwise>
</c:choose>
</c:forEach> ];
     var markers=[];
     var init = function() {
        var center = new qq.maps.LatLng(22.810241,113.814690);
        var map = new qq.maps.Map(document.getElementById('container'),{
            center: center,
            zoom: 15
        });
		
	//////////////////////////////	
		
  //设置Marker自定义图标的属性，size是图标尺寸，该尺寸为显示图标的实际尺寸，origin是切图坐标，该坐标是相对于图片左上角默认为（0,0）的相对像素坐标，anchor是锚点坐标，描述经纬度点对应图标中的位置
            var anchor = new qq.maps.Point(0, 39),
                size = new qq.maps.Size(42, 68),
                origin = new qq.maps.Point(0, 0),
                icon = new qq.maps.MarkerImage(
                    "http://open.map.qq.com/doc/img/nilt.png",
					// "images/pink.png",
                    size,
                    origin,
                    anchor
                );
            //设置Marker阴影图片属性，size是图标尺寸，该尺寸为显示图标的实际尺寸，origin是切图坐标，该坐标是相对于图片左上角默认为（0,0）的相对像素坐标，anchor是锚点坐标，描述经纬度点对应图标中的位置
            var anchorb = new qq.maps.Point(3, -30),
                sizeb = new qq.maps.Size(42, 11),
                origin = new qq.maps.Point(0, 0),
                iconb = new qq.maps.MarkerImage(
                    "http://open.map.qq.com/doc/img/nilb.png",
                    sizeb,
                    origin,
                    anchorb
                );
            var marker = new qq.maps.Marker({
                map: map,
				animation: qq.maps.MarkerAnimation.BOUNCE,//动画效果为反复弹跳
                position: center
            });
			
			marker.setIcon(icon);//中点图标样式
            marker.setShadow(iconb);//中点图标样式设置Marker阴影图片
//////////////////////
    for (var i = 0; i < markerArr.length; i++) {  
     
        var p0 = markerArr[i].point.split(",")[0];  
        var p1 = markerArr[i].point.split(",")[1];
 
        var marker = new qq.maps.Marker({
            map: map,
            position: new qq.maps.LatLng(p1,p0),
			 //设置Marker被添加到Map上时的动画效果为反复弹跳
                //animation: qq.maps.MarkerAnimation.BOUNCE
                //设置Marker被添加到Map上时的动画效果为从天而降
                //animation:qq.maps.MarkerAnimation.DROP
                //设置Marker被添加到Map上时的动画效果为落下
                //animation:qq.maps.MarkerAnimation.DOWN
                //设置Marker被添加到Map上时的动画效果为升起
                //animation:qq.maps.MarkerAnimation.UP
            });
		
		   // marker.setIcon(icon);
           // marker.setShadow(iconb);//设置Marker阴影图片
			
//			//添加信息窗口star
//            var info = new qq.maps.InfoWindow({
//                map: map
//				
//            });
//            info.open();
//		    info.setContent('<div style="width:200px;padding-top:10px;">'+
//            '<img style="float:left;" src="img/infowindow-img.jpg"/> '+
//            '什么情况</div>');
//             info.setPosition(marker.getPosition());
//			//添加信息窗口end

        marker.setTitle(markerArr[i].address)  
        markers.push(marker);
 
     }
      
     for (var i = markers.length - 1; i >= 0; i--) {
        var marker=markers[i]
        qq.maps.event.addListener(marker, 'click', function() {
        //通过this调用对应的marker
        var lat=this.getPosition().lat
        var lng=this.getPosition().lng
         info.open(); 
		    // info.setContent('<div style="width:200px;padding-top:10px;">'+
        //'<img style="float:left;" src="img/infowindow-img.jpg"/> '+
        //'我是个可爱的小孩子</div>');
    
        info.setContent('<div style="width:100px;height:100px; text-align:center;white-space:nowrap;margin:10px;">'+this.getTitle()+'</div>');
       
		info.setPosition(new qq.maps.LatLng(lat,lng)); 
         //console.log(this.getTitle())
     });
     }; console.log(' addListener')
         
     var info = new qq.maps.InfoWindow({
         map: map
     });
      
     console.log('init map')
	 
 function changemapinfo() {
          var info = new qq.maps.InfoWindow({
                map: map
            });
		//var marker = new qq.maps.Marker({
//                map: map,
//				animation: qq.maps.MarkerAnimation.BOUNCE,
//                position: center
//            });
//		  
            //获取标记的可拖动属性
            info.open();

             $.ajax(
									{
										url:"/screen/order/monitor.html?&restarantId=40",
										success:function(msg)
										{
											//$("#orderDataList").html(msg);
														info.setContent('<div style="width:200px;padding-top:10px;">'+
         '<img style="float:left;" src="img/infowindow-img.jpg"/> '+
         'eeee小孩子'+msg+'</div>');
										}
									});	
			 
            info.setPosition(new qq.maps.LatLng('22.81160739716492','113.7996489398117'));
		//	LW.message.show("每个五分钟一次");
		//setTimeout(changemapinfo,1000*60*1);//这里的1000表示1秒有1000毫秒,1分钟有60秒,5表示总共5
            } 
	changemapinfo();		
 // test();   
}
 
function test(){
	//LW.message.show("每个五分钟一次");
 
setTimeout(test,1000*30*1);//这里的1000表示1秒有1000毫秒,1分钟有60秒,5表示总共5分钟
}
</script>
<body>
 <body onLoad="init()">
    <div id="container"></div>
    <div id="info">
</div>
</body>
</html>