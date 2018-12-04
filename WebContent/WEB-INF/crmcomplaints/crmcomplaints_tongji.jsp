<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    java.util.Date date = new java.util.Date();
    DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
    String Fordate = "";
    String Todate = "";
    try {
        Fordate = request.getParameter("Fordate").trim();
        Todate = request.getParameter("Todate").trim();
    } catch (Exception e) {
    }
    if (Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")) {
        pageContext.setAttribute("Fordate", formatter.format(date));
        pageContext.setAttribute("Todate", formatter.format(date));
    } else {
        pageContext.setAttribute("Fordate", Fordate);
        pageContext.setAttribute("Todate", Todate);
    }
    try {
        pageContext.setAttribute("lotteryid", request.getParameter("lotteryid").trim());
    } catch (Exception e) {
    }
%>
<html>
<head>
    <title>客户投诉统计</title>
    <%@ include file="../tag.jsp" %>
    <script src="<%=basePath%>resources/js/echarts.min.js"></script>

    <style type="text/css">
        #main {
            height: 400px;
            margin: 0px auto;
        }

        .search {
            left: 0;
            position: relative;
        }

        .sup-xx {
            color: #c9d0c6;
            position: absolute;
            top: 5px;
            right: 24px;
            font-size: 24px;
            cursor: pointer;
        }

        .sup-xx:hover {
            color: #a3a9a0;
        }

        .dateText {
            float: left;
            height: 34px;
            line-height: 34px;
            text-align: right;
            margin-left: 15px;
        }
    </style>
</head>
<body>
<%@ include file="../top.jsp" %>
<%@ include file="../left.jsp" %>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li>首页</li>
        <li><a href="<%=basePath%>manage/crmcomplaints.html">客户投诉管理列表</a></li>
    </ul>
</div>
<div class="rightContainer">
    <div>
        <button class="btn btn-primary" onclick="javscript:window.history.go(-1);">
            <span class="glyphicon glyphicon-arrow-left"></span> 返回
        </button>
        <button class="btn btn-primary" onclick="javascript:window.location.reload()" style="margin-right: 10px">
            <span class="glyphicon glyphicon-refresh"></span> 刷新
        </button>
    </div>
    <div style="padding:20px 0px;">
        <button class="btn btn-success" onclick="getMonthByCode(1)" style="float: left;margin-left:100px;margin-right: 10px">
            <span class=""></span> 查询本月
        </button>
        <button class="btn btn-danger" onclick="getMonthByCode(2)" style="float: left;">
            <span class=""></span> 上一个月
        </button>
        <div class="dateText">
            <label for="sDate">查询条件：</label>
        </div>
        <div class="col-md-2">
            <select class="form-control" id="select">
                <option value="1">按日期查询</option>
                <option value="2">按月查询</option>
                <option value="3">按年查询</option>
            </select>
        </div>
        <div class="dateText">
            <label for="sDate">日期：</label>
        </div>
        <div class="col-md-2" style="position: relative;">
            <input type="text" name="sDate" id="sDate" autocomplete="off" placeholder="开始日期" maxlength="20" readonly
                   class="form-control" value="">
        </div>
        <div class="col-md-2" style="position: relative;">
            <input type="text" name="eDate" id="eDate" autocomplete="off" placeholder="结束日期" maxlength="20" readonly
                   class="form-control" value="">
        </div>
        <div class="col-md-1">
            <input type="button" id="submit" value="查&nbsp;询" class="form-control btn-primary">
        </div>
        <div style="clear: both"></div>
    </div>
    <h1 class="text-center" style="margin:10px 0px 10px;" id="tongji">投诉统计图</h1>
    <div id="main"></div>
