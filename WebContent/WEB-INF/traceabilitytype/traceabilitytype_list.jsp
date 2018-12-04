<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.String"%>   
<%
java.util.Date date = new java.util.Date();
DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
String Fordate="";
String Todate="";
try 
{
  Fordate = request.getParameter("Fordate").trim();
 Todate = request.getParameter("Todate").trim();
}
catch (Exception e)
{

}

if(Fordate == null || Fordate.equals("") || Todate == null || Todate.equals("")){
 pageContext.setAttribute("Fordate",formatter.format(date));
pageContext.setAttribute("Todate",formatter.format(date));
}else{
pageContext.setAttribute("Fordate",Fordate);
pageContext.setAttribute("Todate",Todate);
}

 try 
 {
   pageContext.setAttribute("lotteryid",request.getParameter("lotteryid").trim());
 }
catch (Exception e)
{
 
}


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	
	 	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8;"/>
		<%@ include file="../tag.jsp" %>
		<title>${appName}_配送跟踪线路图信息管理</title>
		
		<script type="text/javascript">
		 /*页面加载就开始执行*/
	    $(document).ready(function () {
	        $("#provinceId").change(function () {
	            $.get("traceabilitytype/getCityByProvinceId/"+$("#provinceId").val(),function(data){
	                if(data.status){
	                    var result = "<option>选择城市</option>";
	                    $.each(data.obj,function(n,value){
	                    //	LW.message.show(value.parent_id);
	                        result +="<option value='"+value.id+"'>"+value.name+"</option>";
	                    });
	                    $("#cityId").html('');
	                    $("#cityId").append(result);
	                }
	            },"json");
	        });

	        $("#cityId").change(function () {
	            $.get("traceabilitytype/getAreaByCityId/"+$("#cityId").val(),function(data){
	                if(data.status){
	                    var result = "<option>选择区域</option>";
	                    $.each(data.obj,function(n,value){
	                    	//LW.message.show(value.parent_id);
	                        result +="<option value='"+value.id+"'>"+value.name+"</option>";
	                    });
	                    $("#areaId").html('');
	                    $("#areaId").append(result);
	                }
	            },"json");
	        });
	        
	        $("#areaId").change(function () {
	            $.get("traceabilitytype/getaddressByAreaId/"+$("#areaId").val(),function(data){
	                if(data.status){
	                    var result = "<option>选择地址</option>";
	                    $.each(data.obj,function(n,value){
	                    	//LW.message.show(value.parent_id);
	                        result +="<option value='"+value.id+"'>"+value.name+"</option>";
	                    });
	                    $("#addressId").html('');
	                    $("#addressId").append(result);
	                }
	            },"json");
	        });
	    });
		</script>
		
		<!-- 
		<style type="text/css">
		table thead tr th,table tbody tr td{
	text-align: center;
}
		</style> -->
	</head>
	<body>
		<%@ include file="../top.jsp"%>
   		<%@ include file="../left.jsp"%>
   		<div class="place">
   			<span>位置：</span>
    		<ul class="placeul">
	    		<li><a href="<%=basePath%>manage/index.html">首页</a></li>
	    		<li><a href="javascript:void(0);">溯源系统类型</a></li>
    		</ul>
    	</div>
		<div class="rightContainer">
		<script src="<%=basePath%>resources/My97DatePicker/WdatePicker.js"></script>
			
				<button class="btn btn-primary" onclick="javascript:window.location.reload()">
					<span class="glyphicon glyphicon-refresh"></span> 刷新
				</button>
				<%-- <button class="btn btn-primary" onclick="LW.location.forward('<%=basePath%>traceabilitytype/post.html')">
					<span class="glyphicon glyphicon-plus"></span> 新增
				</button> --%>	
			<div class="cls"></div>
			<table fit="true" fitColumns="true" class="table table-striped table-hover table-bordered">
				<thead>
					<tr>
					   <!--  <th width="5%">序号</th> -->
						<th width="10%">id</th>
						<th width="15%">name</th>
                        <th width="15%">parent_id</th>
                        <th width="10%">point_id</th>
						<th width="15%">type_id</th>
                        <th width="10%">操作</th>
					</tr>
				</thead>
				<tbody>
				<div class="form-group  col-md-3">
                        <label for="provinceId">选择省份:</label>
                      
                        <select data-placeholder="名称" id="provinceId" name="name" class="form-control"
                                data-rel="chosen">
                                 <option>选择省份</option>
                            <c:if test="${!empty nameList}">
                                <c:forEach items="${nameList}" var="name">
                                    <option value="${name.id}">${name.name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                      <div class="form-group   col-md-3">
                        <label for="cityId">选择城市:</label>
                        <select data-placeholder="城市" data-style="btn-info" name="city" id="cityId" class="form-control" data-rel="chosen">
                            <option>选择城市</option>
                        </select>
                    </div>
                    <div class="form-group   col-md-3" >
                        <label for="areaId">选择区域:</label>
                        <select data-placeholder="区域" name="area" id="areaId" class="form-control" data-rel="chosen">
                            <option>选择区域</option>
                        </select>
                    </div>
                     <div class="form-group   col-md-3" >
                        <label for="addressId">选择地址:</label>
                        <select data-placeholder="地址" name="address" id="addressId" class="form-control" data-rel="chosen">
                            <option>选择地址</option>
                        </select>
                    </div>
                    
                    <c:forEach items="${nameList}" var="item" varStatus="stauts" >
							<tr id="tr${item.id}">
								<%-- <td>${stauts.index+1}</td> --%>
								<td id="${item.id}">${item.id}</td>
								<td id="view" onclick="show(${item.id},1);">${item.name}
								<i class="fa fa-sort-desc fa${item.id}" aria-hidden="true" style="float: right;"></i>
								</td>
								<td>${item.parent_id}</td>
								<td>${item.point_id}</td>
								<td>${item.type_id}</td>
								<td>
							       <a href="<%=basePath%>traceabilitytype/add/${item.id}">新增</a> 
					               <a href="<%=basePath%>traceabilitytype/${item.id}.html">编辑</a>  
					               <a href="javascript:void(0)" onclick="LW.traceabilitytype.delete(${item.id},${item.parent_id})" >删除</a>
					            </td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<span>当前${pager.pageNo}/${pager.totalPage} 共${pager.totalCount}条数据</span>
				<div class="btn-group pull-right" role="group">
			      	<a href="<%=basePath%>traceabilitytype.html" class="btn btn-default">首页</a>
			      	<a href="<%=basePath%>traceabilitytype.html?pageNo=${pager.prePage}" class="btn btn-default">上一页</a>
			      	<a href="<%=basePath%>traceabilitytype.html?pageNo=${pager.nextPage}" class="btn btn-default">下一页</a>
			      	<a href="<%=basePath%>traceabilitytype.html?pageNo=${pager.totalPage}" class="btn btn-default">尾页</a>
			    </div>
			</nav>
    	</div>
    	<div class="cls"></div>
    	<script type="text/javascript">
			$("#page_traceabilitytype").parent().attr("class","active");
		</script>
    	<%@ include file="../foot.jsp"%>
    	
    	
    	<script type="text/javascript">	
    	//var arr=["└","&nbsp;└","&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└"];
		var arr=[];
		var size=10;
		var cc="└";
		var dd="&nbsp;";
			arr[0]="";
			arr[1]=cc;
		for(var i=2;i<=size;i++){
			arr[i]=dd+cc;
			dd+="&nbsp;";
		}
    	
    	function show(id,s){
    		//LW.message.show(id);
			s++;
			//第一次点击时将箭头由下变为上
			/* if($(".fa"+id).hasClass("fa-sort-desc")){
				
			$(".fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
			} */
			//LW.message.show($(".tr"+id).length);  起始class=".tr"+id的长度为0
			if($(".tr"+id).length>0)
			{
				if($(".tr"+id).is(":visible"))
				{
						//隐藏
						hideDv(id);
						/*  if($("#fa"+id).hasClass("fa-sort-asc")){
						$("#fa"+id).removeClass("fa-sort-asc").addClass("fa-sort-desc");
						}  */
				}else{					
					$(".tr"+id).show();
					 /* if($("#fa"+id).hasClass("fa-sort-desc")){
						$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
						}  */
					//$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
				}
			}else{
				$.get("traceabilitytype/getCityByProvinceId/"+id,function(data){
	                //LW.message.show(data);
					if(data.status){
	                    var result = "";
	                   
	                    $.each(data.obj,function(n,value){
	                    	
	                       if(value.point_id==null){
	                    	   value.point_id="0";
	                       }
	                       if(value.type_id==null){
	                    	   value.type_id="0";
	                       }
	                       result+="<tr id='tr"+value.id+"' class='tr"+id+"'>";
	                       result+="<td>"+value.id+"</td>"+
	                       "<td onclick='show("+value.id+","+s+");'>"+arr[s]+value.name+
	                       "<i id='fa"+value.id+"'  class='fa fa-sort-desc fa"+id+"' aria-hidden='true' style='float: right;'></i>"+
	                       "</td>"+
	                       "<td>"+value.parent_id+"</td>"+
	                       "<td>"+value.point_id+"</td>"+
	                       "<td>"+value.type_id+"</td>"+
	                      "<td>";
	                       result+= "<a href='<%=basePath%>traceabilitytype/add/"+value.id+"'>&nbsp;新增</a>";
	                       result+="<a href='<%=basePath%>traceabilitytype/"+value.id+".html'>&nbsp;编辑</a>";
	                       result+="<a href='javascript:void(0)' onclick='LW.traceabilitytype.delete("+value.id+","+value.parent_id+")' >&nbsp;删除</a>";
	                       result+="</td>";
	                       result+="</tr>";
	                    });
	                   // $("#test").html('');
	                    $("#tr"+id).after(result);
	                	$.each(data.obj,function(n,value){
							$.get("traceabilitytype/getCityByProvinceId/"+value.id,function(data1){
	                    	    	//LW.message.show(value.id);
	                    		var sj=JSON.parse(data1);
	                    	    if(sj.obj.length==0&&sj.obj==""){
	                    			 //$(".fa"+value.parent_id).removeClass("fa-sort-desc").removeClass("fa-sort-asc"); 
	                    	    	$("#tr"+value.id).find(".fa-sort-desc").removeClass("fa-sort-desc");  
	                    	    } 
	                    	 });
						 });
						
	                	//$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
	                }
	            },"json"); 
			}
			
			if($("#fa"+id).hasClass("fa-sort-desc")){
				$("#fa"+id).removeClass("fa-sort-desc").addClass("fa-sort-asc");
			}else if($("#fa"+id).hasClass("fa-sort-asc")){
				$("#fa"+id).removeClass("fa-sort-asc").addClass("fa-sort-desc");
			}
		}
		 function hideDv(id) {
		     $(".tr" + id).hide();
			 $(".tr" + id).find(".fa-sort-asc").removeClass("fa-sort-asc").addClass("fa-sort-desc");
		     childDv(id);
		 }
		 function childDv(id) {
		     $(".tr" + id).each(function(){
					var cid = $(this).attr("id").replace("tr", ""); //获取样式id并将tr替换，获取自己的id
					if ($(".tr" + cid).length > 0) {
						$(".tr" + cid).each(function (e) {
							$(".tr" + cid).find(".fa-sort-asc").removeClass("fa-sort-asc").addClass("fa-sort-desc");
							$(this).hide();
							childDv(cid);
						});
					}
				});
		 }

		 </script>
		
	</body>
</html>