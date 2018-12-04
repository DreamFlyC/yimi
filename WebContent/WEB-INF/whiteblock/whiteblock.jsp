<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <script src="<%=basePath%>resources/whiteblock/js/jquery.min.js"></script>
    <script src="<%=basePath%>resources/whiteblock/js/jquery-ui.min.js"></script>

    <link href="<%=basePath%>resources/whiteblock/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%=basePath%>resources/whiteblock/css/jquery-ui.min.css" rel="stylesheet" />
    <link href="<%=basePath%>resources/whiteblock/css/liMarquee.css" rel="stylesheet" />
    <title>别踩白块儿</title>
    <style>
        .wrap{
            width:100%;
        }

        .clear {
            clear: both;
        }

        .defaultblock {
            float: left;
            width: 25%;
            height: 160px;
            border-left: 1px solid #808080;
            border-bottom: 1px solid #808080;
        }

        .blackblock {
            background-color: #000;
        }

        .whiteblock {
            background-color: #fff;
        }

        .begingame{
            width:20px;
            font-size:20px;
            margin:17px auto;
        }
    </style>
</head>
<body>
    
    <div class="wrap">
        <div class="clear">
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
        </div>
        <div class="clear">
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
        </div>
        <div class="clear">
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
        </div>
        <div class="clear">
            <div class="defaultblock whiteblock" id="begin"><div class="begingame">开始游戏</div></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
            <div class="defaultblock whiteblock"></div>
        </div>
    </div>
    <script>
        //设置每个块的高度
        $(function () {
            window.wrapHeight = $(".wrap").css("height", $(window).height());
        });
        //生成每一行的div
        function clearDiv(num) {
            var result = "";
            for (var i = 0; i < num; i++) {
                result += "<div class='clear' id='clear" + i + "'>";
                result += "<div class='defaultblock whiteblock'></div>";
                result += "<div class='defaultblock whiteblock'></div>";
                result += "<div class='defaultblock whiteblock'></div>";
                result += "<div class='defaultblock whiteblock'></div>";
                result += "</div>";
            }
            $(".wrap").append(result);
        }
        //随机给某一行的一个或两个黑块
        function randBlack(index) {  //生成一个黑块
            var blackNum = Math.floor(Math.random() * 2 + 1); //黑快个数 1--2
            //   console.log("blackNum:" + blackNum);
            for (var i = 0; i < blackNum; i++) {
                var black = Math.floor(Math.random() * 4); //随机0-3
              //  console.log("black:" + black);
                $("#clear" + index).children().eq(black).addClass("blackblock").removeClass("whiteblock");
            }
            return black;
        }
        //给每一行加上黑块
        function addBlack() {
            $(".wrap").children().each(function (index) {
              //  console.log("index:" + index);
                $("#clear" + index).each(function (ind) {
                //    console.log("ind:" + ind);
                    randBlack(index);
                });
               // console.log("---------");
            });
            var speed = 100;
           
            //setInterval(function () {
            //    speed += 50;
            //    console.log(speed);
            //}, 1000 * 20);
            //页面div滚动
            $('.wrap').liMarquee({
                direction: 'down',
                scrollamount: 200,
                hoverstop: false
            });
        }

        //每个黑块的点击事件
        function clickBlack() {
            for (var i = 0; i < divNum; i++) {
                $("#clear" + i).each(function () {
                    $(this).find(".blackblock").click(function () {  //找到所有的黑块
                        // alert(1);
                        $(this).removeClass("blackblock").addClass("whiteblock"); //点击黑块消失
                        //当这一行所有黑块都消失时，移除这一行
                        var blacklength = $(this).siblings(".blackblock").length;
                        if (blacklength == 0) {

                            var clearlength = $(this).parent().nextAll().children(".blackblock").length; //获取div为clear的length
                            console.log(clearlength);
                            if (clearlength==0) {
                                $(this).parent().remove();
                            }
                        }

                    });
                    $(this).find(".whiteblock").click(function () {  //找到所有的黑块
                        alert("游戏结束！");
                        $(this).parent().parent().remove();
                        var result = "";
                        result += "<button class='btn btn-default' style='position: relative;left: 40%;top: 300px;' onclick='javascript:window.location.reload()'>";
                        result += "重新开始";
                        result += "</button>";
                        $("body").html(result);
                    });
                });
            }
        }

        $("#begin").click(function () {
            window.divNum = 1000;
            clearDiv(divNum); //创建div
            addBlack();
            clickBlack()//添加黑块
        });
    </script>
    <script src="<%=basePath%>resources/whiteblock/js/jquery.liMarquee.js"></script>
    
</body>
</html>