</div>
<script>
    var cdate = [];
    var ctype = [];
    var series = [];

    function wh(cdate, ctype, series) {
        var dom = document.getElementById("main");
        var myChart = echarts.init(dom);
        option = null;
        option = {
            xAxis: {
                type: 'category',
                data: cdate,
            },
            yAxis: {
                type: 'value',
                name: "投诉总量",
            },
            legend: {
                data: ctype,
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow',
                    label: {
                        show: true
                    }
                }
            },
            dataZoom: [
                {
                    show: true,
                    start: 0,
                    end: 100
                },
                {
                    type: 'inside',
                    start: 94,
                    end: 100
                },
                {
                    show: true,
                    yAxisIndex: 0,
                    filterMode: 'empty',
                    width: 30,
                    height: '80%',
                    showDataShadow: false,
                    left: '93%'
                }
            ],
            toolbox: {
                show: true,
                orient: 'vertical',
                left: 'right',
                top: 'center',
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            calculable: true,
            series: series,
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
        var zoomSize = 6;
        myChart.on('click', function (params) {
            console.log(cdate[Math.max(params.dataIndex - zoomSize / 2, 0)]);
            myChart.dispatchAction({
                type: 'dataZoom',
                startValue: cdate[Math.max(params.dataIndex - zoomSize / 2, 0)],
                endValue: cdate[Math.min(params.dataIndex + zoomSize / 2, series.length - 1)]
            });
        });
    }

    $(function () {
        //默认查询当前月份
        var status = 0;
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var sDate = year + "-" + month;
        var eDate = sDate;
        submitChange(status, sDate, eDate);
        $("#sDate,#eDate").on("click", function () {
            WdatePicker({
                readOnly: true,
                dateFmt: 'yyyy-MM-dd'
            });
        });
    });
</script>

<script>
    function formatNum(data) {
        var typeCount = data.typeCount;
        var arr = data.msg;
        var map = {};
        var dest = [];
        var realnum = [];
        for (var i = 0; i < arr.length; i++) {
            var ai = arr[i];
            if (!map[ai.date]) {
                var arrnum = new Array(typeCount);
                for (ek = 0; ek < arrnum.length; ek++) {
                    arrnum[ek] = 0;
                }
                arrnum[ai.type - 1] = ai.num;
                dest.push({
                    date: ai.date,
                    num: arrnum
                });
                map[ai.date] = ai;
            } else {
                for (var j = 0; j < dest.length; j++) {
                    var dj = dest[j];
                    if (dj.date == ai.date) {
                        dj.num[ai.type - 1] = ai.num;
                        break;
                    }
                }
            }
        }
        for (var i = 0; i < typeCount; i++) {
            var arrnewnum = new Array(dest.length);
            for (var j = 0; j < dest.length; j++) {
                arrnewnum[j] = dest[j].num[i];
            }
            realnum[i] = arrnewnum;
        }
        return {
            dest: dest,
            realnum: realnum
        }
    }

    $("#submit").click(function () {
        var key = true;
        if ($("#sDate").val() == '') {
            LW.message.show("请选择开始日期");
            key = false;
        }
        if ($("#eDate").val() == '') {
            LW.message.show("请选择结束日期");
            key = false;
        }
        if ($("#sDate").val() > $("#eDate").val()) {
            LW.message.show("日期不合法，请重新选择");
            $("#sDate").val("");
            $("#eDate").val("");
            key = false;
        }
        if (key) {
            var status = $("#select").val();
            var sDate = $("#sDate").val();
            var eDate = $("#eDate").val();
            submitChange(status, sDate, eDate);
            if (status == 3) {
                $("#tongji").html(sDate + "年至" + eDate + "年投诉统计图");
            } else if (status == 2) {
                $("#tongji").html(sDate.replace("-", "年") + "月至" + eDate.replace("-", "年") + "月投诉统计图");
            } else if (status == 1) {
                $("#tongji").html(sDate + "日至" + eDate + "日投诉统计图");
            }
        }
    });

    function getMonthByCode(code) {
        var status = 0;
        var date = new Date();
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        if(code==1){
            var sDate = year + "-" + month;
        }
        if(code==2){
            var sDate = year + "-" + (month - 1);
        }
        var eDate = sDate;
        submitChange(status, sDate, eDate);
        $("#tongji").html(sDate.replace("-", "年") + "月统计图");
        $("#sDate").val(sDate);
        $("#eDate").val(eDate);
        $("#select").val(2);
        $("#sDate,#eDate").off("click");
        $("#sDate,#eDate").on("click", function () {
            WdatePicker({
                readOnly: true,
                dateFmt: 'yyyy-MM'
            });
        });
    }

    $("#select").change(function () {
        var status = $(this).val();
        $("#sDate,#eDate").val("");
        $("#sDate,#eDate").off("click");
        if (status == 1) {
            $("#sDate,#eDate").on("click", function () {
                WdatePicker({
                    readOnly: true,
                    dateFmt: 'yyyy-MM-dd'
                });
            });
        }
        if (status == 2) {
            $("#sDate,#eDate").on("click", function () {
                WdatePicker({
                    readOnly: true,
                    dateFmt: 'yyyy-MM'
                });
            });
        }
        if (status == 3) {
            $("#sDate,#eDate").on("click", function () {
                WdatePicker({
                    readOnly: true,
                    dateFmt: 'yyyy'
                });
            });
        }
    });

    function submitChange(status, sDate, eDate) {
        var cdate = [];
        var ctype = [];
        var series = [];
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {
                "status": status,
                "sDate": sDate,
                "eDate": eDate
            },
            crossDomain: true,
            //url: "manage/crmcomplaints/Listtongji.html",
            url: "/traceability/manage/crmcomplaints/Listtongji",
            success: function (data) {
                console.log(data);
                for (var i = 0; i < data.name.length; i++) {
                    ctype.push(data.name[i]);
                }
                var cos = formatNum(data);
                for (var i = 0; i < cos.dest.length; i++) {
                    if (status == 0) {
                        cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                    } else if (status == 1) {
                        cdate.push(new Date(cos.dest[i].date).format("yyyy-MM-dd"));
                    } else if (status == 2) {
                        cdate.push(new Date(cos.dest[i].date).format("yyyy-MM"));
                    } else if (status == 3) {
                        cdate.push(new Date(cos.dest[i].date).format("yyyy"));
                    }


                }
                for (var i = 0; i < data.typeCount; i++) {
                    series.push({
                        name: ctype[i],
                        type: 'bar',
                        label: {
                            normal: {
                                show: true,
                                formatter: function (params) {
                                    if (params.value > 0) {
                                        return params.value;
                                    } else {
                                        return '';
                                    }
                                },
                            }
                        },
                        barGap:'0',
                        data: cos.realnum[i],
                    });
                }
                wh(cdate, ctype, series);
            },
            error: function (data) {
                console.log("失败：" + data);
            }
        });
    }

    Date.prototype.format = function (format) {
        var o = {
            "M+": this.getMonth() + 1, //month
            "d+": this.getDate(), //day
            "h+": this.getHours(), //hour
            "m+": this.getMinutes(), //minute
            "s+": this.getSeconds(), //second
            "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
            "S": this.getMilliseconds() //millisecond
        }
        if (/(y+)/.test(format)) format = format.replace(RegExp.$1,
            (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(format))
                format = format.replace(RegExp.$1,
                    RegExp.$1.length == 1 ? o[k] :
                        ("00" + o[k]).substr(("" + o[k]).length));
        return format;
    }
</script>


</body>
</html>
